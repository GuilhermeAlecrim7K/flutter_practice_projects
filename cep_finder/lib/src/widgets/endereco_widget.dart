import 'package:cep_finder/src/models/endereco_model.dart';
import 'package:flutter/material.dart';

class AddressWidget extends StatelessWidget {
  const AddressWidget({super.key, required this.address});
  final AddressModel address;

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
            Text('CEP: ${address.cep}'),
            Text('Logradouro: ${address.street}'),
            Visibility(
              visible: address.complement.isNotEmpty,
              child: Text('Complemento: ${address.complement}'),
            ),
            Text('Bairro: ${address.district}'),
            Text('Localidade: ${address.city}'),
            Text('UF: ${address.stateAcronym}'),
          ],
        ),
      ),
    );
  }
}
