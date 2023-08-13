import 'package:cep_finder/src/models/endereco_model.dart';

abstract class CepRepository {
  Future<EnderecoModel> getEndereco(String cep);
}
