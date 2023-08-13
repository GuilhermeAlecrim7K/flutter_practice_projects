import 'dart:convert';

class EnderecoModel {
  final String cep;
  final String logradouro;
  final String complemento;
  final String bairro;
  final String localidade;
  final String uf;

  EnderecoModel({
    required this.cep,
    required this.logradouro,
    required this.complemento,
    required this.bairro,
    required this.localidade,
    required this.uf,
  });

  Map<String, dynamic> toMap() {
    return {
      'cep': cep,
      'logradouro': logradouro,
      'complemento': complemento,
      'bairro': bairro,
      'localidade': localidade,
      'uf': uf,
    };
  }

  String toJson() => jsonEncode(toMap());

  factory EnderecoModel.fromMap(Map<String, dynamic> map) {
    return EnderecoModel(
      cep: map['cep'] as String? ?? '',
      logradouro: map['logradouro'] as String? ?? '',
      complemento: map['complemento'] as String? ?? '',
      bairro: map['bairro'] as String? ?? '',
      localidade: map['localidade'] as String? ?? '',
      uf: map['uf'] as String? ?? '',
    );
  }

  factory EnderecoModel.fromJson(String source) {
    return EnderecoModel.fromMap(jsonDecode(source) as Map<String, dynamic>);
  }
}
