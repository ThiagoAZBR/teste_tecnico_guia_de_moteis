import 'package:teste_tecnico_guia_de_moteis/domain/models/motel_model.dart';

abstract class HomeStates {}

class HomeDefaultState implements HomeStates {
  final List<MotelModel> data;

  HomeDefaultState({required this.data});
}

class HomeLoadingState implements HomeStates {}

class HomeErrorState implements HomeStates {}
