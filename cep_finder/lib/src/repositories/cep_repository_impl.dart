import 'dart:developer';
import 'dart:io';

import 'package:cep_finder/src/exceptions/cep_not_found_exception.dart';
import 'package:cep_finder/src/models/endereco_model.dart';
import 'package:cep_finder/src/repositories/cep_repository.dart';
import 'package:dio/dio.dart';

class CepRepositoryImpl implements CepRepository {
  @override
  Future<EnderecoModel> getEndereco(String cep) async {
    try {
      final response = await Dio().get('https://viacep.com.br/ws/$cep/json');
      final endereco =
          EnderecoModel.fromMap(response.data as Map<String, dynamic>);
      if (endereco.cep == '') {
        throw CepNotFoundException(cep);
      } else {
        return endereco;
      }
    } on DioException catch (e) {
      log('Error: ${e.error}');
      log('Response: ${e.response}');
      log('Mensagem: ${e.message}', error: e);
      throw const HttpException(
        'Não foi possível consultar o CEP neste momento. '
        'Verifique sua conexão de rede.',
      );
    }
  }
}
