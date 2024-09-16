import 'package:dartz/dartz.dart';
import '../../../../core/failures/failures.dart';
import '../entities/find_cep_entity.dart';
import '../repositories/findcep_repository_impl.dart';

class FindcepUsecase {
  final FindcepRepositoryImpl findcepRepositoryImpl;

  FindcepUsecase({required this.findcepRepositoryImpl});

  Future<Either<Failures, FindCepEntity>> call(String cep) async {
    return await findcepRepositoryImpl.fetchCep(cep);
  }
}
