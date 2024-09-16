import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../../core/failures/failures.dart';
import '../../domain/entities/find_cep_entity.dart';
import '../../domain/usecases/findcep_usecase.dart';

part 'find_cep_state.dart';

class FindCepCubit extends Cubit<FindCepState> {
  final FindcepUsecase findcepUsecase;
  FindCepCubit(this.findcepUsecase) : super(FindCepInitial());

  Future<void> getCep(cep) async {
    emit(FindCepLoading());
    try {
      final either = await findcepUsecase.call(cep);
      either.fold(
        (failure) => emit(const FindCepErro(msgErro: 'Erro ao carregar dados do CEP')),
        (findCepEntity) => emit(FindCepLoaded(findCepEntity: findCepEntity)),
      );
    } on NetworkFailure catch (error) {
      emit(FindCepErro(msgErro: 'Network error $error'));
    }
  }
}
