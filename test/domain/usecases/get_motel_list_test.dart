import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:teste_tecnico_guia_de_moteis/data/get_motels_repository.dart';
import 'package:teste_tecnico_guia_de_moteis/domain/models/motel_model.dart';
import 'package:teste_tecnico_guia_de_moteis/domain/usecases/get_motel_list.dart';
import 'package:teste_tecnico_guia_de_moteis/domain/usecases/use_case.dart';

void main() {
  final dio = Dio();
  final GetMotelsRepository repository = GetMotelsRepositoryImpl(dio);
  final GetMotelListUseCase getMotelListUseCase =
      GetMotelListUseCase(repository: repository);
  test('get motel list ...', () async {
    final response = await getMotelListUseCase(params: const NoParams());

    final List<MotelModel>? data = response.fold(
      (failure) => null,
      (success) => success,
    );

    expect(data, isA<List<MotelModel>>());
  });
}
