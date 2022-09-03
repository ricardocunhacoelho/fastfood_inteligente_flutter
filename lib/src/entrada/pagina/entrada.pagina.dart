import 'package:fastfood_inteligente_flutter/src/chapas/dominio/objetosdevalor/ordem.objeto.dart';
import 'package:fastfood_inteligente_flutter/src/configuracoes/bloc/configuracoes.chapa.bloc.dart';
import 'package:fastfood_inteligente_flutter/src/configuracoes/bloc/configuracoes.produto.bloc.dart';
import 'package:fastfood_inteligente_flutter/src/configuracoes/estados/configuracoes.produto.estados.dart';
import 'package:fastfood_inteligente_flutter/src/configuracoes/eventos/configuracoes.chapa.eventos.dart';
import 'package:fastfood_inteligente_flutter/src/configuracoes/eventos/configuracoes.produto.eventos.dart';
import 'package:fastfood_inteligente_flutter/src/entrada/bloc/entrada.bloc.dart';
import 'package:fastfood_inteligente_flutter/src/entrada/componentes/contadorquantidade.entrada.componente.dart';
import 'package:fastfood_inteligente_flutter/src/entrada/componentes/finalizarpedido.dialog.componente.dart';
import 'package:fastfood_inteligente_flutter/src/entrada/componentes/mostrarpreco.entrada.componente.dart';
import 'package:fastfood_inteligente_flutter/src/entrada/estados/entrada.estados.dart';
import 'package:fastfood_inteligente_flutter/src/entrada/eventos/entrada.eventos.dart';
import 'package:fastfood_inteligente_flutter/src/entrada/modelo/entrada.ordem.model.dart';
import 'package:fastfood_inteligente_flutter/src/produtos/dominio/casodeuso/checarsefoiadicionadoproduto.casodeuso.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EntradaPagina extends StatefulWidget {
  const EntradaPagina({Key? key}) : super(key: key);

  @override
  State<EntradaPagina> createState() => _EntradaPaginaState();
}

class _EntradaPaginaState extends State<EntradaPagina> {
  Ordem ordemInicial = Ordem(
      produtos: [],
      embalarParaViajem: false,
      estado: EOrdermEstado.aguardando,
      id: 'ordem1',
      datahora: DateTime.now(),
      observacao: '',
      posicao: 1);

  @override
  Widget build(BuildContext context) {
    bool habilitar = false;
    final IChecarSeFoiAdicionadoProduto checarSeFoiAdicionadoProduto =
        ChecarSeFoiAdicionadoProduto();

    final produtobloc = context.watch<ConfiguracoesProdutoBloc>();
    final produtostate = produtobloc.state;
    final entradabloc = context.watch<EntradaBloc>();
    final entradastates = entradabloc.state;
    if (entradastates is CarregandoOrdemBaseEstados) {
      ordemInicial = EntradaOrdemModelo.empty();
    }
    if (entradastates is CompletoOrdemBaseEstados) {
      ordemInicial = entradastates.lista.first;
    }
    final valor = checarSeFoiAdicionadoProduto.call(produtostate);
    if (valor > 0) {
      habilitar = true;
    }
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Entrada'),
          centerTitle: true,
          elevation: 5,
          actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search))],
          bottom: const TabBar(isScrollable: true, tabs: [
            Tab(
              text: 'Lanches',
            ),
            Tab(
              text: 'Todos',
            ),
            Tab(
              text: 'Bebidas',
            ),
            Tab(
              text: 'Combos',
            ),
            Tab(
              text: 'Sobremesas',
            ),
          ]),
        ),
        body: Column(
          children: [
            Expanded(
              child: TabBarView(
                children: [
                  criarPagina('lanche', produtostate, habilitar, ordemInicial),
                  criarPagina('todos', produtostate, habilitar, ordemInicial),
                  criarPagina('bebida', produtostate, habilitar, ordemInicial),
                  criarPagina('combo', produtostate, habilitar, ordemInicial),
                  criarPagina(
                      'sobremesa', produtostate, habilitar, ordemInicial),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              color: Colors.black12,
              height: 90,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(
                      15,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          child: Text(
                            "TOTAL",
                            textAlign: TextAlign.start,
                          ),
                        ),
                        MostrarPrecoEntrada(),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(
                      15,
                    ),
                    width: 160,
                    height: 50,
                    decoration: BoxDecoration(
                      color: habilitar ? Colors.blue : Colors.black12,
                      borderRadius: BorderRadius.all(
                        Radius.circular(
                          5,
                        ),
                      ),
                    ),
                    child: TextButton(
                      style: TextButton.styleFrom(minimumSize: Size.infinite),
                      onPressed: habilitar
                          ? () {
                              showDialog(
                                  context: context,
                                  builder: (_) {
                                    return FinalizarPedidoDialogComponente(
                                        ordemInicial);
                                  });
                            }
                          : null,
                      child: Text(
                        "Finalizar",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget criarPagina(String pagina, ConfiguracoesProdutoEstados produtostate,
          bool habilitar, Ordem ordemInicial) =>
      Container(
        height: double.infinity,
        child: Column(mainAxisSize: MainAxisSize.max, children: [
          Expanded(
            child: Column(
              children: [
                SizedBox(height: 30),
                Text(
                  pagina.toUpperCase(),
                ),
                SizedBox(height: 25),
                if (produtostate is CarregandoConfiguracoesProdutoEstados)
                  Center(child: CircularProgressIndicator()),
                if (produtostate is CompletoConfiguracoesProdutoEstados)
                  SingleChildScrollView(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: produtostate.lista.length,
                      itemBuilder: (context, index) {
                        final produto = produtostate.lista[index];
                        if (produto.categoria.name == pagina.toLowerCase()) {
                          return ListTile(
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: 225,
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
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              '${produto.titulo} R\$${produto.preco}',
                                              style: TextStyle(fontSize: 13),
                                            ),
                                            SizedBox(
                                              height: 3,
                                            ),
                                            Text(
                                              '${produto.descricao}',
                                              style: TextStyle(fontSize: 11),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.centerRight,
                                  width: 150,
                                  child: ContadorQuantidadeComponente(
                                      produto: produto),
                                ),
                              ],
                            ),
                          );
                        } else {
                          return Container();
                        }
                      },
                    ),
                  ),
              ],
            ),
          ),
        ]),
      );
}
