import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:teste_tecnico_guia_de_moteis/app/home/home_controller.dart';
import 'package:teste_tecnico_guia_de_moteis/app/home/home_states.dart';
import 'package:teste_tecnico_guia_de_moteis/data/get_motels_repository.dart';
import 'package:teste_tecnico_guia_de_moteis/domain/usecases/get_motel_list.dart';

abstract class Dependencies {
  void setup();
  void dispose();
}

class HomeContainer implements Dependencies {
  final I = GetIt.instance;
  @override
  void dispose() {}

  @override
  void setup() {
    I.registerSingleton(Dio());

    I.registerSingleton(GetMotelsRepositoryImpl(
      I.get<Dio>(),
    ));

    I.registerSingleton(GetMotelListUseCase(
      repository: I.get<GetMotelsRepositoryImpl>(),
    ));

    I.registerSingleton(HomeController(
      HomeLoadingState(),
      I.get<GetMotelListUseCase>(),
    ));
  }
}
