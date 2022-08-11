import 'package:fastfood_inteligente_flutter/src/chapas/dominio/entidade/chapa.entidade.dart';
import 'package:fastfood_inteligente_flutter/src/chapas/dominio/objetosdevalor/ordem.objeto.dart';
import 'package:fastfood_inteligente_flutter/src/chapas/dominio/objetosdevalor/solicitacoes/solicitacao.cancelamento.pedido.objeto.dart';
import 'package:fastfood_inteligente_flutter/src/chapasdetrabalho/bloc/chapadetrabalho.bloc.dart';
import 'package:fastfood_inteligente_flutter/src/chapasdetrabalho/componentes/motivo.deletar.pedido.dialog.componente.dart';
import 'package:fastfood_inteligente_flutter/src/chapasdetrabalho/estados/selecaochapa.estados.dart';
import 'package:fastfood_inteligente_flutter/src/chapasdetrabalho/eventos/selecaochapa.eventos.dart';
import 'package:fastfood_inteligente_flutter/src/chapasdetrabalho/modelos/chapadetrabalho.solicitacoes.modelo.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RequisitarDeletarPedidoDialogComponente extends StatefulWidget {
  final ChapaEntidade chapa;
  final Ordem ordem;
  final int indexOrdem;
  final ChapasDeTrabalhoSolicitacoesModelo solicitacaoCancelamentoPedidoObjeto;
  RequisitarDeletarPedidoDialogComponente(
      this.solicitacaoCancelamentoPedidoObjeto,
      this.chapa,
      this.ordem,
      this.indexOrdem);

  @override
  _RequisitarDeletarPedidoDialogComponenteState createState() =>
      new _RequisitarDeletarPedidoDialogComponenteState();
}

class _RequisitarDeletarPedidoDialogComponenteState
    extends State<RequisitarDeletarPedidoDialogComponente> {
  List<SolicitacaoCancelamentoPedidoObjeto> todasSolicitacoesCancelamento = [];
  bool selecionadoMotivo = false;

  SolicitacaoCancelamentoPedidoObjeto solicitacaoJaFeita =
      ChapasDeTrabalhoSolicitacoesModelo.empty();
  String motivo = 'nada';
  @override
  Widget build(BuildContext context) {
    bool repetido = false;
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
    todasSolicitacoesCancelamento.forEach((element) {
      if (element.ordem.id == widget.ordem.id) {
        solicitacaoJaFeita = element;
        repetido = true;
      }
    });
    var solicitacao = widget.solicitacaoCancelamentoPedidoObjeto;
    var _calculoPosicaoSolicitacao = todasSolicitacoesCancelamento.length + 1;
    solicitacao = solicitacao.copyWith(posicao: _calculoPosicaoSolicitacao);
    solicitacao =
        solicitacao.copyWith(id: 'solicitacao${_calculoPosicaoSolicitacao}');
    solicitacao = solicitacao.copyWith(motivo: motivo);
    if (!repetido) {
      return AlertDialog(
        title: const Text('Deseja solicitar remoção deste pedido?'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Pedido ${widget.ordem.id}'),
            SizedBox(height: 35),
            if (!selecionadoMotivo)
              Container(
                alignment: Alignment.center,
                width: 160,
                height: 40,
                color: Colors.black38,
                child: TextButton(
                    style: ButtonStyle(alignment: Alignment.center),
                    onPressed: () async {
                      await showDialog(
                          context: context,
                          builder: (_) {
                            return MotivoDeletarPedidoDialogComponente(
                              (value) => solicitacao =
                                  solicitacao.copyWith(motivo: value),
                            );
                          });
                      if (solicitacao.motivo != '') {
                        setState(() {
                          selecionadoMotivo = true;
                          motivo = solicitacao.motivo;
                        });
                      }

                      print('motivo = ${motivo}');
                      print(widget.chapa.titulo);
                    },
                    child: const Text('Selecionar Motivo')),
              ),
            if (selecionadoMotivo)
              Column(
                children: [
                  Container(
                    alignment: Alignment.center,
                    width: 160,
                    height: 40,
                    color: Colors.black38,
                    child: TextButton(
                        style: ButtonStyle(alignment: Alignment.center),
                        onPressed: () async {
                          await showDialog(
                              context: context,
                              builder: (_) {
                                return MotivoDeletarPedidoDialogComponente(
                                  (value) => solicitacao =
                                      solicitacao.copyWith(motivo: value),
                                );
                              });
                          if (solicitacao.motivo != '') {
                            setState(() {
                              selecionadoMotivo = true;
                              motivo = solicitacao.motivo;
                            });
                          }
                        },
                        child: const Text('Selecionar Motivo')),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                      height: 50,
                      child: Expanded(
                          child: Text(
                              'Motivo : ${motivo} nome da chapa : ${widget.chapa.titulo}'))),
                ],
              ),
          ],
        ),
        actions: <Widget>[
          TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancelar')),
          TextButton(
              onPressed: selecionadoMotivo
                  ? () {
                      context.read<ChapaDeTrabalhoBloc>().add(
                          RequisitarDeletarPedidoChapaDeTrabalhoEventos(
                              solicitacao));

                      Navigator.pop(context);
                    }
                  : null,
              child: !selecionadoMotivo
                  ? const Text('Confirmar (selecione motivo)')
                  : const Text('Confirmar')),

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
    } else {
      return AlertDialog(
        title: const Text('Solicitação ja iniciada'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
                'Aguarde confirmação do seu pedido de remoção, pedido de número ${solicitacaoJaFeita.ordem.id}. Motivo da devolução: ${solicitacaoJaFeita.motivo}'),
          ],
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
}
