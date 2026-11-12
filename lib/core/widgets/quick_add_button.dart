import 'package:flutter/material.dart';

import '../design/hisaab_spacing.dart';

class QuickAddButton extends StatelessWidget {
  const QuickAddButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      key: const Key('quick-add-button'),
      onPressed: () => showQuickAddSheet(context),
      icon: const Icon(Icons.add_rounded),
      label: const Text('Quick add'),
    );
  }
}

Future<void> showQuickAddSheet(BuildContext context) {
  return showModalBottomSheet<void>(
    context: context,
    useSafeArea: true,
    showDragHandle: true,
    builder: (sheetContext) => SingleChildScrollView(
      child: _QuickAddSheet(
        onSelect: (label) {
          Navigator.of(sheetContext).pop();
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Text(
                  '$label entry will be introduced in a later feature phase.',
                ),
              ),
            );
        },
      ),
    ),
  );
}

class _QuickAddSheet extends StatelessWidget {
  const _QuickAddSheet({required this.onSelect});

  final ValueChanged<String> onSelect;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.fromLTRB(
        HisaabSpacing.page,
        0,
        HisaabSpacing.page,
        HisaabSpacing.lg,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('Quick add', style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: HisaabSpacing.sm),
          Text(
            'These entry types are planned for a later feature phase. '
            'Nothing will be saved here yet.',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: HisaabSpacing.md),
          _QuickAddChoice(
            icon: Icons.remove_circle_outline_rounded,
            label: 'Expense',
            color: colors.error,
            onTap: () => onSelect('Expense'),
          ),
          _QuickAddChoice(
            icon: Icons.add_circle_outline_rounded,
            label: 'Income',
            color: colors.primary,
            onTap: () => onSelect('Income'),
          ),
          _QuickAddChoice(
            icon: Icons.swap_horiz_rounded,
            label: 'Transfer',
            color: colors.secondary,
            onTap: () => onSelect('Transfer'),
          ),
        ],
      ),
    );
  }
}

class _QuickAddChoice extends StatelessWidget {
  const _QuickAddChoice({
    required this.icon,
    required this.label,
    required this.color,
    required this.onTap,
  });

  final IconData icon;
  final String label;
  final Color color;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      minTileHeight: HisaabSpacing.minTouchTarget,
      contentPadding: EdgeInsets.zero,
      leading: Icon(icon, color: color),
      title: Text(label),
      subtitle: const Text('Introduced in a later feature phase'),
      onTap: onTap,
    );
  }
}
