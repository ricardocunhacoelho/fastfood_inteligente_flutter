import 'package:fastfood_inteligente_flutter/src/login/bloc/login.bloc.dart';
import 'package:fastfood_inteligente_flutter/src/login/controle/login.controle.dart';
import 'package:fastfood_inteligente_flutter/src/login/estados/login.estados.dart';
import 'package:fastfood_inteligente_flutter/src/login/eventos/login.eventos.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPagina extends StatefulWidget {
  const LoginPagina({Key? key}) : super(key: key);

  @override
  State<LoginPagina> createState() => _LoginPaginaState();
}

class _LoginPaginaState extends State<LoginPagina> {
  @override
  void initState() {
    super.initState();
    context.read<LoginBloc>();
  }

  late final LoginControle _loginController = LoginControle(
    () async {
      final uid = await FirebaseAuth.instance.currentUser!.uid.toString();
      context.read<LoginBloc>().add(BuscarUsuarioLoginEventos(uid));
    },
    () {
      context.read<LoginBloc>().add(AutenticarUsuarioLoginEventos(
          _loginController.username!, _loginController.password!));
    },
  );

  final _usernameControle = TextEditingController();
  final _passwordControle = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final loginBloc = context.watch<LoginBloc>();
    final loginEstados = loginBloc.state;
    if (loginEstados is CompletoBuscarUsuarioLoginEstado) {
      Navigator.pushNamedAndRemoveUntil(
          context,
          '/gerente',
          ModalRoute.withName('/'));
    }
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
              if (loginEstados is AutenticarUsuarioCarregandoEstado)
                const CircularProgressIndicator(),
              if (loginEstados is CarregandoUsuariosLoginEstado)
                const CircularProgressIndicator(),
              if (loginEstados is IniciarLoginEstado)
                TextButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.orange),
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
                    if (loginEstados is CompletoBuscarUsuarioLoginEstado)
                    Text('completo'),
                  
            ],
          ),
        ),
      ),
    );
  }
}