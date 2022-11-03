import 'package:fastfood_inteligente_flutter/src/cadastro/bloc/cadastro.bloc.dart';
import 'package:fastfood_inteligente_flutter/src/cadastro/controle/cadastro.controle.dart';
import 'package:fastfood_inteligente_flutter/src/cadastro/estados/Cadastro.estados.dart';
import 'package:fastfood_inteligente_flutter/src/cadastro/eventos/Cadastro.eventos.dart';
import 'package:fastfood_inteligente_flutter/src/inicio/pagina/home.page.dart';
import 'package:fastfood_inteligente_flutter/src/login/bloc/login.bloc.dart';
import 'package:fastfood_inteligente_flutter/src/login/estados/login.estados.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CadastroPagina extends StatefulWidget {
  const CadastroPagina({Key? key}) : super(key: key);

  @override
  State<CadastroPagina> createState() => _CadastroPaginaState();
}

class _CadastroPaginaState extends State<CadastroPagina> {
  @override
  void initState() {
    super.initState();
    context.read<CadastroBloc>();
  }

  late final CadastroControle _cadastroControle = CadastroControle(
      () => Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const HomePage()),
          (route) => false),
      () => setState(() {}), () {
    context.read<CadastroBloc>().add(RegistrarUsuarioCadastroEventos(
        _cadastroControle.usuario, _cadastroControle.password!, ));
  });

  final _emailControle = TextEditingController();
  final _passwordControle = TextEditingController();
  String funcao = 'chapeiro';

  @override
  Widget build(BuildContext context) {
    final cadastroBloc = context.watch<CadastroBloc>();
    final cadastroEstados = cadastroBloc.state;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Form(
          key: _cadastroControle.formKey,
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    onSaved: (newValue) => _cadastroControle.email = newValue,
                    validator: (value) =>
                        _cadastroControle.validateEmail(_emailControle.text),
                    controller: _emailControle,
                    decoration: const InputDecoration(
                      label: Text('email'),
                      hintText: 'digite seu email',
                    ),
                  ),
                  const SizedBox(height: 15),
                  TextFormField(
                    onSaved: (newValue) => _cadastroControle.password = newValue,
                    validator: (value) =>
                        _cadastroControle.validatePassword(_passwordControle.text),
                    obscureText: true,
                    controller: _passwordControle,
                    decoration: const InputDecoration(
                      label: Text('senha'),
                      hintText: 'digite sua senha',
                    ),
                  ),
                  const SizedBox(height: 15),
                  DropdownButton<String>(
                    value: funcao,
                    onChanged: (String? newValue) {
                      setState(() {
                        funcao = newValue!;
                      });
                    },
                    items: <String>[
                      'chapeiro',
                      'gerente',
                      'caixa',
                      'registra pedidos',
                      'chamada de senhas(TV)'
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                  if (cadastroEstados is RegistrarUsuarioCarregandoEstado)
                    const CircularProgressIndicator(),
                  if (cadastroEstados is InicialCadastroEstado)
                    TextButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Colors.orange),
                        ),
                        onPressed: () {
                          final isValid = _cadastroControle.validate(
                              formKey: _cadastroControle.formKey);
                          if (isValid) {
                            _cadastroControle.registrar(
                                email: _cadastroControle.email!,
                                password: _cadastroControle.password!,
                                funcao: funcao,
                                );
                          }
                        },
                        child: const Text(
                          'Confirmar',
                          style: TextStyle(color: Colors.white),
                        )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
