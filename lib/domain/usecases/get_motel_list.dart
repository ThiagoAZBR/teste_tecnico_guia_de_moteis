import 'package:fpdart/fpdart.dart';
import 'package:teste_tecnico_guia_de_moteis/data/get_motels_repository.dart';
import 'package:teste_tecnico_guia_de_moteis/domain/models/motel_model.dart';
import 'package:teste_tecnico_guia_de_moteis/domain/usecases/use_case.dart';

class GetMotelListUseCase implements UseCase<List<MotelModel>, NoParams> {
  final GetMotelsRepository repository;

  GetMotelListUseCase({required this.repository});

  @override
  Future<Either<Exception, List<MotelModel>>> call({
    required NoParams params,
  }) async {
    return await repository.getMotels();
  }
}
