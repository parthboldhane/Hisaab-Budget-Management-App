import 'package:flutter/material.dart';

import '../../../core/design/hisaab_spacing.dart';
import '../../../core/widgets/empty_state.dart';
import '../../../core/widgets/page_heading.dart';

class BudgetsScreen extends StatelessWidget {
  const BudgetsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(HisaabSpacing.page),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const PageHeading(
            title: 'Budgets',
            description:
                'Make room for what matters with plans that stay '
                'grounded in your own records.',
          ),
          const SizedBox(height: HisaabSpacing.xl),
          const _AllocationGroups(),
          const SizedBox(height: HisaabSpacing.lg),
          const EmptyState(
            icon: Icons.account_balance_wallet_outlined,
            title: 'Plans come in a later phase',
            message:
                'Budget limits, allocation progress, and savings goals '
                'are not active in this app foundation.',
          ),
        ],
      ),
    );
  }
}

class _AllocationGroups extends StatelessWidget {
  const _AllocationGroups();

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.all(HisaabSpacing.lg),
      decoration: BoxDecoration(
        color: colors.surface,
        borderRadius: BorderRadius.circular(HisaabSpacing.radius),
        border: Border.all(color: colors.outlineVariant),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Allocation groups',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: HisaabSpacing.xs),
          Text(
            'A framework preview only; no limits or progress are stored.',
            style: Theme.of(context).textTheme.bodySmall,
          ),
          const SizedBox(height: HisaabSpacing.md),
          const _AllocationGroupRow(icon: Icons.home_outlined, label: 'Needs'),
          Divider(height: HisaabSpacing.lg, color: colors.outlineVariant),
          const _AllocationGroupRow(
            icon: Icons.favorite_border_rounded,
            label: 'Wants',
          ),
          Divider(height: HisaabSpacing.lg, color: colors.outlineVariant),
          const _AllocationGroupRow(
            icon: Icons.savings_outlined,
            label: 'Savings',
          ),
        ],
      ),
    );
  }
}

class _AllocationGroupRow extends StatelessWidget {
  const _AllocationGroupRow({required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Icon(icon, color: Theme.of(context).colorScheme.primary),
        const SizedBox(width: HisaabSpacing.md),
        Text(label, style: Theme.of(context).textTheme.bodyLarge),
      ],
    );
  }
}
