import 'package:flutter/material.dart';

class RequisitarDeletarPedidoDialogComponente extends StatefulWidget {
  final int numeroDaChapa;
  final int indexOrdem;
  RequisitarDeletarPedidoDialogComponente(this.numeroDaChapa, this.indexOrdem);

  @override
  _RequisitarDeletarPedidoDialogComponenteState createState() =>
      new _RequisitarDeletarPedidoDialogComponenteState();
}

class _RequisitarDeletarPedidoDialogComponenteState
    extends State<RequisitarDeletarPedidoDialogComponente> {
  String motivo = '';
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Deseja solicitar remoção desta fila?'),
      actions: <Widget>[
        TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Não')),
        TextButton(onPressed: () {}, child: Text('Sim')),
        TextFormField(
          onChanged: (value) => setState(() {
            motivo = value;
          }),
          decoration: const InputDecoration(
            labelText: 'Qual o motivo para deletar',
            border: OutlineInputBorder(),
          ),
        ),
      ],
    );
  }
}
