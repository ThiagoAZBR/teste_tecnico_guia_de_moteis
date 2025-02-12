import 'package:flutter/material.dart';
import 'package:teste_tecnico_guia_de_moteis/app/app_widget.dart';
import 'package:teste_tecnico_guia_de_moteis/app/home/home_container.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  HomeContainer().setup();

  runApp(const AppWidget());
}
