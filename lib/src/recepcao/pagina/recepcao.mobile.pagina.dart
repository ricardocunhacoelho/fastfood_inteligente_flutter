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
   bool habilitar = false;
  double tamanho = 90;

  @override
  Widget build(BuildContext context) {
   
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
      if (entradastates.produtos.isEmpty) {
        setState(() {
          habilitar = false;
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
                Tab(text: 'Bebidas'),
                Tab(text: 'Combos'),
                Tab(text: 'Sobremesas'),
                Tab(text: 'Sacola'),
              ]),
        ),
        body: Column(
          children: [
            //LISTA PRODUTOS
            Expanded(
              child: TabBarView(
                children: [
                  listaProdutosRecepcaoMobile('lanche', produtostate, entradastates),
                  listaProdutosRecepcaoMobile('bebida', produtostate, entradastates),
                  listaProdutosRecepcaoMobile('combo', produtostate, entradastates),
                  listaProdutosRecepcaoMobile('sobremesa', produtostate, entradastates),
                  listaProdutosRecepcaoMobile('sacola', produtostate, entradastates),
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
