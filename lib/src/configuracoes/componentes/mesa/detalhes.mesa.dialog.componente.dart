import 'package:fastfood_inteligente_flutter/src/chapas/dominio/objetosdevalor/ordem.objeto.dart';
import 'package:fastfood_inteligente_flutter/src/mesas/dominio/entidade/mesa.entidade.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetalhesMesaDialogComponente extends StatefulWidget {
  final MesaEntidade mesa;
  DetalhesMesaDialogComponente(this.mesa);
  @override
  _DetalhesMesaDialogComponenteState createState() =>
      new _DetalhesMesaDialogComponenteState();
}

class _DetalhesMesaDialogComponenteState
    extends State<DetalhesMesaDialogComponente> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(mainAxisSize: MainAxisSize.min, children: [
        Container(
          child: Text('Mesa ${widget.mesa.numero}'),
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
