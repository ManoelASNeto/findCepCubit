import 'package:get_it/get_it.dart';
import 'package:via_cep_cubit/features/find_cep/domain/usecases/findcep_usecase.dart';
import 'features/find_cep/data/datasources/findcep_remote_datasource.dart';
import 'features/find_cep/data/repositories/findcep_repository_impl.dart';
import 'features/find_cep/domain/repositories/findcep_repository.dart';
import 'features/find_cep/presentation/cubit/find_cep_cubit.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerSingleton<FindcepRemoteDatasource>(FindcepRemoteDatasourceImpl());

  sl.registerSingleton<FindcepRepository>(FindcepRepositoryImpl(sl()));

  sl.registerSingleton(FindcepUsecase(findcepRepository: sl()));

  sl.registerSingleton(FindCepCubit(sl()));
}
