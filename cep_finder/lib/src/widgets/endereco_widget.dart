import 'package:cep_finder/src/models/endereco_model.dart';
import 'package:flutter/material.dart';

class EnderecoWidget extends StatelessWidget {
  const EnderecoWidget({super.key, required this.endereco});
  final EnderecoModel endereco;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Card(
      margin: const EdgeInsets.all(8),
      elevation: 10,
      color: colorScheme.primaryContainer,
      shape: ContinuousRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('CEP: ${endereco.cep}'),
            Text('Logradouro: ${endereco.logradouro}'),
            Visibility(
              visible: endereco.complemento.isNotEmpty,
              child: Text('Complemento: ${endereco.complemento}'),
            ),
            Text('Bairro: ${endereco.bairro}'),
            Text('Localidade: ${endereco.localidade}'),
            Text('UF: ${endereco.uf}'),
          ],
        ),
      ),
    );
  }
}
