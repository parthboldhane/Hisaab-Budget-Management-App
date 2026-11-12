import 'package:flutter/material.dart';

import '../../../core/design/hisaab_spacing.dart';
import '../../../core/widgets/empty_state.dart';
import '../../../core/widgets/page_heading.dart';

class InsightsScreen extends StatelessWidget {
  const InsightsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(HisaabSpacing.page),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const PageHeading(
            title: 'Insights',
            description:
                'Understand patterns over time with reports grounded in '
                'your own records.',
          ),
          const SizedBox(height: HisaabSpacing.xl),
          const _ReportPrinciple(),
          const SizedBox(height: HisaabSpacing.lg),
          const EmptyState(
            icon: Icons.insights_outlined,
            title: 'Your history will tell the story',
            message:
                'Reports and comparisons will be introduced after local '
                'transaction history is available. Nothing is calculated '
                'from example data.',
          ),
        ],
      ),
    );
  }
}

class _ReportPrinciple extends StatelessWidget {
  const _ReportPrinciple();

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
          Icon(Icons.calendar_month_outlined, color: colors.primary),
          const SizedBox(height: HisaabSpacing.md),
          Text(
            'Built from your records',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: HisaabSpacing.xs),
          Text(
            'Future summaries will use your saved reporting dates and '
            'local transaction history.',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}
