import 'package:dartz/dartz.dart';
import 'package:via_cep_cubit/core/failures/failures.dart';
import 'package:via_cep_cubit/features/find_cep/domain/entities/find_cep_entity.dart';

abstract class FindcepRepository {
  Future<Either<Failures, FindCepEntity>> fetchCep(String cep);
}
