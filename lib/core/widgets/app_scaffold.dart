import 'package:flutter/material.dart';
import 'package:teste_tecnico_guia_de_moteis/core/themes/app_colors.dart';
import 'package:teste_tecnico_guia_de_moteis/core/widgets/app_drawer.dart';
import 'package:teste_tecnico_guia_de_moteis/core/widgets/app_switch_button.dart';

class AppScaffold extends StatelessWidget {
  final Widget child;

  const AppScaffold({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: SafeArea(child: child),
      appBar: AppBar(
        backgroundColor: AppColors.redLight,
        title: const AppSwitchButton(),
        actions: const [Padding(
          padding: EdgeInsets.only(left: 16.0),
          child: Icon(Icons.search),
        )],

      ),
      drawer: const AppDrawer(),
    );
  }
}
