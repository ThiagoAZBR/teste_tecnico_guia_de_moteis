import 'package:flutter/material.dart';
import 'package:teste_tecnico_guia_de_moteis/core/themes/app_colors.dart';
import 'package:teste_tecnico_guia_de_moteis/core/themes/app_text_styles.dart';

class AppSwitchButton extends StatefulWidget {
  const AppSwitchButton({super.key});

  @override
  State<AppSwitchButton> createState() => _AppSwitchButtonState();
}

class _AppSwitchButtonState extends State<AppSwitchButton> {
  bool _isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppColors.redDark,
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    _isSwitched = false;
                  });
                },
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: _isSwitched ? AppColors.redDark : AppColors.primary,
                  ),
                  child: Text(
                    'ir agora',
                    textAlign: TextAlign.center,
                    style: AppTextStyles.medium(
                      color:
                          _isSwitched ? AppColors.primary : AppColors.secondary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    _isSwitched = true;
                  });
                },
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: _isSwitched ? AppColors.primary : AppColors.redDark,
                  ),
                  child: Text(
                    'ir outro dia',
                    textAlign: TextAlign.center,
                    style: AppTextStyles.medium(
                      color:
                          _isSwitched ? AppColors.secondary : AppColors.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
