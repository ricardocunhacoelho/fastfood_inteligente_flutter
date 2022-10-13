import 'package:fastfood_inteligente_flutter/src/chapasdetrabalho/bloc/chapadetrabalho.bloc.dart';
import 'package:fastfood_inteligente_flutter/src/chapasdetrabalho/estados/selecaochapa.estados.dart';
import 'package:fastfood_inteligente_flutter/src/chapasdetrabalho/eventos/selecaochapa.eventos.dart';
import 'package:fastfood_inteligente_flutter/src/configuracoes/bloc/configuracoes.chapa.bloc.dart';
import 'package:fastfood_inteligente_flutter/src/configuracoes/bloc/configuracoes.produto.bloc.dart';
import 'package:fastfood_inteligente_flutter/src/configuracoes/componentes/chapa/adicionar.chapa.dialog.componente.dart';
import 'package:fastfood_inteligente_flutter/src/configuracoes/componentes/chapa/botao.resetar.pedidos.configuracoes.componente.dart';
import 'package:fastfood_inteligente_flutter/src/configuracoes/componentes/chapa/caixa.lista.chapas.configuracoes.dart';
import 'package:fastfood_inteligente_flutter/src/configuracoes/componentes/chapa/lista.solicitacoes.cancelamento.configuracoes.dart';
import 'package:fastfood_inteligente_flutter/src/configuracoes/componentes/produto/adicionar.produto.dialog.componente.dart';
import 'package:fastfood_inteligente_flutter/src/configuracoes/componentes/produto/caixa.lista.produtos.configuracoes.dart';
import 'package:fastfood_inteligente_flutter/src/configuracoes/componentes/solicitacoes/confirmar.remover.pedido.dialog.componente.dart';
import 'package:fastfood_inteligente_flutter/src/configuracoes/componentes/solicitacoes/detalhes.solicitacao.remover.pedido.dialog.componente.dart';
import 'package:fastfood_inteligente_flutter/src/configuracoes/componentes/solicitacoes/negar.pedido.cancelamento.dialog.componente.dart';
import 'package:fastfood_inteligente_flutter/src/configuracoes/eventos/configuracoes.chapa.eventos.dart';
import 'package:fastfood_inteligente_flutter/src/configuracoes/eventos/configuracoes.produto.eventos.dart';
import 'package:fastfood_inteligente_flutter/src/entrada/bloc/entrada.bloc.dart';
import 'package:fastfood_inteligente_flutter/src/entrada/eventos/entrada.eventos.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ConfiguracoesPage extends StatefulWidget {
  const ConfiguracoesPage({Key? key}) : super(key: key);

  @override
  State<ConfiguracoesPage> createState() => _ConfiguracoesPageState();
}

class _ConfiguracoesPageState extends State<ConfiguracoesPage>
    with CompleteStateMixin {
  @override
  void completeState() {
    context.read<EntradaBloc>().add(BuscarOrdemBaseEntradaEventos());
    context
        .read<ConfiguracoesProdutoBloc>()
        .add(BuscarTodosProdutosEventoConfiguracoesEventos());

    context
        .read<ConfiguracoesChapaBloc>()
        .add(BuscarTodasChapasEventoConfiguracoesEventos());

    context
        .read<ChapaDeTrabalhoBloc>()
        .add(BuscarTodasSolicitacoesCancelamentoPedidoChapaDeTrabalhoEventos());
  }

  bool isSwitched = false;
  List todasSolicitacoes = [];
  @override
  Widget build(BuildContext context) {
    final produtobloc = context.watch<ConfiguracoesProdutoBloc>();
    final produtostate = produtobloc.state;
    final chapabloc = context.watch<ConfiguracoesChapaBloc>();
    final chapastate = chapabloc.state;
    final chapaTrabalhoBloc = context.watch<ChapaDeTrabalhoBloc>();
    final solicitacoesState = chapaTrabalhoBloc.state;

    if (solicitacoesState
        is CompletoBuscarSolicitacoesConfiguracoesChapaEstados) {
      todasSolicitacoes = solicitacoesState.lista;
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Configurações'),
      ),
      body: Container(
        child: Scrollbar(
          isAlwaysShown: true,
          showTrackOnHover: true,
          child: ListView(
            children: [
              //PRODUTOS - ADICIONAR PRODUTOS
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 40, right: 40, top: 20, bottom: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('PRODUTOS',
                            style: TextStyle(
                              fontSize: 15,
                            )),
                        IconButton(
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (_) {
                                  return AdicionarProdutoDialogComponente();
                                });
                          },
                          icon: const Icon(Icons.add_circle),
                        ),
                      ],
                    ),
                  ),

                  //LISTA PRODUTOS
                  listaProdutosConfiguracoes(produtostate, context),
                ],
              ),
              const SizedBox(height: 20),

              //CHAPAS - ADICIONAR CHAPAS
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 40, right: 40, top: 20, bottom: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'CHAPAS',
                          style: TextStyle(fontSize: 15),
                        ),
                        IconButton(
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (_) {
                                  return AdicionarChapaDialogComponente();
                                });
                          },
                          icon: const Icon(
                            Icons.add_circle,
                          ),
                        ),
                      ],
                    ),
                  ),

                  //LISTA CHAPAS
                  listaChapasConfiguracoes(chapastate, context),
                ],
              ),
              const SizedBox(height: 35),

              //BOTÃO RESETAR PEDIDOS
              botaoResetarPedidos(context),

              //SOLICITAÇOES
              todasSolicitacoes.isEmpty
                  ? const SizedBox(height: 35)
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(height: 30),
                        Container(
                          width: double.infinity,
                          color: Colors.black38,
                          child: const Center(
                            child: Text(
                              'SOLICITAÇÕES',
                              style: TextStyle(fontSize: 15),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        //LISTA DE SOLICITAÇOES
                        listaSolicitacoesCancelamentoConfiguracoes(
                            solicitacoesState, context),
                        const SizedBox(height: 30),
                      ],
                    ),
            ],
          ),
        ),
      ),
    );
  }
}

mixin CompleteStateMixin<T extends StatefulWidget> on State<T> {
  void completeState();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      context.read<EntradaBloc>().add(BuscarOrdemBaseEntradaEventos());
      context
          .read<ConfiguracoesProdutoBloc>()
          .add(BuscarTodosProdutosEventoConfiguracoesEventos());

      context
          .read<ConfiguracoesChapaBloc>()
          .add(BuscarTodasChapasEventoConfiguracoesEventos());

      context.read<ChapaDeTrabalhoBloc>().add(
          BuscarTodasSolicitacoesCancelamentoPedidoChapaDeTrabalhoEventos());

      completeState();
    });
  }
}
