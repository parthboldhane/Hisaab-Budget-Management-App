import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'app_bottom_navigation.dart';
import 'quick_add_button.dart';

class AppScaffold extends StatelessWidget {
  const AppScaffold({required this.navigationShell, super.key});

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('HISAAB')),
      body: SafeArea(top: false, child: navigationShell),
      bottomNavigationBar: AppBottomNavigation(
        navigationShell: navigationShell,
      ),
      floatingActionButton: const QuickAddButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
