import 'package:dartz/dartz.dart';
import '../../../../core/failures/failures.dart';
import '../entities/find_cep_entity.dart';
import '../repositories/findcep_repository.dart';

class FindcepUsecase {
  final FindcepRepository findcepRepository;

  FindcepUsecase({required this.findcepRepository});

  Future<Either<Failures, FindCepEntity>> call(String cep) async {
    return await findcepRepository.fetchCep(cep);
  }
}
