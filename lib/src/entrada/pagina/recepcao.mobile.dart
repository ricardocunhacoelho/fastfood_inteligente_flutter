import 'package:fastfood_inteligente_flutter/src/chapas/dominio/objetosdevalor/ordem.objeto.dart';
import 'package:fastfood_inteligente_flutter/src/configuracoes/bloc/configuracoes.produto.bloc.dart';
import 'package:fastfood_inteligente_flutter/src/entrada/bloc/entrada.bloc.dart';
import 'package:fastfood_inteligente_flutter/src/entrada/componentes/finalizarpedido.dialog.componente.dart';
import 'package:fastfood_inteligente_flutter/src/entrada/componentes/mostrarpreco.entrada.componente.dart';
import 'package:fastfood_inteligente_flutter/src/entrada/componentes/pagina.produtos.dart';
import 'package:fastfood_inteligente_flutter/src/entrada/componentes/recomecar.dialog.componente.dart';
import 'package:fastfood_inteligente_flutter/src/entrada/componentes/valor.finalizar.recomecar.componente.dart';
import 'package:fastfood_inteligente_flutter/src/entrada/estados/entrada.estados.dart';
import 'package:fastfood_inteligente_flutter/src/entrada/modelo/entrada.ordem.model.dart';
import 'package:fastfood_inteligente_flutter/src/produtos/dominio/casodeuso/checarsefoiadicionadoproduto.casodeuso.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RecepcaoMobile extends StatefulWidget {
  const RecepcaoMobile({Key? key}) : super(key: key);

  @override
  State<RecepcaoMobile> createState() => _RecepcaoMobileState();
}

class _RecepcaoMobileState extends State<RecepcaoMobile> {
  Ordem ordemInicial = Ordem(
      produtos: [],
      embalarParaViajem: false,
      estado: EOrdermEstado.aguardando,
      id: 'ordem1',
      datahora: DateTime.now(),
      observacao: '',
      posicao: 1);
  double tamanho = 90;
  int _selectedIndex = 0;
  bool habilitar = false;
  final IChecarSeFoiAdicionadoProduto checarSeFoiAdicionadoProduto =
      ChecarSeFoiAdicionadoProduto();

  @override
  Widget build(BuildContext context) {
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
        body: Column(children: [
          Expanded(
            child: TabBarView(
              children: [
                paginaProdutos('lanche', produtostate, habilitar, ordemInicial),
                paginaProdutos('todos', produtostate, habilitar, ordemInicial),
                paginaProdutos('bebida', produtostate, habilitar, ordemInicial),
                paginaProdutos('combo', produtostate, habilitar, ordemInicial),
                paginaProdutos(
                    'sobremesa', produtostate, habilitar, ordemInicial),
              ],
            ),
          ),
          CaixaValorRecomecarFinalizarRecepcaoMobile()
        ]),
      ),
    );
  }
}
