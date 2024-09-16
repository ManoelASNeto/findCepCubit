import 'package:equatable/equatable.dart';

import '../../domain/entities/find_cep_entity.dart';

class FindCepModel extends Equatable {
  final String? cep;
  final String? logradouro;
  final String? bairro;
  final String? localidade;
  final String? uf;

  const FindCepModel({
    required this.cep,
    required this.logradouro,
    required this.bairro,
    required this.localidade,
    required this.uf,
  });

  factory FindCepModel.fromJson(Map<String, dynamic> json) {
    return FindCepModel(
      cep: json['cep'] ?? 'Numero não obtido',
      logradouro: json['logradouro'] ?? 'Endereço não encontrado',
      bairro: json['bairro'] ?? 'bairro não encontrado',
      localidade: json['localidade'] ?? 'Não obtido',
      uf: json['uf'] ?? 'Não obtido',
    );
  }

  FindCepEntity toEntity() => FindCepEntity(
        cep: cep,
        logradouro: logradouro,
        bairro: bairro,
        localidade: localidade,
        uf: uf,
      );

  @override
  List<Object?> get props => [
        cep,
        logradouro,
        bairro,
        localidade,
        uf,
      ];
}
