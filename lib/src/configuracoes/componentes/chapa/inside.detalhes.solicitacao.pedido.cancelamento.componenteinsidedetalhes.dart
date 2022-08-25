import 'package:fastfood_inteligente_flutter/src/chapas/dominio/entidade/chapa.entidade.dart';
import 'package:fastfood_inteligente_flutter/src/chapas/dominio/objetosdevalor/solicitacoes/solicitacao.cancelamento.pedido.objeto.dart';
import 'package:fastfood_inteligente_flutter/src/chapasdetrabalho/bloc/chapadetrabalho.bloc.dart';
import 'package:fastfood_inteligente_flutter/src/chapasdetrabalho/estados/selecaochapa.estados.dart';
import 'package:fastfood_inteligente_flutter/src/chapasdetrabalho/eventos/selecaochapa.eventos.dart';
import 'package:fastfood_inteligente_flutter/src/configuracoes/bloc/configuracoes.chapa.bloc.dart';
import 'package:fastfood_inteligente_flutter/src/configuracoes/componentes/chapa/editar.chapa.dialog.componente.dart';
import 'package:fastfood_inteligente_flutter/src/configuracoes/eventos/configuracoes.chapa.eventos.dart';
import 'package:fastfood_inteligente_flutter/src/configuracoes/modelo/configuracoes.chapa.modelo.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PedidoCancelamentoInsideDetalhesDialogComponente extends StatefulWidget {
  final SolicitacaoCancelamentoPedidoObjeto solicitacao;
  PedidoCancelamentoInsideDetalhesDialogComponente(this.solicitacao);
  @override
  _PedidoCancelamentoInsideDetalhesDialogComponenteState createState() =>
      new _PedidoCancelamentoInsideDetalhesDialogComponenteState();
}

class _PedidoCancelamentoInsideDetalhesDialogComponenteState
    extends State<PedidoCancelamentoInsideDetalhesDialogComponente> {
  var todasSolicitacoesCancelamento = [];

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              child: Row(
                children: [
                  Expanded(
                      child: Text(
                          'Existe uma solicitação de cancelamento deste pedido aberta pelo motivo: ${widget.solicitacao.motivo}')),
                ],
              ),
            ),
            SizedBox(height: 35),
            TextButton(
                onPressed: () {
                  context.read<ChapaDeTrabalhoBloc>().add(
                      RemoverPedidoChapaDeTrabalhoEventos(
                          widget.solicitacao.chapa.numerodachapa,
                          widget.solicitacao.indexOrdem,
                          widget.solicitacao));
                  Navigator.pop(context);
                },
                child: Text('Confirmar Remoção')),
            SizedBox(height: 7),
            TextButton(onPressed: () {}, child: Text('Negar Solicitação'))
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Voltar')),
      ],
    );
  }
}
