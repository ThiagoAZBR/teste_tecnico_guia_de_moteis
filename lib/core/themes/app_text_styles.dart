import 'package:flutter/material.dart';
import 'package:teste_tecnico_guia_de_moteis/core/themes/app_colors.dart';

class AppTextStyles {
  static TextStyle medium({
    FontWeight fontWeight = FontWeight.normal,
    Color color = AppColors.secondary,
  }) =>
      TextStyle(
        fontSize: 18,
        color: color,
        fontWeight: fontWeight,
      );
  static TextStyle big({
    FontWeight fontWeight = FontWeight.normal,
    Color color = AppColors.secondary,
  }) =>
      TextStyle(
        fontSize: 20,
        color: color,
        fontWeight: fontWeight,
      );
}
