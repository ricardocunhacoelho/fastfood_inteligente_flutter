import 'package:fastfood_inteligente_flutter/src/configuracoes/bloc/configuracoes.chapa.bloc.dart';
import 'package:fastfood_inteligente_flutter/src/configuracoes/bloc/configuracoes.produto.bloc.dart';
import 'package:fastfood_inteligente_flutter/src/configuracoes/componentes/chapa/adicionar.chapa.dialog.componente.dart';
import 'package:fastfood_inteligente_flutter/src/configuracoes/componentes/chapa/deletar.chapa.dialog.componente.dart';
import 'package:fastfood_inteligente_flutter/src/configuracoes/componentes/chapa/editar.chapa.dialog.componente.dart';
import 'package:fastfood_inteligente_flutter/src/configuracoes/componentes/chapa/ligadeslig.chapa.botao.componente.dart';
import 'package:fastfood_inteligente_flutter/src/configuracoes/componentes/produto/adicionar.produto.dialog.componente.dart';
import 'package:fastfood_inteligente_flutter/src/configuracoes/componentes/produto/deletar.produto.dialog.componente.dart';
import 'package:fastfood_inteligente_flutter/src/configuracoes/componentes/produto/editar.produto.dialog.componente.dart';
import 'package:fastfood_inteligente_flutter/src/configuracoes/estados/configuracoes.chapa.estados.dart';
import 'package:fastfood_inteligente_flutter/src/configuracoes/estados/configuracoes.produto.estados.dart';
import 'package:fastfood_inteligente_flutter/src/configuracoes/eventos/configuracoes.chapa.eventos.dart';
import 'package:fastfood_inteligente_flutter/src/configuracoes/eventos/configuracoes.produto.eventos.dart';
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
    context
        .read<ConfiguracoesProdutoBloc>()
        .add(BuscarTodosProdutosEventoConfiguracoesEventos());
    context
        .read<ConfiguracoesChapaBloc>()
        .add(BuscarTodasChapasEventoConfiguracoesEventos());
  }

  bool isSwitched = false;

  // @override
  // void initState() {
  //   super.initState();
  //   context
  //       .read<ConfiguracoesProdutoBloc>()
  //       .add(BuscarTodosProdutosEventoConfiguracoesEventos());
  //   // context
  //   //     .read<ConfiguracoesChapaBloc>()
  //   //     .add(BuscarTodasChapasEventoConfiguracoesEventos());
  // }

  @override
  Widget build(BuildContext context) {
    final produtobloc = context.watch<ConfiguracoesProdutoBloc>();
    final produtostate = produtobloc.state;
    final chapabloc = context.watch<ConfiguracoesChapaBloc>();
    final chapastate = chapabloc.state;

    return Scaffold(
      appBar: AppBar(
        title: Text('Configurações'),
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            Row(
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
            if (produtostate is CompletoConfiguracoesProdutoEstados)
              ListView.builder(
                shrinkWrap: true,
                itemCount: produtostate.lista.length,
                itemBuilder: (context, index) {
                  final produto = produtostate.lista[index];
                  return ListTile(
                    title: Row(
                      children: [
                        Container(
                          width: 180,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
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
                                Text(
                                  '${produto.titulo} R\$${produto.preco}',
                                  style: TextStyle(fontSize: 13),
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                iconSize: 17,
                                onPressed: () {},
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
            SizedBox(height: 25),
            Row(
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
            SizedBox(height: 10),
            if (chapastate is CompletoConfiguracoesChapaEstados)
              ListView.builder(
                shrinkWrap: true,
                itemCount: chapastate.lista.length,
                itemBuilder: (context, index) {
                  final chapa = chapastate.lista[index];
                  return ListTile(
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${chapa.titulo} - ${chapa.numerodachapa}',
                          style: TextStyle(fontSize: 15),
                        ),
                        Container(
                          width: 180,
                          alignment: Alignment.centerRight,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              BotaoOnOffChapa(chapa),
                              IconButton(
                                iconSize: 17,
                                onPressed: () {
                                  showDialog(
                                      context: context,
                                      builder: (_) {
                                        return EditarChapaDialogComponente(
                                            chapa);
                                      });
                                },
                                icon: Icon(Icons.edit),
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
                  );
                },
              ),
            SizedBox(height: 30),
            Container(
                color: Colors.black38,
                width: 200,
                height: 50,
                child: TextButton(
                    onPressed: () {
                      context
                          .read<ConfiguracoesChapaBloc>()
                          .add(ResetarTodosPedidosEventoConfiguracoesEventos());
                    },
                    child: Text('RESETAR PEDIDOS'))),
          ],
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
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context
          .read<ConfiguracoesProdutoBloc>()
          .add(BuscarTodosProdutosEventoConfiguracoesEventos());

      context
          .read<ConfiguracoesChapaBloc>()
          .add(BuscarTodasChapasEventoConfiguracoesEventos());

      completeState();
    });
  }
}
