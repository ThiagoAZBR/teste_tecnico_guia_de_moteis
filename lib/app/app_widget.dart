import 'package:flutter/material.dart';
import 'package:teste_tecnico_guia_de_moteis/core/routes/app_routes.dart';
import 'package:teste_tecnico_guia_de_moteis/core/routes/app_routing.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.homePage,
      routes: AppRouting().routes(),
    );
  }
}
