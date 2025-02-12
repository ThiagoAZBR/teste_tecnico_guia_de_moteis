import 'package:flutter/material.dart';
import 'package:teste_tecnico_guia_de_moteis/core/themes/app_text_styles.dart';

class HomeDefaultWidget extends StatelessWidget {
  const HomeDefaultWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'Tela inicial',
      style: AppTextStyles.big(),
    );
  }
}
