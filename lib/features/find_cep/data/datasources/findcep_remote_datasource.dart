import 'package:dio/dio.dart';
import 'package:via_cep_cubit/core/failures/exceptions.dart';

import '../models/find_cep_model.dart';

final Dio _dio = Dio(BaseOptions(baseUrl: 'https://viacep.com.br/ws/'));

abstract class FindcepRemoteDatasourceImpl {
  Future<FindCepModel> fetchCep(String cep);
}

class FindcepRemoteDatasource implements FindcepRemoteDatasourceImpl {
  @override
  Future<FindCepModel> fetchCep(String cep) async {
    try {
      final response = await _dio.get('$cep/json/');
      return FindCepModel.fromJson(response.data);
    } on DioException {
      throw ServerException();
    }
  }
}
