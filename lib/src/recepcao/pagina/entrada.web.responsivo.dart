import 'package:fastfood_inteligente_flutter/src/configuracoes/bloc/configuracoes.produto.bloc.dart';
import 'package:fastfood_inteligente_flutter/src/recepcao/bloc/entrada.bloc.dart';
import 'package:fastfood_inteligente_flutter/src/recepcao/componentes/caixa.recomecar.valor.finalizar.componente.web.dart';
import 'package:fastfood_inteligente_flutter/src/recepcao/componentes/finalizar.botao.componente.dart';
import 'package:fastfood_inteligente_flutter/src/recepcao/componentes/lista.produtos.recepcao.componente.dart';
import 'package:fastfood_inteligente_flutter/src/recepcao/estados/entrada.estados.dart';
import 'package:fastfood_inteligente_flutter/src/recepcao/modelo/entrada.ordem.model.dart';
import 'package:fastfood_inteligente_flutter/src/produtos/dominio/casodeuso/checarsefoiadicionadoproduto.casodeuso.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../chapas/dominio/objetosdevalor/ordem.objeto.dart';

class EntradaWebResponsivo extends StatefulWidget {
  const EntradaWebResponsivo({Key? key}) : super(key: key);

  @override
  State<EntradaWebResponsivo> createState() => _EntradaWebResponsivoState();
}

bool habilitar = false;

int _selectedIndex = 0;

class _EntradaWebResponsivoState extends State<EntradaWebResponsivo> {
  Ordem ordemInicial = Ordem(
      produtos: [],
      embalarParaViajem: false,
      estado: EOrdermEstado.aguardando,
      id: 'ordem1',
      datahora: DateTime.now(),
      observacao: '',
      posicao: 1);

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
      setState(() {
        habilitar = true;
      });
    }

    final List<Widget> _listaProdutos = [
      listaProdutosRecepcaoWeb('lanche', produtostate),
      listaProdutosRecepcaoWeb('bebida', produtostate),
      listaProdutosRecepcaoWeb('combo', produtostate),
      listaProdutosRecepcaoWeb('sobremesa', produtostate),
      listaProdutosRecepcaoWeb('todos', produtostate),
    ];
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Responsive site'),
      // ),
      body: Row(
        children: [
          NavigationRail(
            selectedLabelTextStyle: const TextStyle(
              color: Colors.orangeAccent,
            ),
            indicatorColor: Colors.orangeAccent,
            leading: Column(
              children: [
                SizedBox(
                    height:
                        MediaQuery.of(context).size.height <= 720 ? 15 : 40),
                Image.asset(
                  'assets/logo.png',
                  width: 85,
                  height: 85,
                  fit: BoxFit.contain,
                ),
                SizedBox(
                    height:
                        MediaQuery.of(context).size.height <= 720 ? 15 : 30),
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
                  selectedIcon: ImageIcon(
                      AssetImage("assets/hamburguericone.png"),
                      size: 28,
                      color: Colors.redAccent),
                  icon: ImageIcon(
                    AssetImage("assets/hamburguericone.png"),
                    size: 28,
                  ),
                  label: Text('Lanche')),
              NavigationRailDestination(
                  selectedIcon: ImageIcon(AssetImage("assets/bebidasicone.png"),
                      size: 28, color: Colors.redAccent),
                  icon: ImageIcon(
                    AssetImage("assets/bebidasicone.png"),
                    size: 28,
                  ),
                  label: Text('Bebida')),
              NavigationRailDestination(
                  selectedIcon: ImageIcon(AssetImage("assets/combosicone.png"),
                      size: 28, color: Colors.redAccent),
                  icon: ImageIcon(
                    AssetImage("assets/combosicone.png"),
                    size: 28,
                  ),
                  label: Text('Combo')),
              NavigationRailDestination(
                  selectedIcon: ImageIcon(
                      AssetImage("assets/sobremesaicone.png"),
                      size: 28,
                      color: Colors.redAccent),
                  icon: ImageIcon(
                    AssetImage("assets/sobremesaicone.png"),
                    size: 28,
                  ),
                  label: Text('Sobremesa')),
              NavigationRailDestination(
                  selectedIcon: ImageIcon(AssetImage("assets/todosicone.png"),
                      size: 28, color: Colors.redAccent),
                  icon: ImageIcon(
                    AssetImage("assets/todosicone.png"),
                    size: 28,
                  ),
                  label: Text('All in')),
            ],
            trailing: const Expanded(
              child: Align(
                  alignment: Alignment.bottomCenter,
                  child: CaixaValorRecomecarFinalizarRecepcaoWeb()),
            ),
          ),
          Expanded(child: _listaProdutos[_selectedIndex]),
        ],
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: const [
          SizedBox(height: 30),
          Padding(
              padding:
                  EdgeInsets.only(top: 30.0, bottom: 5, left: 20, right: 35),
              child: FinalizarBotao(largura: 180, altura: 55)),
        ],
      ),
    );
  }
}
