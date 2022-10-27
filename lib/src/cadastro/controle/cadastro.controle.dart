import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fastfood_inteligente_flutter/src/usuarios/dominio/entidade/usuario.entidade.dart';
import 'package:fastfood_inteligente_flutter/src/usuarios/modelo/usuario.modelo.dart';
import 'package:flutter/material.dart';

class CadastroControle {
  var firestore = FirebaseFirestore.instance;
  final formKey = GlobalKey<FormState>();
  String? email;
  String? password;
  String? funcao;
  late UsuarioModelo usuario = UsuarioModelo.empty();
  late EUsuarioFuncao eFuncao;
  final VoidCallback onSuccessCadastro;
  final VoidCallback onUpdate;
  final VoidCallback onConectApi;

  CadastroControle(this.onSuccessCadastro, this.onUpdate, this.onConectApi);

  bool validate({required GlobalKey<FormState> formKey}) {
    final form = formKey.currentState!;
    if (form.validate()) {
      form.save();
      return true;
    } else {
      return false;
    }
  }

  String? validateEmail(String? email) =>
      email!.isNotEmpty ? null : 'Usuário inválido';
  String? validatePassword(String? password) =>
      password!.length >= 6 && password.isNotEmpty ? null : 'Senha inválida';

  Future<bool> apiCadastro() async {
    onConectApi();
    return true;
  }

  void registrar({
    required String email,
    required String password,
    required String funcao,
  }) async {
    usuario = usuario.copyWith(email : email);

    if(funcao == 'registra pedidos'){
      eFuncao = EUsuarioFuncao.registraPedidos;
    }else if(funcao == 'chamada de senhas(TV)'){
      eFuncao = EUsuarioFuncao.avocaClientes;
    }else{
      eFuncao = EUsuarioFuncao.values
          .firstWhere((element) => element.name == funcao);
    }
    usuario = usuario.copyWith(usuarioFuncao : eFuncao);
    final response = await apiCadastro();
    if (response) {
      onSuccessCadastro();
    }
  }
}
