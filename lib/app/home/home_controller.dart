import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teste_tecnico_guia_de_moteis/app/home/home_states.dart';
import 'package:teste_tecnico_guia_de_moteis/domain/usecases/get_motel_list.dart';

class HomeController extends Cubit<HomeStates> {
  final GetMotelListUseCase getMotelListUseCase;

  HomeController(super.initialState, this.getMotelListUseCase);
}
