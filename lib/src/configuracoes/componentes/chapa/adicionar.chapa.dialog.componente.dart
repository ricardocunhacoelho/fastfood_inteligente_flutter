import 'package:fastfood_inteligente_flutter/src/chapas/dominio/entidade/chapa.entidade.dart';
import 'package:fastfood_inteligente_flutter/src/configuracoes/componentes/chapa/calculonumerochapa.dart';
import 'package:fastfood_inteligente_flutter/src/configuracoes/estados/configuracoes.chapa.estados.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:fastfood_inteligente_flutter/src/configuracoes/bloc/configuracoes.chapa.bloc.dart';
import 'package:fastfood_inteligente_flutter/src/configuracoes/eventos/configuracoes.chapa.eventos.dart';
import 'package:fastfood_inteligente_flutter/src/configuracoes/modelo/configuracoes.chapa.modelo.dart';

class AdicionarChapaDialogComponente extends StatefulWidget {
  @override
  _AdicionarChapaDialogComponenteState createState() =>
      new _AdicionarChapaDialogComponenteState();
}

class _AdicionarChapaDialogComponenteState
    extends State<AdicionarChapaDialogComponente> {
  List<ChapaEntidade> todasChapas = [];
  @override
  Widget build(BuildContext context) {
    final chapabloc = context.watch<ConfiguracoesChapaBloc>();
    final chapastate = chapabloc.state;
    if (chapastate is CompletoConfiguracoesChapaEstados) {
      todasChapas = chapastate.lista;
    }
    if (chapastate is CarregandoConfiguracoesChapaEstados) {
      todasChapas = [];
    }
    var chapa = ConfiguracoesChapaModelo.empty();
    var _calculoNumeroChapa = CalculoNumeroChapa();
    int valorNumeroDaChapa = _calculoNumeroChapa.calcular(todasChapas);
    chapa = chapa.copyWith(numerodachapa: valorNumeroDaChapa);
    chapa = chapa.copyWith(id: 'chapa${valorNumeroDaChapa}');
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextFormField(
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
                  .add(AdicionarChapaConfiguracoesEventos(chapa));
              Navigator.pop(context);
            },
            child: Text('Salvar')),
      ],
    );
  }
}
