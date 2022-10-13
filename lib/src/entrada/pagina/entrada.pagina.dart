import 'package:fastfood_inteligente_flutter/src/chapas/dominio/objetosdevalor/ordem.objeto.dart';
import 'package:fastfood_inteligente_flutter/src/configuracoes/bloc/configuracoes.chapa.bloc.dart';
import 'package:fastfood_inteligente_flutter/src/configuracoes/bloc/configuracoes.produto.bloc.dart';
import 'package:fastfood_inteligente_flutter/src/configuracoes/estados/configuracoes.produto.estados.dart';
import 'package:fastfood_inteligente_flutter/src/configuracoes/eventos/configuracoes.chapa.eventos.dart';
import 'package:fastfood_inteligente_flutter/src/configuracoes/eventos/configuracoes.produto.eventos.dart';
import 'package:fastfood_inteligente_flutter/src/entrada/bloc/entrada.bloc.dart';
import 'package:fastfood_inteligente_flutter/src/entrada/componentes/contadorquantidade.entrada.componente.dart';
import 'package:fastfood_inteligente_flutter/src/entrada/componentes/finalizarpedido.dialog.componente.dart';
import 'package:fastfood_inteligente_flutter/src/entrada/componentes/mostrarpreco.entrada.componente.dart';
import 'package:fastfood_inteligente_flutter/src/entrada/componentes/recomecar.dialog.componente.dart';
import 'package:fastfood_inteligente_flutter/src/entrada/estados/entrada.estados.dart';
import 'package:fastfood_inteligente_flutter/src/entrada/eventos/entrada.eventos.dart';
import 'package:fastfood_inteligente_flutter/src/entrada/modelo/entrada.ordem.model.dart';
import 'package:fastfood_inteligente_flutter/src/entrada/pagina/entrada.web.responsivo.dart';
import 'package:fastfood_inteligente_flutter/src/entrada/pagina/recepcao.mobile.pagina.dart';
import 'package:fastfood_inteligente_flutter/src/produtos/dominio/casodeuso/checarsefoiadicionadoproduto.casodeuso.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
      return EntradaWebResponsivo();
    } else {
      return RecepcaoMobile();
    }
  }
}
