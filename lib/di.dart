import 'package:get_it/get_it.dart';
import 'features/find_cep/data/datasources/findcep_remote_datasource.dart';
import 'features/find_cep/data/repositories/findcep_repository.dart';
import 'features/find_cep/domain/repositories/findcep_repository_impl.dart';
import 'features/find_cep/presentation/cubit/find_cep_cubit.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerSingleton<FindcepRemoteDatasourceImpl>(FindcepRemoteDatasource());

  sl.registerSingleton<FindcepRepositoryImpl>(FindcepRepository(sl()));

  sl.registerSingleton(FindCepCubit(sl()));
}
