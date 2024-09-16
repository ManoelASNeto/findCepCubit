import 'package:equatable/equatable.dart';

class FindCepEntity extends Equatable {
  final String? cep;
  final String? logradouro;
  final String? bairro;
  final String? localidade;
  final String? uf;

  const FindCepEntity({
    this.cep,
    this.logradouro,
    this.bairro,
    this.localidade,
    this.uf,
  });

  @override
  List<Object?> get props => [
        cep,
        logradouro,
        bairro,
        localidade,
        uf,
      ];
}
