import 'package:flutter/material.dart';

import '../../../core/design/hisaab_spacing.dart';
import '../../../core/widgets/empty_state.dart';
import '../../../core/widgets/page_heading.dart';

class TransactionsScreen extends StatelessWidget {
  const TransactionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(HisaabSpacing.page),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const PageHeading(
            title: 'Transactions',
            description:
                'A clear history of the money you choose to record, '
                'kept on your device.',
          ),
          const SizedBox(height: HisaabSpacing.xl),
          const _HistoryIntro(),
          const SizedBox(height: HisaabSpacing.lg),
          const EmptyState(
            icon: Icons.receipt_long_outlined,
            title: 'Your activity will appear here',
            message:
                'Transaction entry, search, and history are planned for a '
                'later feature phase. This foundation does not create '
                'sample entries.',
          ),
        ],
      ),
    );
  }
}

class _HistoryIntro extends StatelessWidget {
  const _HistoryIntro();

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
        children: <Widget>[
          Icon(Icons.shield_outlined, color: colors.primary),
          const SizedBox(width: HisaabSpacing.md),
          Expanded(
            child: Text(
              'No bank connection is needed to build your history.',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
        ],
      ),
    );
  }
}
