import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class LoginControle {
  var firestore = FirebaseFirestore.instance;
  final formKey = GlobalKey<FormState>();
  String? username;
  String? password;
  final VoidCallback onSuccessLogin;
  final VoidCallback onUpdate;
  final VoidCallback onConectApi;

  LoginControle(this.onSuccessLogin, this.onUpdate, this.onConectApi);

  bool validate({required GlobalKey<FormState> formKey}) {
    final form = formKey.currentState!;
    if (form.validate()) {
      form.save();
      return true;
    } else {
      return false;
    }
  }

  String? validateUsername(String? username) =>
      username!.isNotEmpty ? null : 'Usuário inválido';
  String? validatePassword(String? password) =>
      password!.length >= 6 && password.isNotEmpty ? null : 'Senha inválida';

  Future<bool> apiLogin({
    required String username,
    required String password,
  }) async {
    onConectApi();
    return true;
  }

  void login({
    required String username,
    required String password,
  }) async {
    final response = await apiLogin(username: username, password: password);
    if (response) {
      onSuccessLogin();
    }
  }
}
