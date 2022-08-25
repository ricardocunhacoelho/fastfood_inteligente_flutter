import 'package:fastfood_inteligente_flutter/src/chapas/dominio/entidade/chapa.entidade.dart';
import 'package:fastfood_inteligente_flutter/src/chapas/dominio/objetosdevalor/ordem.objeto.dart';
import 'package:fastfood_inteligente_flutter/src/chapas/dominio/objetosdevalor/solicitacoes/solicitacao.cancelamento.pedido.objeto.dart';
import 'package:fastfood_inteligente_flutter/src/chapasdetrabalho/bloc/chapadetrabalho.bloc.dart';
import 'package:fastfood_inteligente_flutter/src/chapasdetrabalho/componentes/requisitar.deletar.pedido.dialog.componente.dart';
import 'package:fastfood_inteligente_flutter/src/chapasdetrabalho/estados/selecaochapa.estados.dart';
import 'package:fastfood_inteligente_flutter/src/chapasdetrabalho/eventos/selecaochapa.eventos.dart';
import 'package:fastfood_inteligente_flutter/src/chapasdetrabalho/modelos/chapadetrabalho.solicitacoes.modelo.dart';
import 'package:fastfood_inteligente_flutter/src/chapasdetrabalho/paginas/componentes/detalhes.pedido.dialog.componente.dart';
import 'package:fastfood_inteligente_flutter/src/configuracoes/bloc/configuracoes.chapa.bloc.dart';
import 'package:fastfood_inteligente_flutter/src/configuracoes/componentes/chapa/inside.detalhes.solicitacao.pedido.cancelamento.componenteinsidedetalhes.dart';
import 'package:fastfood_inteligente_flutter/src/configuracoes/estados/configuracoes.chapa.estados.dart';
import 'package:fastfood_inteligente_flutter/src/configuracoes/modelo/configuracoes.chapa.modelo.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListaPedidosComponente extends StatefulWidget {
  final int numeroDaChapa;
  final EOrdermEstado estado;
  ListaPedidosComponente(this.numeroDaChapa, this.estado);
  @override
  _ListaPedidosComponenteState createState() =>
      new _ListaPedidosComponenteState();
}

class _ListaPedidosComponenteState extends State<ListaPedidosComponente> {
  bool isaSolicitacao = false;
  List todasSolicitacoes = [];
  List listChapas = [];
  var todasSolicitacoesCancelamento = [];
  bool repetida = false;
  var solicitacao = ChapasDeTrabalhoSolicitacoesModelo.empty();
  SolicitacaoCancelamentoPedidoObjeto solicitacaoPresente =
      ChapasDeTrabalhoSolicitacoesModelo.empty();
  @override
  Widget build(BuildContext context) {
    ChapaEntidade chapa = ConfiguracoesChapaModelo.empty();
    bool repetida = false;
    var todasSolicitacoesCancelamento = [];
    final chapaTrabalhoBloc = context.watch<ChapaDeTrabalhoBloc>();
    final chapaTrabalhoestado = chapaTrabalhoBloc.state;
    if (chapaTrabalhoestado
        is CompletoBuscarSolicitacoesConfiguracoesChapaEstados) {
      todasSolicitacoesCancelamento = chapaTrabalhoestado.lista;
    }
    final chapabloc = context.watch<ConfiguracoesChapaBloc>();
    final chapastate = chapabloc.state;

    if (chapastate is CompletoConfiguracoesChapaEstados) {
      chapastate.lista.forEach((element) {
        if (element.numerodachapa == widget.numeroDaChapa) {
          chapa = element;
        }
      });
    }

    return SingleChildScrollView(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: chapa.ordens.length,
        itemBuilder: (context, index) {
          final ordem = chapa.ordens[index];
          final indexAgora = index;
          solicitacao = solicitacao.copyWith(chapa: chapa);
          solicitacao = solicitacao.copyWith(ordem: ordem);
          solicitacao = solicitacao.copyWith(indexOrdem: indexAgora);
          todasSolicitacoesCancelamento.forEach((element) {
            if (element.ordem.id == ordem.id) {
              isaSolicitacao = true;
              solicitacaoPresente = element;
            }
          });
          if (ordem.estado == EOrdermEstado.aguardando &&
              widget.estado == EOrdermEstado.aguardando) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: 100,
                    color: Colors.black38,
                    child: ListTile(
                      title: Padding(
                        padding: const EdgeInsets.only(
                            right: 10, top: 15, bottom: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Text('Pedido'),
                                SizedBox(height: 10),
                                Text('${ordem.id}')
                              ],
                            ),
                            SizedBox(width: 17),
                            Column(
                              children: [
                                Text('Status'),
                                SizedBox(height: 10),
                                Text('${ordem.estado.name}')
                              ],
                            ),
                            SizedBox(width: 30),
                            if (!isaSolicitacao)
                              IconButton(
                                  onPressed: () async {
                                    showDialog(
                                        context: context,
                                        builder: (_) {
                                          return RequisitarDeletarPedidoDialogComponente(
                                              solicitacao, chapa, ordem, index);
                                        });
                                  },
                                  icon: const Icon(
                                      Icons.restore_from_trash_rounded)),
                            IconButton(
                                onPressed: () {
                                  context.read<ChapaDeTrabalhoBloc>().add(
                                      AtualizarEstadoPedidoChapaDeTrabalhoEventos(
                                          'atendendo', index, chapa));
                                },
                                icon: const Icon(
                                  Icons.check_box,
                                  // color: Colors.lightGreen,
                                )),
                            if (isaSolicitacao)
                              IconButton(
                                  color: Colors.orangeAccent,
                                  onPressed: () async {
                                    showDialog(
                                        context: context,
                                        builder: (_) {
                                          return RequisitarDeletarPedidoDialogComponente(
                                              solicitacao, chapa, ordem, index);
                                        });
                                  },
                                  icon:
                                      const Icon(Icons.notification_important)),

                            IconButton(
                                onPressed: () {
                                  showDialog(
                                      context: context,
                                      builder: (_) {
                                        return DetalhesPedidoDialogComponente(
                                            ordem);
                                      });
                                },
                                icon: const Icon(Icons.library_books)),

                            // Icon(Icons.check_box),
                            // Icon(Icons.check_box),
                            // Icon(Icons.check_box),
                          ],
                        ),
                      ),
                      subtitle: Row(),
                    ),
                  ),
                  const SizedBox(height: 25),
                ],
              ),
            );
          }
          if (ordem.estado == EOrdermEstado.atendendo &&
              widget.estado == EOrdermEstado.atendendo) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: 100,
                    color: Colors.black38,
                    child: ListTile(
                      title: Padding(
                        padding: const EdgeInsets.only(
                            right: 10, top: 15, bottom: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Text('Pedido'),
                                SizedBox(height: 10),
                                Text('${ordem.id}')
                              ],
                            ),
                            SizedBox(width: 17),
                            Column(
                              children: [
                                Text('Status'),
                                SizedBox(height: 10),
                                Text('${ordem.estado.name}')
                              ],
                            ),
                            SizedBox(width: 30),
                            IconButton(
                                onPressed: () {
                                  showDialog(
                                      context: context,
                                      builder: (_) {
                                        return RequisitarDeletarPedidoDialogComponente(
                                            solicitacao,
                                            chapa,
                                            ordem,
                                            indexAgora);
                                      });
                                },
                                icon: const Icon(
                                    Icons.restore_from_trash_rounded)),
                            IconButton(
                                onPressed: () {
                                  context.read<ChapaDeTrabalhoBloc>().add(
                                      AtualizarEstadoPedidoChapaDeTrabalhoEventos(
                                          'aguardando', index, chapa));
                                },
                                icon: const Icon(
                                  Icons.check_box,
                                  color: Colors.orangeAccent,
                                )),
                            IconButton(
                                onPressed: () {
                                  showDialog(
                                      context: context,
                                      builder: (_) {
                                        return DetalhesPedidoDialogComponente(
                                            ordem);
                                      });
                                },
                                icon: const Icon(Icons.library_books)),

                            // Icon(Icons.check_box),
                            // Icon(Icons.check_box),
                            // Icon(Icons.check_box),
                          ],
                        ),
                      ),
                      subtitle: Row(),
                    ),
                  ),
                  const SizedBox(height: 25),
                ],
              ),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
