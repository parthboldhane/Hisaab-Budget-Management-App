import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hisaab/app/app.dart';
import 'package:hisaab/core/widgets/app_bottom_navigation.dart';
import 'package:hisaab/features/profile/presentation/profile_screen.dart';

void main() {
  Future<void> pumpApp(WidgetTester tester) async {
    await tester.pumpWidget(const ProviderScope(child: HisaabApp()));
    await tester.pumpAndSettle();
  }

  testWidgets('the app starts on Home', (tester) async {
    await pumpApp(tester);

    expect(find.text('Your finances, clearly.'), findsOneWidget);
    expect(_navigationBar(tester).selectedIndex, 0);
  });

  testWidgets('all five navigation destinations can be selected', (
    tester,
  ) async {
    await pumpApp(tester);
    const destinations = <String>[
      'Home',
      'Transactions',
      'Insights',
      'Budgets',
      'Profile',
    ];

    for (var index = 0; index < destinations.length; index++) {
      await tester.tap(
        find.descendant(
          of: find.byKey(AppBottomNavigation.navigationKey),
          matching: find.text(destinations[index]),
        ),
      );
      await tester.pumpAndSettle();

      expect(_navigationBar(tester).selectedIndex, index);
    }

    expect(find.text('Choose how HISAAB looks.'), findsOneWidget);
  });

  testWidgets('Quick Add explains the later-phase choices', (tester) async {
    await pumpApp(tester);
    await tester.tap(find.byKey(const Key('quick-add-button')));
    await tester.pumpAndSettle();

    expect(find.text('Expense').last, findsOneWidget);
    expect(find.text('Income').last, findsOneWidget);
    expect(find.text('Transfer').last, findsOneWidget);
    expect(
      find.text(
        'These entry types are planned for a later feature phase. '
        'Nothing will be saved here yet.',
      ),
      findsOneWidget,
    );
  });

  testWidgets('theme selection updates app state and survives navigation', (
    tester,
  ) async {
    await pumpApp(tester);
    await _selectDestination(tester, 'Profile');
    await tester.tap(find.text('Dark'));
    await tester.pumpAndSettle();

    expect(_app(tester).themeMode, ThemeMode.dark);
    expect(_selectedTheme(tester), <ThemeMode>{ThemeMode.dark});

    await _selectDestination(tester, 'Home');
    await _selectDestination(tester, 'Profile');

    expect(_app(tester).themeMode, ThemeMode.dark);
    expect(_selectedTheme(tester), <ThemeMode>{ThemeMode.dark});
  });

  test('foundation has no runtime network package or permission', () async {
    final pubspec = await File('pubspec.yaml').readAsString();
    final dependencyBlock = RegExp(
      r'^dependencies:\s*\n(.*?)^dev_dependencies:',
      multiLine: true,
      dotAll: true,
    ).firstMatch(pubspec);
    expect(dependencyBlock, isNotNull);
    final runtimeDependencies = dependencyBlock!.group(1)!;
    final runtimePackageNames = RegExp(
      r'^  ([a-zA-Z0-9_]+):',
      multiLine: true,
    ).allMatches(runtimeDependencies).map((match) => match.group(1)).toSet();

    expect(runtimePackageNames, <String>{
      'flutter',
      'flutter_riverpod',
      'go_router',
    });

    for (final manifestPath in <String>[
      'android/app/src/main/AndroidManifest.xml',
      'android/app/src/debug/AndroidManifest.xml',
      'android/app/src/profile/AndroidManifest.xml',
    ]) {
      final manifest = await File(manifestPath).readAsString();
      expect(manifest, isNot(contains('android.permission.INTERNET')));
    }
  });
}

Future<void> _selectDestination(WidgetTester tester, String label) async {
  await tester.tap(
    find.descendant(
      of: find.byKey(AppBottomNavigation.navigationKey),
      matching: find.text(label),
    ),
  );
  await tester.pumpAndSettle();
}

NavigationBar _navigationBar(WidgetTester tester) =>
    tester.widget<NavigationBar>(find.byKey(AppBottomNavigation.navigationKey));

MaterialApp _app(WidgetTester tester) =>
    tester.widget<MaterialApp>(find.byType(MaterialApp));

Set<ThemeMode> _selectedTheme(WidgetTester tester) => tester
    .widget<SegmentedButton<ThemeMode>>(
      find.byKey(ProfileScreen.themeSelectorKey),
    )
    .selected;
