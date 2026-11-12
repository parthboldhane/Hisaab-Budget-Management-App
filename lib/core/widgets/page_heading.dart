import 'package:flutter/material.dart';

import '../design/hisaab_spacing.dart';

class PageHeading extends StatelessWidget {
  const PageHeading({
    required this.title,
    required this.description,
    super.key,
  });

  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(title, style: Theme.of(context).textTheme.headlineSmall),
        const SizedBox(height: HisaabSpacing.sm),
        Text(description, style: Theme.of(context).textTheme.bodyMedium),
      ],
    );
  }
}
