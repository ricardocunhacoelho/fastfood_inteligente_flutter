import 'package:fastfood_inteligente_flutter/src/chapas/dominio/entidade/chapa.entidade.dart';
import 'package:fastfood_inteligente_flutter/src/chapas/dominio/objetosdevalor/solicitacoes/solicitacao.cancelamento.pedido.objeto.dart';
import 'package:fastfood_inteligente_flutter/src/chapasdetrabalho/bloc/chapadetrabalho.bloc.dart';
import 'package:fastfood_inteligente_flutter/src/chapasdetrabalho/eventos/selecaochapa.eventos.dart';
import 'package:fastfood_inteligente_flutter/src/configuracoes/bloc/configuracoes.chapa.bloc.dart';
import 'package:fastfood_inteligente_flutter/src/configuracoes/eventos/configuracoes.chapa.eventos.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NegarPedidoCancelamentoDialog extends StatefulWidget {
  final SolicitacaoCancelamentoPedidoObjeto solicitacaoCancelamentoPedidoObjeto;
  NegarPedidoCancelamentoDialog(this.solicitacaoCancelamentoPedidoObjeto);

  @override
  _NegarPedidoCancelamentoDialogState createState() =>
      new _NegarPedidoCancelamentoDialogState();
}

class _NegarPedidoCancelamentoDialogState
    extends State<NegarPedidoCancelamentoDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
          'Negar solicitação de cancelamento do pedido ${widget.solicitacaoCancelamentoPedidoObjeto.ordem.id}?'),
      actions: <Widget>[
        TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Não')),
        TextButton(
            onPressed: () {
              context.read<ConfiguracoesChapaBloc>().add(
                  RemoverSolicitacaoCancelamentoPedidoEventoConfiguracoesEventos(
                      widget.solicitacaoCancelamentoPedidoObjeto));
              Navigator.pop(context);
            },
            child: Text('Sim')),
      ],
    );
  }
}
