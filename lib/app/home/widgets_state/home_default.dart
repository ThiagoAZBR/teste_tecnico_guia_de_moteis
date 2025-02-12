import 'package:flutter/material.dart';
import 'package:teste_tecnico_guia_de_moteis/core/widgets/app_card_motel.dart';
import 'package:teste_tecnico_guia_de_moteis/domain/models/motel_model.dart';

class HomeDefaultWidget extends StatelessWidget {
  final List<MotelModel> motelModel;
  const HomeDefaultWidget({super.key, required this.motelModel});

  @override
  Widget build(BuildContext context) {
    return ListView(
        children: motelModel.map((motel) {
          return AppCardMotel(motelModel: motel);
        }).toList(),
      );
  }
}
