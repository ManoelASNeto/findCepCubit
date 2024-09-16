part of 'find_cep_cubit.dart';

abstract class FindCepState extends Equatable {
  const FindCepState();

  @override
  List<Object> get props => [];
}

class FindCepInitial extends FindCepState {}

class FindCepLoading extends FindCepState {}

class FindCepLoaded extends FindCepState {
  final FindCepEntity findCepEntity;

  const FindCepLoaded({required this.findCepEntity});
}

class FindCepErro extends FindCepState {
  final String? msgErro;

  const FindCepErro({required this.msgErro});
}
