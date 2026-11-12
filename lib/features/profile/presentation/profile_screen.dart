import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../app/theme_mode_controller.dart';
import '../../../core/design/hisaab_spacing.dart';
import '../../../core/widgets/page_heading.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  static const themeSelectorKey = Key('theme-mode-selector');

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeModeProvider);
    final colors = Theme.of(context).colorScheme;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(HisaabSpacing.page),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const PageHeading(
            title: 'Profile',
            description: 'Set the tone for a private, practical money space.',
          ),
          const SizedBox(height: HisaabSpacing.xl),
          _SettingsGroup(
            title: 'Appearance',
            children: <Widget>[
              Text(
                'Choose how HISAAB looks.',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: HisaabSpacing.md),
              SegmentedButton<ThemeMode>(
                key: themeSelectorKey,
                showSelectedIcon: false,
                segments: const <ButtonSegment<ThemeMode>>[
                  ButtonSegment(
                    value: ThemeMode.system,
                    label: Text('System'),
                    icon: Icon(Icons.brightness_auto_outlined),
                  ),
                  ButtonSegment(
                    value: ThemeMode.light,
                    label: Text('Light'),
                    icon: Icon(Icons.light_mode_outlined),
                  ),
                  ButtonSegment(
                    value: ThemeMode.dark,
                    label: Text('Dark'),
                    icon: Icon(Icons.dark_mode_outlined),
                  ),
                ],
                selected: <ThemeMode>{themeMode},
                onSelectionChanged: (selection) {
                  if (selection.isNotEmpty) {
                    ref
                        .read(themeModeProvider.notifier)
                        .setMode(selection.first);
                  }
                },
              ),
            ],
          ),
          const SizedBox(height: HisaabSpacing.lg),
          _SettingsGroup(
            title: 'Privacy',
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Icon(Icons.phonelink_lock_outlined, color: colors.primary),
                  const SizedBox(width: HisaabSpacing.md),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Local by design',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        const SizedBox(height: HisaabSpacing.xs),
                        Text(
                          'No account, cloud sync, or runtime network service.',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: HisaabSpacing.lg),
          const _LaterSettings(),
        ],
      ),
    );
  }
}

class _SettingsGroup extends StatelessWidget {
  const _SettingsGroup({required this.title, required this.children});

  final String title;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(HisaabSpacing.lg),
      decoration: BoxDecoration(
        color: colors.surface,
        borderRadius: BorderRadius.circular(HisaabSpacing.radius),
        border: Border.all(color: colors.outlineVariant),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(title, style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: HisaabSpacing.md),
          ...children,
        ],
      ),
    );
  }
}

class _LaterSettings extends StatelessWidget {
  const _LaterSettings();

  @override
  Widget build(BuildContext context) {
    return _SettingsGroup(
      title: 'More settings later',
      children: <Widget>[
        Text(
          'Accounts, payment methods, data management, and app lock '
          'belong to later feature phases.',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );
  }
}
