import 'package:fastfood_inteligente_flutter/src/configuracoes/bloc/configuracoes.produto.bloc.dart';
import 'package:fastfood_inteligente_flutter/src/configuracoes/eventos/configuracoes.produto.eventos.dart';
import 'package:fastfood_inteligente_flutter/src/produtos/dominio/entidade/produto.entidade.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DeletarProdutoDialogComponente extends StatefulWidget {
  final ProdutoEntidade produto;
  DeletarProdutoDialogComponente(this.produto);

  @override
  _DeletarProdutoDialogComponenteState createState() =>
      new _DeletarProdutoDialogComponenteState();
}

class _DeletarProdutoDialogComponenteState
    extends State<DeletarProdutoDialogComponente> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Deseja remover este produto?'),
      actions: <Widget>[
        TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Não')),
        TextButton(
            onPressed: () {
              context
                  .read<ConfiguracoesProdutoBloc>()
                  .add(DeletarProdutoConfiguracoesEventos(widget.produto));
              Navigator.pop(context);
            },
            child: Text('Sim')),
      ],
    );
  }
}
