import 'package:fastfood_inteligente_flutter/src/chapas/dominio/objetosdevalor/ordem.objeto.dart';
import 'package:fastfood_inteligente_flutter/src/produtos/dominio/entidade/produto.entidade.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetalhesProdutoDialogComponente extends StatefulWidget {
  final ProdutoEntidade produto;
  DetalhesProdutoDialogComponente(this.produto);
  @override
  _DetalhesProdutoDialogComponenteState createState() =>
      new _DetalhesProdutoDialogComponenteState();
}

class _DetalhesProdutoDialogComponenteState
    extends State<DetalhesProdutoDialogComponente> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(mainAxisSize: MainAxisSize.min, children: [
        Container(
          child: Text('${widget.produto.titulo} - ${widget.produto.descricao}'),
        ),
      ]),
      actions: <Widget>[
        TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Center(child: Text('Voltar'))),
      ],
    );
  }
}
