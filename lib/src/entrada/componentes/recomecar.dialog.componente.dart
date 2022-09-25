import 'package:fastfood_inteligente_flutter/src/configuracoes/bloc/configuracoes.produto.bloc.dart';
import 'package:fastfood_inteligente_flutter/src/configuracoes/eventos/configuracoes.produto.eventos.dart';
import 'package:fastfood_inteligente_flutter/src/entrada/bloc/entrada.bloc.dart';
import 'package:fastfood_inteligente_flutter/src/entrada/eventos/entrada.eventos.dart';
import 'package:fastfood_inteligente_flutter/src/produtos/dominio/entidade/produto.entidade.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RecomecarDialogComponente extends StatefulWidget {
  @override
  _RecomecarDialogComponenteState createState() =>
      new _RecomecarDialogComponenteState();
}

class _RecomecarDialogComponenteState extends State<RecomecarDialogComponente> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Deseja recomeçar seu pedido?'),
      actions: <Widget>[
        TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Não')),
        TextButton(
            onPressed: () {
              context.read<EntradaBloc>().add(
                  ResetarProdutosReceberamIncrementoQuantidadeEntradaEventos());
              Navigator.pop(context);
            },
            child: Text('Sim')),
      ],
    );
  }
}
