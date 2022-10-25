import 'package:fastfood_inteligente_flutter/src/inicio/pagina/home.page.dart';
import 'package:fastfood_inteligente_flutter/src/login/bloc/login.bloc.dart';
import 'package:fastfood_inteligente_flutter/src/login/controle/login.controle.dart';
import 'package:fastfood_inteligente_flutter/src/login/estados/login.estados.dart';
import 'package:fastfood_inteligente_flutter/src/login/eventos/login.eventos.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  @override
  void initState() {
    super.initState();
    context.read<LoginBloc>();
  }

  late final LoginController _loginController = LoginController(
      () => Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const HomePage()),
          (route) => false),
      () => setState(() {}), () {
    context.read<LoginBloc>().add(AutenticarUsuarioLoginEventos(
        _loginController.username!, _loginController.password!));
  });

  final _usernameControle = TextEditingController();
  final _passwordControle = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final loginBloc = context.watch<LoginBloc>();
    final loginEstados = loginBloc.state;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Form(
          key: _loginController.formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                onSaved: (newValue) => _loginController.username = newValue,
                validator: (value) =>
                    _loginController.validateUsername(_usernameControle.text),
                controller: _usernameControle,
                decoration: const InputDecoration(
                  label: Text('login'),
                  hintText: 'digite seu login',
                ),
              ),
              TextFormField(
                onSaved: (newValue) => _loginController.password = newValue,
                validator: (value) =>
                    _loginController.validatePassword(_passwordControle.text),
                obscureText: true,
                controller: _passwordControle,
                decoration: const InputDecoration(
                  label: Text('senha'),
                  hintText: 'digite sua senha',
                ),
              ),
              const SizedBox(height: 15),
              if(loginEstados is AutenticarUsuarioCarregandoEstado)
                   const CircularProgressIndicator(),
              if(loginEstados is IniciarLoginEstado)
              TextButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.orange),
                      ),
                      onPressed: () {
                        final isValid = _loginController.validate(
                            formKey: _loginController.formKey);
                        if (isValid) {
                          _loginController.login(
                              username: _loginController.username!,
                              password: _loginController.password!);
                        }
                      },
                      child: const Text(
                        'Entrar',
                        style: TextStyle(color: Colors.white),
                      )),
            ],
          ),
        ),
      ),
    );
  }
}
