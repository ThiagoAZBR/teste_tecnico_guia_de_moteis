import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teste_tecnico_guia_de_moteis/app/home/controller/home_states.dart';
import 'package:teste_tecnico_guia_de_moteis/domain/usecases/get_motel_list.dart';
import 'package:teste_tecnico_guia_de_moteis/domain/usecases/use_case.dart';

class HomeController extends Cubit<HomeStates> {
  final GetMotelListUseCase getMotelListUseCase;

  HomeController(super.initialState, this.getMotelListUseCase);

  Future<void> getMotelList() async {
    emit(HomeLoadingState());
    final response = await getMotelListUseCase(params: const NoParams());

    response.fold(
      (failure) {
        emit(HomeErrorState());
        return null;
      },
      (success) {
        emit(HomeDefaultState(data: success));
        return success;
      },
    );
  }
}
