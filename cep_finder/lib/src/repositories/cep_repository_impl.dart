import 'dart:developer';

import 'package:cep_finder/src/exceptions/cep_not_found_exception.dart';
import 'package:cep_finder/src/exceptions/http_request_exception.dart';
import 'package:cep_finder/src/models/adress_model.dart';
import 'package:cep_finder/src/repositories/cep_repository.dart';
import 'package:dio/dio.dart';

class CepRepositoryImpl implements CepRepository {
  @override
  Future<AddressModel> getEndereco(String cep) async {
    try {
      final response = await Dio().get('https://viacep.com.br/ws/$cep/json');
      final endereco =
          AddressModel.fromMap(response.data as Map<String, dynamic>);
      if (endereco.cep == '') {
        throw CepNotFoundException(cep);
      } else {
        return endereco;
      }
    } on DioException catch (e) {
      log('Error: ${e.error}');
      log('Response: ${e.response}');
      log('Message: ${e.message}', error: e);
      String? helperMessage;
      switch (e.type) {
        case DioExceptionType.connectionError:
        case DioExceptionType.connectionTimeout:
        case DioExceptionType.receiveTimeout:
        case DioExceptionType.sendTimeout:
          helperMessage = 'Verifique sua conexão de rede.';
        default:
      }
      throw HttpRequestException(
        'Não foi possível consultar o CEP. $helperMessage',
      );
    }
  }
}
