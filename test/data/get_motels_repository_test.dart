import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:teste_tecnico_guia_de_moteis/data/get_motels_repository.dart';

void main() {
  final dio = Dio();
  final GetMotelsRepository repository = GetMotelsRepositoryImpl(dio);

  test('get motels repository ...', () async {
    final response = await repository.getMotels();

    expect(response, isA<Right>());
  });
}
