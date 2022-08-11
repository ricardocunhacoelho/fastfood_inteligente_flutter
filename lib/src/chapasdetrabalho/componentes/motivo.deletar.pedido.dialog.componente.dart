import 'package:fastfood_inteligente_flutter/src/chapas/dominio/entidade/chapa.entidade.dart';
import 'package:fastfood_inteligente_flutter/src/chapas/dominio/objetosdevalor/ordem.objeto.dart';
import 'package:fastfood_inteligente_flutter/src/chapas/dominio/objetosdevalor/solicitacoes/solicitacao.cancelamento.pedido.objeto.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MotivoDeletarPedidoDialogComponente extends StatefulWidget {
  final Function capturarMotivo;

  MotivoDeletarPedidoDialogComponente(this.capturarMotivo);
  @override
  _RequisitarDeletarPedidoDialogComponenteState createState() =>
      new _RequisitarDeletarPedidoDialogComponenteState();
}

class _RequisitarDeletarPedidoDialogComponenteState
    extends State<MotivoDeletarPedidoDialogComponente> {
  List<SolicitacaoCancelamentoPedidoObjeto> todasSolicitacoesCancelamento = [];
  final String texto1 = 'Selecione o motivo para remoção do pedido';
  final String texto2 = 'Cliente desistiu do atendimento';
  final String texto3 = 'Chapa com defeito (mover pedido para proxima chapa)';
  final String texto4 = 'Cliente foi embora do local';
  final String texto5 = 'Falta de ingrediente';
  final String texto6 = 'Outro Motivo';
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('${texto1}'),
      content: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 40),
            Container(
              color: Colors.black12,
              width: 260,
              height: 40,
              child: TextButton(
                  onPressed: () {
                    setState(() {
                      widget.capturarMotivo(texto2);
                    });
                    Navigator.pop(context);
                  },
                  child: Text('${texto2}')),
            ),
            const SizedBox(height: 30),
            Container(
              color: Colors.black12,
              width: 260,
              height: 60,
              child: TextButton(
                  onPressed: () {
                    widget.capturarMotivo(texto3);
                    Navigator.pop(context);
                  },
                  child: Text('${texto3}')),
            ),
            const SizedBox(height: 30),
            Container(
              color: Colors.black12,
              width: 260,
              height: 40,
              child: TextButton(
                  onPressed: () {
                    widget.capturarMotivo(texto4);
                    Navigator.pop(context);
                  },
                  child: Text('${texto4}')),
            ),
            const SizedBox(height: 30),
            Container(
              color: Colors.black12,
              width: 260,
              height: 40,
              child: TextButton(
                  onPressed: () {
                    widget.capturarMotivo(texto5);
                    Navigator.pop(context);
                  },
                  child: Text('${texto5}')),
            ),
            const SizedBox(height: 30),
            Container(
              color: Colors.black12,
              width: 260,
              height: 40,
              child: TextButton(
                  onPressed: () {
                    widget.capturarMotivo(texto6);
                    Navigator.pop(context);
                  },
                  child: Text('${texto6}')),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Voltar')),

        // TextFormField(
        //   onChanged: (value) =>
        //       solicitacao = solicitacao.copyWith(motivo: value),
        //   decoration: const InputDecoration(
        //     labelText: 'Qual o motivo para deletar',
        //     border: OutlineInputBorder(),
        //   ),
        // ),
      ],
    );
  }
}
