import 'package:cep_finder/src/models/endereco_model.dart';

abstract class CepRepository {
  Future<AddressModel> getEndereco(String cep);
}
