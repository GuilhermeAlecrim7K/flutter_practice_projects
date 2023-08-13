class CepNotFoundException implements Exception {
  final String message;
  const CepNotFoundException(String cep)
      : message = 'O CEP $cep não foi encontrado';
}
