import 'package:fastfood_inteligente_flutter/src/chapas/dominio/entidade/chapa.entidade.dart';
import 'package:fastfood_inteligente_flutter/src/configuracoes/bloc/configuracoes.chapa.bloc.dart';
import 'package:fastfood_inteligente_flutter/src/configuracoes/eventos/configuracoes.chapa.eventos.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DeletarChapaDialogComponente extends StatefulWidget {
  final ChapaEntidade chapa;
  DeletarChapaDialogComponente(this.chapa);

  @override
  _DeletarChapaDialogComponenteState createState() =>
      new _DeletarChapaDialogComponenteState();
}

class _DeletarChapaDialogComponenteState
    extends State<DeletarChapaDialogComponente> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Deseja remover esta fila?'),
      actions: <Widget>[
        TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Não')),
        TextButton(
            onPressed: () {
              context
                  .read<ConfiguracoesChapaBloc>()
                  .add(DeletarChapaConfiguracoesEventos(widget.chapa));
              Navigator.pop(context);
            },
            child: Text('Sim')),
      ],
    );
  }
}
