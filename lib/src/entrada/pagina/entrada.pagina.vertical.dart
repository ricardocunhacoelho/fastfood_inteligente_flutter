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
import 'package:fastfood_inteligente_flutter/src/entrada/componentes/recomecar.dialog.componente.dart';
import 'package:fastfood_inteligente_flutter/src/entrada/estados/entrada.estados.dart';
import 'package:fastfood_inteligente_flutter/src/entrada/eventos/entrada.eventos.dart';
import 'package:fastfood_inteligente_flutter/src/entrada/modelo/entrada.ordem.model.dart';
import 'package:fastfood_inteligente_flutter/src/produtos/dominio/casodeuso/checarsefoiadicionadoproduto.casodeuso.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EntradaPaginaVertical extends StatefulWidget {
  const EntradaPaginaVertical({Key? key}) : super(key: key);

  @override
  State<EntradaPaginaVertical> createState() => _EntradaPaginaVerticalState();
}

class _EntradaPaginaVerticalState extends State<EntradaPaginaVertical> {
  Ordem ordemInicial = Ordem(
      produtos: [],
      embalarParaViajem: false,
      estado: EOrdermEstado.aguardando,
      id: 'ordem1',
      datahora: DateTime.now(),
      observacao: '',
      posicao: 1);
  double tamanho = 90;
  int indexValor = 0;
  String pagina = 'todos';
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
    if (habilitar) {
      setState(() {
        tamanho = 108;
      });
    } else {
      setState(() {
        tamanho = 90;
      });
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('titulo'),
      ),
      body: Row(children: [
        NavigationRail(
          selectedIndex: indexValor,
          onDestinationSelected: (int index) {
            setState(() {
              indexValor = index;
            });
            if (indexValor == 0) {
              setState(() {
                pagina = 'todos';
              });
            }
            if (indexValor == 1) {
              setState(() {
                pagina = 'lanche';
              });
            }
            if (indexValor == 2) {
              setState(() {
                pagina = 'bebida';
              });
            }
          },
          labelType: NavigationRailLabelType.selected,
          destinations: <NavigationRailDestination>[
            NavigationRailDestination(
                icon: Icon(Icons.food_bank), label: Text('todos')),
            NavigationRailDestination(
                icon: Icon(Icons.food_bank), label: Text('lanche')),
            NavigationRailDestination(
                icon: Icon(Icons.food_bank), label: Text('bebida')),
          ],
        ),
        Column(
          children: [
            criarPagina(pagina, produtostate, habilitar, ordemInicial),
          ],
        )
      ]),
    );
  }

  Widget criarPagina(String pagina, ConfiguracoesProdutoEstados produtostate,
          bool habilitar, Ordem ordemInicial) =>
      Container(
        child: Column(children: [
          SizedBox(height: 30),
          Text(
            pagina.toUpperCase(),
          ),
          SizedBox(height: 25),
          if (produtostate is CarregandoConfiguracoesProdutoEstados)
            Center(child: CircularProgressIndicator()),
          if (produtostate is CompletoConfiguracoesProdutoEstados)
            Expanded(
              child: Scrollbar(
                showTrackOnHover: true,
                isAlwaysShown: true,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: produtostate.lista.length,
                  itemBuilder: (context, index) {
                    final produto = produtostate.lista[index];
                    if (pagina.toLowerCase() == 'todos') {
                      return ListTile(
                        minLeadingWidth: 15,
                        horizontalTitleGap: 18,
                        contentPadding: EdgeInsets.all(10),
                        trailing: Container(
                          alignment: Alignment.centerRight,
                          width: 150,
                          child: ContadorQuantidadeComponente(produto: produto),
                        ),
                        leading: Image.asset(
                          'assets/${produto.imagem}',
                          height: 45,
                          width: 45,
                          fit: BoxFit.fitWidth,
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              '${produto.descricao}',
                              style: TextStyle(fontSize: 11),
                            ),
                          ],
                        ),
                        title: Text(
                          '${produto.titulo} R\$${produto.preco}',
                          style: TextStyle(fontSize: 13),
                        ),
                      );
                    }
                    if (produto.categoria.name == pagina.toLowerCase()) {
                      return ListTile(
                        minLeadingWidth: 15,
                        horizontalTitleGap: 18,
                        contentPadding: EdgeInsets.all(10),
                        trailing: Container(
                          alignment: Alignment.centerRight,
                          width: 150,
                          child: ContadorQuantidadeComponente(produto: produto),
                        ),
                        leading: Image.asset(
                          'assets/${produto.imagem}',
                          height: 45,
                          width: 45,
                          fit: BoxFit.fitWidth,
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              '${produto.descricao}',
                              style: TextStyle(fontSize: 11),
                            ),
                          ],
                        ),
                        title: Text(
                          '${produto.titulo} R\$${produto.preco}',
                          style: TextStyle(fontSize: 13),
                        ),
                      );
                    } else {
                      return Container();
                    }
                  },
                ),
              ),
            ),
        ]),
      );
}
