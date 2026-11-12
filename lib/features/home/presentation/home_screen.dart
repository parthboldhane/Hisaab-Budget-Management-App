import 'package:flutter/material.dart';

import '../../../core/design/hisaab_spacing.dart';
import '../../../core/widgets/empty_state.dart';
import '../../../core/widgets/page_heading.dart';
import '../../../core/widgets/quick_add_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(HisaabSpacing.page),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const PageHeading(
            title: 'Your finances, clearly.',
            description:
                'A calm, private place for your day-to-day money. '
                'Your information stays on this device.',
          ),
          const SizedBox(height: HisaabSpacing.xl),
          const _LocalOverviewPanel(),
          const SizedBox(height: HisaabSpacing.section),
          Text(
            'A thoughtful start',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: HisaabSpacing.md),
          const EmptyState(
            icon: Icons.account_balance_wallet_outlined,
            title: 'Your overview is taking shape',
            message:
                'Account balances, spending summaries, and recent activity '
                'will arrive in later feature phases. No sample financial '
                'data is shown.',
          ),
          const SizedBox(height: HisaabSpacing.section),
          _QuickActions(onOpen: () => showQuickAddSheet(context)),
          const SizedBox(height: HisaabSpacing.xxl),
        ],
      ),
    );
  }
}

class _LocalOverviewPanel extends StatelessWidget {
  const _LocalOverviewPanel();

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
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: HisaabSpacing.xxl,
            height: HisaabSpacing.xxl,
            decoration: BoxDecoration(
              color: colors.primary.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(HisaabSpacing.sm),
            ),
            child: Icon(Icons.lock_outline_rounded, color: colors.primary),
          ),
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
                  'HISAAB has no account, cloud sync, or runtime network service.',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _QuickActions extends StatelessWidget {
  const _QuickActions({required this.onOpen});

  final VoidCallback onOpen;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: HisaabSpacing.sm,
      runSpacing: HisaabSpacing.sm,
      children: <Widget>[
        _HomeAction(
          label: 'Expense',
          icon: Icons.remove_rounded,
          onPressed: onOpen,
        ),
        _HomeAction(
          label: 'Income',
          icon: Icons.add_rounded,
          onPressed: onOpen,
        ),
        _HomeAction(
          label: 'Transfer',
          icon: Icons.swap_horiz_rounded,
          onPressed: onOpen,
        ),
      ],
    );
  }
}

class _HomeAction extends StatelessWidget {
  const _HomeAction({
    required this.label,
    required this.icon,
    required this.onPressed,
  });

  final String label;
  final IconData icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: onPressed,
      icon: Icon(icon),
      label: Text(label),
      style: OutlinedButton.styleFrom(
        minimumSize: const Size(
          HisaabSpacing.minTouchTarget,
          HisaabSpacing.minTouchTarget,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(HisaabSpacing.radius),
        ),
      ),
    );
  }
}
