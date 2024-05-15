import 'package:core_module/core_module.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class NewAskHelpPage extends StatefulWidget {
  const NewAskHelpPage({super.key, this.title = 'Solicitação'});
  final String title;

  @override
  State<NewAskHelpPage> createState() => _NewAskHelpPageState();
}

class _NewAskHelpPageState extends State<NewAskHelpPage> {
  late final GlobalKey<FormState> _formKey;
  String preApprovedValue = '7.500,00';

  bool asImage = false;
  String urlImage = '';

  late final TextEditingController _titleController;
  late final TextEditingController _cpfController;
  late final TextEditingController _pixKeyController;
  late final TextEditingController _bankController;
  late final TextEditingController _agencyController;
  late final TextEditingController _accountController;
  late final TextEditingController _valueController;
  late final TextEditingController _descriptionController;

  @override
  void initState() {
    super.initState();
    _formKey = GlobalKey<FormState>();
    _titleController = TextEditingController();
    _cpfController = TextEditingController();
    _pixKeyController = TextEditingController();
    _bankController = TextEditingController();
    _agencyController = TextEditingController();
    _accountController = TextEditingController();
    _valueController = TextEditingController();
    _descriptionController = TextEditingController();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _cpfController.dispose();
    _pixKeyController.dispose();
    _bankController.dispose();
    _agencyController.dispose();
    _accountController.dispose();
    _valueController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorsTheme = CoopartilharColors.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Valor pré-aprovado',
                      style: textTheme.titleMedium,
                    ),
                    const SizedBox(height: 30),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 2,
                        horizontal: 8,
                      ),
                      decoration: BoxDecoration(
                        color: colorsTheme.lightGrey,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(8)),
                      ),
                      child: Text(
                        'R\$ $preApprovedValue',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: colorsTheme.primary,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const Text('Titulo da solicitação*'),
                TextFormField(
                  controller: _titleController,
                  decoration: const InputDecoration(
                    hintText: 'Insira o titulo para solicitação',
                  ),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Titulo não pode esta vazio';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                const Text('CPF do Assistido*'),
                TextFormField(
                  controller: _cpfController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    hintText: 'Insira o CPF do Assistido',
                  ),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'CPF não pode esta vazio';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                const Text('Chave pix'),
                TextFormField(
                  controller: _pixKeyController,
                  decoration: const InputDecoration(
                    hintText: 'Insira a chave pix do Assistido',
                  ),
                ),
                const SizedBox(height: 20),
                const Text('Banco'),
                TextFormField(
                  controller: _bankController,
                  decoration: const InputDecoration(
                    hintText: 'Insira o banco do Assistido',
                  ),
                ),
                const SizedBox(height: 20),
                const Text('Agência'),
                TextFormField(
                  controller: _agencyController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    hintText: 'Insira a agência bancária do Assistido',
                  ),
                ),
                const SizedBox(height: 20),
                const Text('Conta'),
                TextFormField(
                  controller: _accountController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    hintText: 'Insira a conta bancária do Assistido',
                  ),
                ),
                const SizedBox(height: 20),
                const Text('Valor*'),
                TextFormField(
                  controller: _valueController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    hintText: 'R\$ 14.500,00',
                  ),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Valor não pode esta vazio';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                const Text('Enviar arquivo*'),
                !asImage
                    ? InkWell(
                        onTap: () {},
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(8)),
                            color: colorsTheme.primary,
                          ),
                          child: Icon(
                            UIcons.regularStraight.clip,
                            color: colorsTheme.white,
                          ),
                        ),
                      )
                    : Image.network(
                        urlImage,
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) {
                            return child;
                          }
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        },
                      ),
                const SizedBox(height: 20),
                const Text('Breve descrição'),
                TextFormField(
                  controller: _descriptionController,
                  maxLines: 8,
                  decoration: const InputDecoration(
                    hintText:
                        'Insira uma breve descrição sobre sua solicitação',
                  ),
                ),
                const SizedBox(height: 50),
                CooButton(
                  label: 'Próximo',
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {}
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
