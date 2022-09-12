import 'package:fastfood_inteligente_flutter/src/chapas/dominio/entidade/chapa.entidade.dart';
import 'package:fastfood_inteligente_flutter/src/chapas/dominio/objetosdevalor/ordem.objeto.dart';
import 'package:fastfood_inteligente_flutter/src/chapas/dominio/objetosdevalor/solicitacoes/solicitacao.cancelamento.pedido.objeto.dart';
import 'package:fastfood_inteligente_flutter/src/chapasdetrabalho/bloc/chapadetrabalho.bloc.dart';
import 'package:fastfood_inteligente_flutter/src/chapasdetrabalho/estados/selecaochapa.estados.dart';
import 'package:fastfood_inteligente_flutter/src/chapasdetrabalho/modelos/chapadetrabalho.solicitacoes.modelo.dart';
import 'package:fastfood_inteligente_flutter/src/configuracoes/bloc/configuracoes.chapa.bloc.dart';
import 'package:fastfood_inteligente_flutter/src/configuracoes/componentes/chapa/editar.chapa.dialog.componente.dart';
import 'package:fastfood_inteligente_flutter/src/configuracoes/componentes/chapa/inside.detalhes.solicitacao.pedido.cancelamento.componenteinsidedetalhes.dart';
import 'package:fastfood_inteligente_flutter/src/configuracoes/componentes/chapa/mover.pedido.entre.chapas.dialog.componente.dart';
import 'package:fastfood_inteligente_flutter/src/configuracoes/estados/configuracoes.chapa.estados.dart';
import 'package:fastfood_inteligente_flutter/src/configuracoes/eventos/configuracoes.chapa.eventos.dart';
import 'package:fastfood_inteligente_flutter/src/configuracoes/modelo/configuracoes.chapa.modelo.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetalhesChapaDialogComponente extends StatefulWidget {
  final ChapaEntidade chapaEntidade;
  DetalhesChapaDialogComponente(this.chapaEntidade);
  @override
  _DetalhesChapaDialogComponenteState createState() =>
      new _DetalhesChapaDialogComponenteState();
}

class _DetalhesChapaDialogComponenteState
    extends State<DetalhesChapaDialogComponente> {
  ChapaEntidade chapaSelecionada = ConfiguracoesChapaModelo.empty();
  var todasSolicitacoesCancelamento = [];
  SolicitacaoCancelamentoPedidoObjeto solicitacaoPresente =
      ChapasDeTrabalhoSolicitacoesModelo.empty();
  List listChapasAptas = [];
  @override
  Widget build(BuildContext context) {
    initState() {
      context.read<ConfiguracoesChapaBloc>().add(
          VigiarChapaEventoConfiguracoesEventos(
              widget.chapaEntidade.numerodachapa));
    }

    final chapabloc = context.watch<ConfiguracoesChapaBloc>();
    final chapastate = chapabloc.state;
    if (chapastate is VigiarChapaConfiguracoesChapaEstados) {
      chapaSelecionada = chapastate.chapa;
    }
    if (chapastate is CompletoConfiguracoesChapaEstados) {
      chapastate.lista.forEach((element) {
        if (element.estado == EChapaEstado.funcionando &&
            element.id != widget.chapaEntidade.id) {
          listChapasAptas.add(element);
          // var listaAdd = new List<int>.generate(tamanhoDaLista, (i) => 1000);
        }
        if (element.id == widget.chapaEntidade.id) {
          chapaSelecionada = element;
        }
      });
    }
    final chapaTrabalhoBloc = context.watch<ChapaDeTrabalhoBloc>();
    final chapaTrabalhoestado = chapaTrabalhoBloc.state;
    if (chapaTrabalhoestado
        is CompletoBuscarSolicitacoesConfiguracoesChapaEstados) {
      todasSolicitacoesCancelamento = chapaTrabalhoestado.lista;
    }

    return AlertDialog(
      content: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Row(
                children: [
                  Text('${chapaSelecionada.titulo}'),
                  IconButton(
                      onPressed: () {
                        print(chapaSelecionada.titulo);
                        showDialog(
                            context: context,
                            builder: (_) {
                              return EditarChapaDialogComponente(
                                  chapaSelecionada);
                            });
                      },
                      icon: const Icon(Icons.edit)),
                ],
              ),
            ),
            SizedBox(
              height: 35,
            ),
            Center(child: Text('PEDIDOS')),
            SizedBox(
              height: 30,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.9,
              height: MediaQuery.of(context).size.width * 0.6,
              child: ListView.builder(
                  itemCount: chapaSelecionada.ordens.length,
                  itemBuilder: (context, index) {
                    bool isaSolicitacao = false;
                    final ordem = chapaSelecionada.ordens[index];
                    todasSolicitacoesCancelamento.forEach((element) {
                      if (element.ordem.id == ordem.id) {
                        isaSolicitacao = true;
                        solicitacaoPresente = element;
                      }
                    });
                    if (ordem.estado != EOrdermEstado.feito) {
                      return Column(
                        children: [
                          Container(
                            width: double.infinity,
                            color: Colors.black26,
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        children: [
                                          Text('Pedido'),
                                          SizedBox(height: 10),
                                          Text('${ordem.id}'),
                                          SizedBox(height: 16),
                                          Text('Status'),
                                          SizedBox(height: 10),
                                          Text('${ordem.estado.name}')
                                        ],
                                      ),

                                      SizedBox(width: 15),
                                      if (isaSolicitacao)
                                        IconButton(
                                            color: Colors.orangeAccent,
                                            onPressed: () {
                                              showDialog(
                                                  context: context,
                                                  builder: (_) {
                                                    return PedidoCancelamentoInsideDetalhesDialogComponente(
                                                        solicitacaoPresente);
                                                  });
                                              //solicitacaoPresente
                                            },
                                            icon: const Icon(
                                                Icons.notification_important)),

                                      IconButton(
                                          onPressed: () {
                                            print(listChapasAptas.length);
                                            showDialog(
                                                context: context,
                                                builder: (_) {
                                                  return MoverPedidoEntreChapasDialogComponente(
                                                      ordem,
                                                      chapaSelecionada,
                                                      listChapasAptas);
                                                });
                                            // context.read<ConfiguracoesChapaBloc>().add(
                                            //     MoverPedidoEntreChapasEventoConfiguracoesEventos(
                                            //         ordem,
                                            //         widget.chapaEntidade,
                                            //         widget.chapaEntidade));
                                            // Navigator.pop(context);
                                          },
                                          icon:
                                              const Icon(Icons.change_circle)),

                                      // Icon(Icons.check_box),
                                      // Icon(Icons.check_box),
                                      // Icon(Icons.check_box),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  )
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          )
                        ],
                      );
                    } else {
                      return const SizedBox();
                    }
                  }),
            ),
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
