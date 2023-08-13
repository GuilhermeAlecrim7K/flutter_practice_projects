import 'package:cep_finder/src/models/adress_model.dart';

abstract class CepRepository {
  Future<AddressModel> getEndereco(String cep);
}
