import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:teste_tecnico_guia_de_moteis/app/home/home_page.dart';
import 'package:teste_tecnico_guia_de_moteis/core/routes/app_routes.dart';

class AppRouting {
  final I = GetIt.I;

  Map<String, Widget Function(BuildContext)> routes() => {
        AppRoutes.homePage: (_) => const HomePage(),
      };
}
