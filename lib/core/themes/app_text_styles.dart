import 'package:flutter/material.dart';
import 'package:teste_tecnico_guia_de_moteis/core/themes/app_colors.dart';

class AppTextStyles {
  static TextStyle medium({
    Color color = AppColors.secondary,
  }) =>
      TextStyle(
        fontSize: 16,
        color: color,
      );
  static TextStyle big({
    FontWeight fontWeight = FontWeight.normal,
  }) =>
      TextStyle(
        fontSize: 20,
        color: AppColors.secondary,
        fontWeight: fontWeight,
      );
}
