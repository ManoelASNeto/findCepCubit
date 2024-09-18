import 'package:dartz/dartz.dart';
import 'package:via_cep_cubit/core/failures/exceptions.dart';
import 'package:via_cep_cubit/features/find_cep/domain/entities/find_cep_entity.dart';
import '../../../../core/failures/failures.dart';
import '../datasources/findcep_remote_datasource.dart';

import '../../domain/repositories/findcep_repository.dart';

class FindcepRepositoryImpl implements FindcepRepository {
  final FindcepRemoteDatasource remoteDatasource;

  FindcepRepositoryImpl(this.remoteDatasource);

  @override
  Future<Either<Failures, FindCepEntity>> fetchCep(String cep) async {
    try {
      var response = await remoteDatasource.fetchCep(cep);
      final entity = response.toEntity();
      return Right(entity);
    } on ServerException {
      throw Left(ServerFailure());
    }
  }
}

// Tipo de retorno nome parametros() função {}
//String  algumacoisa(int id) {}
//Future<String> alguma() async {}
//Future<FindCepModel> alguma() async {}
//FindModel alguma(int id) async {}
//algumacoisa() {}
// (){}
algumaCoisa() {
  '';
}
