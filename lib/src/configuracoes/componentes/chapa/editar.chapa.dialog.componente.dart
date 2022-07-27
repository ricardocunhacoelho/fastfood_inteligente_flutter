import 'package:fastfood_inteligente_flutter/src/chapas/dominio/entidade/chapa.entidade.dart';
import 'package:fastfood_inteligente_flutter/src/configuracoes/bloc/configuracoes.chapa.bloc.dart';
import 'package:fastfood_inteligente_flutter/src/configuracoes/eventos/configuracoes.chapa.eventos.dart';
import 'package:fastfood_inteligente_flutter/src/configuracoes/modelo/configuracoes.chapa.modelo.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditarChapaDialogComponente extends StatefulWidget {
  final ChapaEntidade chapaEntidade;
  EditarChapaDialogComponente(this.chapaEntidade);
  @override
  _EditarChapaDialogComponenteState createState() =>
      new _EditarChapaDialogComponenteState();
}

class _EditarChapaDialogComponenteState
    extends State<EditarChapaDialogComponente> {
  var chapa = ConfiguracoesChapaModelo.empty();
  @override
  void initState() {
    super.initState();
    chapa = ConfiguracoesChapaModelo.converter(widget.chapaEntidade);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextFormField(
            initialValue: chapa.titulo,
            onChanged: (value) => chapa = chapa.copyWith(titulo: value),
            decoration: InputDecoration(
              labelText: 'Chapa',
              border: OutlineInputBorder(),
            ),
          ),
        ],
      ),
      actions: <Widget>[
        TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Cancelar')),
        TextButton(
            onPressed: () {
              context
                  .read<ConfiguracoesChapaBloc>()
                  .add(AtualizarValoresChapaConfiguracoesEventos(chapa));
              Navigator.pop(context);
            },
            child: Text('Salvar')),
      ],
    );
  }
}
