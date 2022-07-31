import 'package:fastfood_inteligente_flutter/src/chapas/dominio/entidade/chapa.entidade.dart';
import 'package:fastfood_inteligente_flutter/src/chapas/dominio/objetosdevalor/ordem.objeto.dart';
import 'package:fastfood_inteligente_flutter/src/chapas/dominio/objetosdevalor/solicitacoes/solicitacao.cancelamento.pedido.objeto.dart';
import 'package:fastfood_inteligente_flutter/src/chapasdetrabalho/bloc/chapadetrabalho.bloc.dart';
import 'package:fastfood_inteligente_flutter/src/chapasdetrabalho/estados/selecaochapa.estados.dart';
import 'package:fastfood_inteligente_flutter/src/chapasdetrabalho/eventos/selecaochapa.eventos.dart';
import 'package:fastfood_inteligente_flutter/src/chapasdetrabalho/modelos/chapadetrabalho.solicitacoes.modelo.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RequisitarDeletarPedidoDialogComponente extends StatefulWidget {
  final ChapaEntidade chapa;
  final Ordem ordem;
  final int indexOrdem;
  RequisitarDeletarPedidoDialogComponente(
      this.chapa, this.ordem, this.indexOrdem);

  @override
  _RequisitarDeletarPedidoDialogComponenteState createState() =>
      new _RequisitarDeletarPedidoDialogComponenteState();
}

class _RequisitarDeletarPedidoDialogComponenteState
    extends State<RequisitarDeletarPedidoDialogComponente> {
  List<SolicitacaoCancelamentoPedidoObjeto> todasSolicitacoesCancelamento = [];

  @override
  Widget build(BuildContext context) {
    final chapaTrabalhoBloc = context.watch<ChapaDeTrabalhoBloc>();
    final chapaTrabalhoestado = chapaTrabalhoBloc.state;
    if (chapaTrabalhoestado
        is CompletoBuscarSolicitacoesConfiguracoesChapaEstados) {
      todasSolicitacoesCancelamento = chapaTrabalhoestado.lista;
    }
    if (chapaTrabalhoestado
        is CarregandoBuscarSolicitacoesConfiguracoesChapaEstados) {
      todasSolicitacoesCancelamento = [];
    }
    var solicitacao = ChapasDeTrabalhoSolicitacoesModelo.empty();
    var _calculoPosicaoSolicitacao = todasSolicitacoesCancelamento.length + 1;
    solicitacao = solicitacao.copyWith(posicao: _calculoPosicaoSolicitacao);
    solicitacao =
        solicitacao.copyWith(id: 'solicitacao${_calculoPosicaoSolicitacao}');
    solicitacao = solicitacao.copyWith(indexOrdem: widget.indexOrdem);
    //solicitacao = solicitacao.copyWith(chapa: widget.chapa);
    solicitacao = solicitacao.copyWith(ordem: widget.ordem);

    return AlertDialog(
      title: const Text('Deseja solicitar remoção desta fila?'),
      actions: <Widget>[
        TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Não')),
        TextButton(
            onPressed: () {
              context.read<ChapaDeTrabalhoBloc>().add(
                  RequisitarDeletarPedidoChapaDeTrabalhoEventos(solicitacao));

              Navigator.pop(context);
            },
            child: Text('Sim')),
        TextFormField(
          onChanged: (value) =>
              solicitacao = solicitacao.copyWith(motivo: value),
          decoration: const InputDecoration(
            labelText: 'Qual o motivo para deletar',
            border: OutlineInputBorder(),
          ),
        ),
      ],
    );
  }
}
