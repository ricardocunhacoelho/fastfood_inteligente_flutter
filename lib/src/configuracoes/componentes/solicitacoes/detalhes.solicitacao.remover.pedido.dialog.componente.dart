import 'package:fastfood_inteligente_flutter/src/chapas/dominio/objetosdevalor/solicitacoes/solicitacao.cancelamento.pedido.objeto.dart';
import 'package:flutter/material.dart';

class DetalhesSolicitacaoRemoverPedidoDialog extends StatefulWidget {
  final SolicitacaoCancelamentoPedidoObjeto solicitacaoCancelamentoPedidoObjeto;
  DetalhesSolicitacaoRemoverPedidoDialog(
      this.solicitacaoCancelamentoPedidoObjeto);
  @override
  _DetalhesSolicitacaoRemoverPedidoDialogState createState() =>
      new _DetalhesSolicitacaoRemoverPedidoDialogState();
}

class _DetalhesSolicitacaoRemoverPedidoDialogState
    extends State<DetalhesSolicitacaoRemoverPedidoDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(mainAxisSize: MainAxisSize.min, children: [
        Text(
            'Solicitação Pedido ${widget.solicitacaoCancelamentoPedidoObjeto.ordem.id}'),
        SizedBox(height: 10),
        Text(
            'Motivo da solicitação ${widget.solicitacaoCancelamentoPedidoObjeto.motivo}'),
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
