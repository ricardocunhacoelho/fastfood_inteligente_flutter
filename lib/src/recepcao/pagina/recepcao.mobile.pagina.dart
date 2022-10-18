import 'package:fastfood_inteligente_flutter/src/configuracoes/bloc/configuracoes.produto.bloc.dart';
import 'package:fastfood_inteligente_flutter/src/recepcao/bloc/entrada.bloc.dart';
import 'package:fastfood_inteligente_flutter/src/recepcao/componentes/caixa.recomecar.valor.finalizar.componente.mobile.dart';
import 'package:fastfood_inteligente_flutter/src/recepcao/componentes/lista.produtos.recepcao.mobile.dart';
import 'package:fastfood_inteligente_flutter/src/produtos/dominio/casodeuso/checarsefoiadicionadoproduto.casodeuso.dart';
import 'package:fastfood_inteligente_flutter/src/recepcao/estados/entrada.estados.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RecepcaoMobile extends StatefulWidget {
  const RecepcaoMobile({Key? key}) : super(key: key);

  @override
  State<RecepcaoMobile> createState() => _RecepcaoMobileState();
}

class _RecepcaoMobileState extends State<RecepcaoMobile> {
  double tamanho = 90;

  @override
  Widget build(BuildContext context) {
    bool habilitar = false;
    final produtobloc = context.watch<ConfiguracoesProdutoBloc>();
    final produtostate = produtobloc.state;
    final entradabloc = context.watch<EntradaBloc>();
    final entradastates = entradabloc.state;
    if (entradastates is CarregaListaProdutosAdicionadosPedidoEntradaEstados) {
      if (entradastates.produtos.isNotEmpty) {
        setState(() {
          habilitar = true;
        });
      }
    }
    if (habilitar) {
      setState(() {
        tamanho = 108;
      });
    } else {
      setState(() {
        tamanho = 90;
      });
    }
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Entrada'),
          centerTitle: true,
          elevation: 5,
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.search))
          ],
          bottom: const TabBar(
              indicatorColor: Colors.orangeAccent,
              isScrollable: true,
              tabs: [
                Tab(text: 'Lanches'),
                Tab(text: 'Todos'),
                Tab(text: 'Bebidas'),
                Tab(text: 'Combos'),
                Tab(text: 'Sobremesas'),
              ]),
        ),
        body: Column(
          children: [
            //LISTA PRODUTOS
            Expanded(
              child: TabBarView(
                children: [
                  listaProdutosRecepcaoMobile('lanche', produtostate),
                  listaProdutosRecepcaoMobile('todos', produtostate),
                  listaProdutosRecepcaoMobile('bebida', produtostate),
                  listaProdutosRecepcaoMobile('combo', produtostate),
                  listaProdutosRecepcaoMobile('sobremesa', produtostate),
                ],
              ),
            ),
            //CAIXA VALOR, RECOMECAR, FINALIZAR
            caixaValorRecomecarFinalizarRecepcaoMobile(habilitar, tamanho),
          ],
        ),
      ),
    );
  }
}
