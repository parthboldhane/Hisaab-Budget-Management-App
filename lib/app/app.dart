import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app_theme.dart';
import 'router.dart';
import 'theme_mode_controller.dart';

class HisaabApp extends ConsumerWidget {
  const HisaabApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeModeProvider);
    final router = ref.watch(appRouterProvider);

    return MaterialApp.router(
      title: 'HISAAB',
      debugShowCheckedModeBanner: false,
      theme: HisaabAppTheme.light,
      darkTheme: HisaabAppTheme.dark,
      themeMode: themeMode,
      routerConfig: router,
    );
  }
}
