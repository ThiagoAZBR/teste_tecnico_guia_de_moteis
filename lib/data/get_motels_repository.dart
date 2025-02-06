import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:teste_tecnico_guia_de_moteis/core/app_urls.dart';
import 'package:teste_tecnico_guia_de_moteis/core/exceptions.dart';
import 'package:teste_tecnico_guia_de_moteis/domain/motel_model.dart';

abstract class GetMotelsRepository {
  Future<Either<Exception, List<MotelModel>>> getMotels();
}

class GetMotelsRepositoryImpl implements GetMotelsRepository {
  final Dio dio;

  GetMotelsRepositoryImpl(this.dio);

  @override
  Future<Either<Exception, List<MotelModel>>> getMotels() async {
    try {
      final response = await dio.get(AppUrls.motelsUrl);

      return Right(_handleGetMotelsResponse(response));
    } on DioException catch (e) {
      return Left(e);
    } on UnexpectedException catch (e) {
      return Left(e);
    }
  }
}

List<MotelModel> _handleGetMotelsResponse(Response response) {
  if (response.statusCode == 200) {
    final data = DefaultModel.fromMap(response.data).data;

    return data.moteis;
  }

  throw UnexpectedException();
}
