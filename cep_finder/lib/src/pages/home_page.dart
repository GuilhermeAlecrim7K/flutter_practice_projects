import 'package:cep_finder/src/exceptions/cep_not_found_exception.dart';
import 'package:cep_finder/src/exceptions/http_request_exception.dart';
import 'package:cep_finder/src/models/endereco_model.dart';
import 'package:cep_finder/src/repositories/cep_repository.dart';
import 'package:cep_finder/src/repositories/cep_repository_impl.dart';
import 'package:cep_finder/src/widgets/endereco_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final CepRepository _cepRepository = CepRepositoryImpl();
  final _cepMaskedTextInputFormatter = MaskTextInputFormatter(
    mask: '#####-###',
  );
  EnderecoModel? _enderecoModel;
  final _cepTextEditingController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  bool _loading = false;

  @override
  void dispose() {
    _cepTextEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Busca CEP'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: 200,
                    child: TextFormField(
                      decoration: const InputDecoration(
                        label: Text('CEP'),
                        hintText: '01001-000',
                        prefixIcon: Icon(Icons.home),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                      ),
                      controller: _cepTextEditingController,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        _cepMaskedTextInputFormatter,
                      ],
                      keyboardType: TextInputType.number,
                      validator: (value) =>
                          value?.isEmpty ?? true ? 'Campo obrigatório' : null,
                    ),
                  ),
                  const SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: () async {
                      final valid = _formKey.currentState?.validate() ?? false;
                      try {
                        if (valid) {
                          setState(() => _loading = true);
                          final endereco = await _cepRepository.getEndereco(
                            _cepMaskedTextInputFormatter.getUnmaskedText(),
                          );
                          setState(() {
                            _enderecoModel = endereco;
                            _loading = false;
                          });
                        }
                      } on Exception catch (e) {
                        String? exceptionMessage;
                        if (e is CepNotFoundException) {
                          exceptionMessage = e.message;
                        } else if (e is HttpRequestException) {
                          exceptionMessage = e.message;
                        }
                        setState(() {
                          _loading = false;
                          _enderecoModel = null;
                        });
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              exceptionMessage ??
                                  'Não foi possível consultar o CEP neste momento.',
                              style: textTheme.titleSmall?.copyWith(
                                color: colorScheme.onErrorContainer,
                              ),
                            ),
                            backgroundColor: colorScheme.errorContainer,
                          ),
                        );
                      }
                    },
                    child: const Text('Buscar'),
                  ),
                  const SizedBox(height: 50),
                  if (_loading) const CircularProgressIndicator(),
                  if (_enderecoModel != null)
                    EnderecoWidget(endereco: _enderecoModel!),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
