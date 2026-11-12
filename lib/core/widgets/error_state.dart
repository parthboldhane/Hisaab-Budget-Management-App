import 'package:flutter/material.dart';

import '../design/hisaab_spacing.dart';

class ErrorState extends StatelessWidget {
  const ErrorState({required this.message, this.onRetry, super.key});

  final String message;
  final VoidCallback? onRetry;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Semantics(
      liveRegion: true,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(HisaabSpacing.lg),
        decoration: BoxDecoration(
          color: colors.surface,
          border: Border.all(color: colors.error),
          borderRadius: BorderRadius.circular(HisaabSpacing.radius),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Icon(Icons.error_outline_rounded, color: colors.error),
            const SizedBox(height: HisaabSpacing.sm),
            Text(message, style: Theme.of(context).textTheme.bodyMedium),
            if (onRetry case final retry?) ...<Widget>[
              const SizedBox(height: HisaabSpacing.md),
              OutlinedButton(onPressed: retry, child: const Text('Try again')),
            ],
          ],
        ),
      ),
    );
  }
}
