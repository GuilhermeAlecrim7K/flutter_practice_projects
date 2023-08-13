import 'dart:developer';

import 'package:cep_finder/src/models/endereco_model.dart';
import 'package:cep_finder/src/repositories/cep_repository.dart';
import 'package:dio/dio.dart';

class CepRepositoryImpl implements CepRepository {
  @override
  Future<EnderecoModel> getEndereco(String cep) async {
    try {
      final result = await Dio().get('https://viacep.com.br/ws/$cep');
      return EnderecoModel.fromMap(result.data as Map<String, dynamic>);
    } on DioException catch (e) {
      log('Error: ${e.error}');
      log('Response: ${e.response}');
      log('Mensagem: ${e.message}', error: e);
      throw Exception('Erro ao buscar CEP');
    }
  }
}
