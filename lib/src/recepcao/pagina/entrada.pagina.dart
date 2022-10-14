import 'package:fastfood_inteligente_flutter/src/recepcao/pagina/entrada.web.responsivo.dart';
import 'package:fastfood_inteligente_flutter/src/recepcao/pagina/recepcao.mobile.pagina.dart';
import 'package:flutter/material.dart';

class EntradaPagina extends StatefulWidget {
  const EntradaPagina({Key? key}) : super(key: key);

  @override
  State<EntradaPagina> createState() => _EntradaPaginaState();
}

class _EntradaPaginaState extends State<EntradaPagina> {
  @override
  Widget build(BuildContext context) {
    if (MediaQuery.of(context).size.width >= 640 &&
        MediaQuery.of(context).size.width >= 720) {
      return const EntradaWebResponsivo();
    } else {
      return const RecepcaoMobile();
    }
  }
}
