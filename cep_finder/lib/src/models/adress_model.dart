import 'dart:convert';

class AddressModel {
  final String cep;
  final String street;
  final String complement;
  final String district;
  final String city;
  final String stateAcronym;

  const AddressModel({
    required this.cep,
    required this.street,
    required this.complement,
    required this.district,
    required this.city,
    required this.stateAcronym,
  });

  Map<String, dynamic> toMap() {
    return {
      'cep': cep,
      'logradouro': street,
      'complemento': complement,
      'bairro': district,
      'localidade': city,
      'uf': stateAcronym,
    };
  }

  String toJson() => jsonEncode(toMap());

  factory AddressModel.fromMap(Map<String, dynamic> map) {
    return AddressModel(
      cep: map['cep'] as String? ?? '',
      street: map['logradouro'] as String? ?? '',
      complement: map['complemento'] as String? ?? '',
      district: map['bairro'] as String? ?? '',
      city: map['localidade'] as String? ?? '',
      stateAcronym: map['uf'] as String? ?? '',
    );
  }

  factory AddressModel.fromJson(String source) {
    return AddressModel.fromMap(jsonDecode(source) as Map<String, dynamic>);
  }
}
