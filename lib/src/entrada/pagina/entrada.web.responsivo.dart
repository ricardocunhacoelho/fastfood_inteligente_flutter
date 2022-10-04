import 'package:fastfood_inteligente_flutter/src/configuracoes/bloc/configuracoes.produto.bloc.dart';
import 'package:fastfood_inteligente_flutter/src/entrada/bloc/entrada.bloc.dart';
import 'package:fastfood_inteligente_flutter/src/entrada/componentes/finalizarpedido.dialog.componente.dart';
import 'package:fastfood_inteligente_flutter/src/entrada/componentes/pagina.produtos.dart';
import 'package:fastfood_inteligente_flutter/src/entrada/estados/entrada.estados.dart';
import 'package:fastfood_inteligente_flutter/src/entrada/modelo/entrada.ordem.model.dart';
import 'package:fastfood_inteligente_flutter/src/produtos/dominio/casodeuso/checarsefoiadicionadoproduto.casodeuso.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../chapas/dominio/objetosdevalor/ordem.objeto.dart';

class EntradaWebResponsivo extends StatefulWidget {
  const EntradaWebResponsivo({Key? key}) : super(key: key);

  @override
  State<EntradaWebResponsivo> createState() => _EntradaWebResponsivoState();
}

class _EntradaWebResponsivoState extends State<EntradaWebResponsivo> {
  Ordem ordemInicial = Ordem(
      produtos: [],
      embalarParaViajem: false,
      estado: EOrdermEstado.aguardando,
      id: 'ordem1',
      datahora: DateTime.now(),
      observacao: '',
      posicao: 1);
  double tamanho = 90;
  bool habilitar = false;
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
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

    final List<Widget> _screens = [
      paginaProdutos('lanche', produtostate, habilitar, ordemInicial),
      paginaProdutos('bebida', produtostate, habilitar, ordemInicial),
      paginaProdutos('combo', produtostate, habilitar, ordemInicial),
      paginaProdutos('sobremesa', produtostate, habilitar, ordemInicial),
      paginaProdutos('todos', produtostate, habilitar, ordemInicial),
    ];
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Responsive site'),
      // ),
      body: Row(
        children: [
          NavigationRail(
            leading: Column(
              children: [
                SizedBox(height: 40),
                Icon(Icons.accessibility_new_outlined),
                SizedBox(height: 30),
              ],
            ),
            useIndicator: true,
            extended: true,
            minExtendedWidth: 170,
            onDestinationSelected: (int index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            selectedIndex: _selectedIndex,
            destinations: const <NavigationRailDestination>[
              NavigationRailDestination(
                  icon: Icon(Icons.food_bank), label: Text('Lanche')),
              NavigationRailDestination(
                  icon: Icon(Icons.all_inclusive_outlined),
                  label: Text('Bebida')),
              NavigationRailDestination(
                  icon: Icon(Icons.cabin), label: Text('Combo')),
              NavigationRailDestination(
                  icon: Icon(Icons.food_bank), label: Text('Sobremesa')),
              NavigationRailDestination(
                  icon: Icon(Icons.food_bank), label: Text('Todos')),
            ],
          ),
          Expanded(child: _screens[_selectedIndex]),
        ],
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.only(
                top: 30.0, bottom: 5, left: 20, right: 35),
            child: Container(
              margin: EdgeInsets.all(
                15,
              ),
              width: 180,
              height: 55,
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
          ),
        ],
      ),
    );
  }
}
