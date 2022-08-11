import 'package:fastfood_inteligente_flutter/src/chapas/dominio/entidade/chapa.entidade.dart';
import 'package:fastfood_inteligente_flutter/src/chapas/dominio/objetosdevalor/solicitacoes/solicitacao.cancelamento.pedido.objeto.dart';
import 'package:fastfood_inteligente_flutter/src/chapasdetrabalho/bloc/chapadetrabalho.bloc.dart';
import 'package:fastfood_inteligente_flutter/src/chapasdetrabalho/eventos/selecaochapa.eventos.dart';
import 'package:fastfood_inteligente_flutter/src/configuracoes/bloc/configuracoes.chapa.bloc.dart';
import 'package:fastfood_inteligente_flutter/src/configuracoes/eventos/configuracoes.chapa.eventos.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ConfirmarRemoverPedidoDialog extends StatefulWidget {
  final SolicitacaoCancelamentoPedidoObjeto solicitacaoCancelamentoPedidoObjeto;
  ConfirmarRemoverPedidoDialog(this.solicitacaoCancelamentoPedidoObjeto);

  @override
  _ConfirmarRemoverPedidoDialogState createState() =>
      new _ConfirmarRemoverPedidoDialogState();
}

class _ConfirmarRemoverPedidoDialogState
    extends State<ConfirmarRemoverPedidoDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Confirmar remoção deste pedido?'),
      actions: <Widget>[
        TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Não')),
        TextButton(
            onPressed: () {
              context.read<ChapaDeTrabalhoBloc>().add(
                  RemoverPedidoChapaDeTrabalhoEventos(
                      widget.solicitacaoCancelamentoPedidoObjeto.chapa
                          .numerodachapa,
                      widget.solicitacaoCancelamentoPedidoObjeto.indexOrdem));
              Navigator.pop(context);
            },
            child: Text('Sim')),
      ],
    );
  }
}
