import 'package:fastfood_inteligente_flutter/src/chapasdetrabalho/bloc/chapadetrabalho.bloc.dart';
import 'package:fastfood_inteligente_flutter/src/chapasdetrabalho/estados/selecaochapa.estados.dart';
import 'package:fastfood_inteligente_flutter/src/chapasdetrabalho/eventos/selecaochapa.eventos.dart';
import 'package:fastfood_inteligente_flutter/src/configuracoes/bloc/configuracoes.chapa.bloc.dart';
import 'package:fastfood_inteligente_flutter/src/configuracoes/bloc/configuracoes.produto.bloc.dart';
import 'package:fastfood_inteligente_flutter/src/configuracoes/componentes/chapa/adicionar.chapa.dialog.componente.dart';
import 'package:fastfood_inteligente_flutter/src/configuracoes/componentes/chapa/deletar.chapa.dialog.componente.dart';
import 'package:fastfood_inteligente_flutter/src/configuracoes/componentes/chapa/detalhes.chapa.dialog.componente.dart';
import 'package:fastfood_inteligente_flutter/src/configuracoes/componentes/chapa/editar.chapa.dialog.componente.dart';
import 'package:fastfood_inteligente_flutter/src/configuracoes/componentes/chapa/ligadeslig.chapa.botao.componente.dart';
import 'package:fastfood_inteligente_flutter/src/configuracoes/componentes/produto/adicionar.produto.dialog.componente.dart';
import 'package:fastfood_inteligente_flutter/src/configuracoes/componentes/produto/deletar.produto.dialog.componente.dart';
import 'package:fastfood_inteligente_flutter/src/configuracoes/componentes/produto/detalhes.produto.dialog.componente.dart';
import 'package:fastfood_inteligente_flutter/src/configuracoes/componentes/produto/editar.produto.dialog.componente.dart';
import 'package:fastfood_inteligente_flutter/src/configuracoes/componentes/solicitacoes/confirmar.remover.pedido.dialog.componente.dart';
import 'package:fastfood_inteligente_flutter/src/configuracoes/componentes/solicitacoes/detalhes.solicitacao.remover.pedido.dialog.componente.dart';
import 'package:fastfood_inteligente_flutter/src/configuracoes/componentes/solicitacoes/negar.pedido.cancelamento.dialog.componente.dart';
import 'package:fastfood_inteligente_flutter/src/configuracoes/estados/configuracoes.chapa.estados.dart';
import 'package:fastfood_inteligente_flutter/src/configuracoes/estados/configuracoes.produto.estados.dart';
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
    final chapaTrabalhoEstado = chapaTrabalhoBloc.state;

    if (chapaTrabalhoEstado
        is CompletoBuscarSolicitacoesConfiguracoesChapaEstados) {
      todasSolicitacoes = chapaTrabalhoEstado.lista;
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
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 40, right: 40, top: 20, bottom: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'PRODUTOS',
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (_) {
                                  return AdicionarProdutoDialogComponente();
                                });
                          },
                          icon: const Icon(
                            Icons.add_circle,
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (produtostate is ErroConfiguracoesProdutoEstados)
                    Text(produtostate.menssagem),
                  if (produtostate is CarregandoConfiguracoesProdutoEstados)
                    Container(
                        color: Colors.black26,
                        width: MediaQuery.of(context).size.width * 0.9,
                        height: MediaQuery.of(context).size.width * 0.8,
                        child: Center(
                          child: CircularProgressIndicator(),
                        )),
                  if (produtostate is CompletoConfiguracoesProdutoEstados)
                    Container(
                      color: Colors.black26,
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: MediaQuery.of(context).size.width * 0.8,
                      child: Scrollbar(
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: produtostate.lista.length,
                          itemBuilder: (context, index) {
                            final produto = produtostate.lista[index];
                            return ListTile(
                              title: Row(
                                children: [
                                  Container(
                                    width: 150,
                                    child: Container(
                                      width: 200,
                                      child: Row(
                                        children: [
                                          Image.asset(
                                            'assets/${produto.imagem}',
                                            height: 45,
                                            width: 45,
                                            fit: BoxFit.fitWidth,
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Expanded(
                                            child: Text(
                                              '${produto.titulo} R\$${produto.preco}',
                                              style: TextStyle(fontSize: 13),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Container(
                                    width: 150,
                                    alignment: Alignment.centerRight,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        IconButton(
                                          iconSize: 17,
                                          onPressed: () {
                                            showDialog(
                                                context: context,
                                                builder: (_) {
                                                  return DetalhesProdutoDialogComponente(
                                                      produto);
                                                });
                                          },
                                          icon: Icon(
                                            Icons.description_sharp,
                                          ),
                                        ),
                                        IconButton(
                                          iconSize: 17,
                                          onPressed: () {
                                            showDialog(
                                                context: context,
                                                builder: (_) {
                                                  return EditarProdutoDialogComponente(
                                                      produto);
                                                });
                                          },
                                          icon: Icon(
                                            Icons.edit,
                                          ),
                                        ),
                                        IconButton(
                                          iconSize: 17,
                                          onPressed: () {
                                            showDialog(
                                                context: context,
                                                builder: (_) {
                                                  return DeletarProdutoDialogComponente(
                                                      produto);
                                                });
                                          },
                                          icon: Icon(
                                            Icons.remove,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
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
                          style: TextStyle(
                            fontSize: 15,
                          ),
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
                  if (chapastate is CompletoConfiguracoesChapaEstados)
                    Container(
                      color: Colors.black12,
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: MediaQuery.of(context).size.width * 0.5,
                      child: Scrollbar(
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: chapastate.lista.length,
                          itemBuilder: (context, index) {
                            final chapa = chapastate.lista[index];
                            return Column(
                              children: [
                                Container(
                                  child: ListTile(
                                    title: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          '${chapa.titulo} - ${chapa.numerodachapa}',
                                          style: TextStyle(fontSize: 15),
                                        ),
                                        Container(
                                          alignment: Alignment.centerRight,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              BotaoOnOffChapa(chapa),
                                              IconButton(
                                                iconSize: 17,
                                                onPressed: () {
                                                  showDialog(
                                                      context: context,
                                                      builder: (_) {
                                                        return DetalhesChapaDialogComponente(
                                                            chapa);
                                                      });
                                                },
                                                icon: Icon(
                                                    Icons.description_sharp),
                                              ),
                                              IconButton(
                                                iconSize: 17,
                                                onPressed: () {
                                                  showDialog(
                                                      context: context,
                                                      builder: (_) {
                                                        return DeletarChapaDialogComponente(
                                                            chapa);
                                                      });
                                                },
                                                icon: Icon(
                                                  Icons.remove,
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    ),
                ],
              ),
              SizedBox(height: 35),
              Center(
                child: Container(
                    color: Colors.black38,
                    width: 200,
                    height: 50,
                    child: TextButton(
                        onPressed: () {
                          context.read<ConfiguracoesChapaBloc>().add(
                              ResetarTodosPedidosEventoConfiguracoesEventos());
                        },
                        child: Text('RESETAR PEDIDOS'))),
              ),
              if (todasSolicitacoes.length == 0)
                SizedBox(
                  height: 35,
                ),
              if (todasSolicitacoes.length != 0)
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      width: double.infinity,
                      color: Colors.black38,
                      child: Center(
                        child: const Text(
                          'SOLICITAÇÕES',
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    if (chapaTrabalhoEstado
                        is CompletoBuscarSolicitacoesConfiguracoesChapaEstados)
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: chapaTrabalhoEstado.lista.length,
                        itemBuilder: (context, index) {
                          final solicitacao = chapaTrabalhoEstado.lista[index];
                          return ListTile(
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Text(
                                    'Solicitação ${solicitacao.chapa.titulo} - Ordem ${solicitacao.ordem.id}',
                                    style: TextStyle(fontSize: 15),
                                  ),
                                ),
                                Container(
                                  width: 180,
                                  alignment: Alignment.centerRight,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      IconButton(
                                          iconSize: 17,
                                          onPressed: () {
                                            showDialog(
                                                context: context,
                                                builder: (_) {
                                                  return DetalhesSolicitacaoRemoverPedidoDialog(
                                                      solicitacao);
                                                });
                                          },
                                          icon: Icon(
                                              Icons.library_books_rounded)),
                                      IconButton(
                                        iconSize: 17,
                                        onPressed: () {
                                          showDialog(
                                              context: context,
                                              builder: (_) {
                                                return ConfirmarRemoverPedidoDialog(
                                                    solicitacao);
                                              });
                                        },
                                        icon: Icon(Icons.check),
                                      ),
                                      IconButton(
                                        iconSize: 17,
                                        onPressed: () {
                                          showDialog(
                                              context: context,
                                              builder: (_) {
                                                return NegarPedidoCancelamentoDialog(
                                                    solicitacao);
                                              });
                                        },
                                        icon: Icon(Icons.close),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                      ),
                    SizedBox(height: 30),
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
