import 'package:flutter/material.dart';

import '../design/hisaab_spacing.dart';

class LoadingState extends StatelessWidget {
  const LoadingState({this.label = 'Loading', super.key});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      liveRegion: true,
      label: label,
      child: const Padding(
        padding: EdgeInsets.all(HisaabSpacing.xl),
        child: Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
