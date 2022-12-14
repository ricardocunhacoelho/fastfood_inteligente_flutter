import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class PedidosControle {
  final controller = PageController(initialPage: 0);
  var firestore = FirebaseFirestore.instance;
  final formKey = GlobalKey<FormState>();
  String? username;
  String? password;
  int mesaSelecionada = 0;
  final VoidCallback? refresh;

  PedidosControle(this.refresh);

  void checarOpcao(int index) async {
    mesaSelecionada = index + 1;
  }

  void adiantarPagina() {
    controller.nextPage(
        duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
  }
}
