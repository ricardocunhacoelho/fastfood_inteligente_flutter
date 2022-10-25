import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginController {
  var firestore = FirebaseFirestore.instance;
  final formKey = GlobalKey<FormState>();
  String? username;
  String? password;
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  final VoidCallback onSuccessLogin;
  final VoidCallback onUpdate;

  set isLoading(bool value){
    _isLoading = value;
    onUpdate();
  }

  LoginController(this.onSuccessLogin, this.onUpdate);

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
    print('conectando a api');
    await Future.delayed(Duration(seconds: 2));
    
    // FirebaseAuth.instance.signInWithEmailAndPassword(email: username, password: password);
    return true;
  }

  void login({
    required String username,
    required String password,
  }) async {
    isLoading = true;
    final response = await apiLogin(username: username, password: password);
    isLoading = false;
    if (response) {
      onSuccessLogin();
    }
  }
}
