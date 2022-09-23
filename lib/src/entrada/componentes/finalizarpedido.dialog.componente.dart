import 'package:fastfood_inteligente_flutter/src/chapas/dominio/entidade/chapa.entidade.dart';
import 'package:fastfood_inteligente_flutter/src/chapas/dominio/objetosdevalor/ordem.objeto.dart';
import 'package:fastfood_inteligente_flutter/src/configuracoes/bloc/configuracoes.chapa.bloc.dart';
import 'package:fastfood_inteligente_flutter/src/configuracoes/bloc/configuracoes.produto.bloc.dart';
import 'package:fastfood_inteligente_flutter/src/configuracoes/estados/configuracoes.chapa.estados.dart';
import 'package:fastfood_inteligente_flutter/src/configuracoes/estados/configuracoes.produto.estados.dart';
import 'package:fastfood_inteligente_flutter/src/configuracoes/eventos/configuracoes.chapa.eventos.dart';
import 'package:fastfood_inteligente_flutter/src/configuracoes/eventos/configuracoes.produto.eventos.dart';
import 'package:fastfood_inteligente_flutter/src/entrada/bloc/entrada.bloc.dart';
import 'package:fastfood_inteligente_flutter/src/entrada/componentes/mostrarpreco.entrada.componente.dart';
import 'package:fastfood_inteligente_flutter/src/entrada/eventos/entrada.eventos.dart';
import 'package:fastfood_inteligente_flutter/src/entrada/modelo/entrada.ordem.model.dart';
import 'package:fastfood_inteligente_flutter/src/produtos/dominio/entidade/produto.entidade.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FinalizarPedidoDialogComponente extends StatefulWidget {
  final Ordem ordem;
  FinalizarPedidoDialogComponente(this.ordem);
  @override
  _FinalizarPedidoDialogComponenteState createState() =>
      new _FinalizarPedidoDialogComponenteState();
}

class _FinalizarPedidoDialogComponenteState
    extends State<FinalizarPedidoDialogComponente> {
  var ordem = EntradaOrdemModelo.empty();
  @override
  void initState() {
    super.initState();
    ordem = EntradaOrdemModelo.converter(widget.ordem);
  }

  bool? viagem = false;
  final precoTotal = MostrarPrecoEntrada();
  @override
  Widget build(BuildContext context) {
    final produtobloc = context.watch<ConfiguracoesProdutoBloc>();
    final produtostate = produtobloc.state;
    final chapabloc = context.watch<ConfiguracoesChapaBloc>();
    final chapastate = chapabloc.state;
    List<ProdutoEntidade> listaComProdutos = [];
    List<ChapaEntidade> listaComChapas = [];
    if (chapastate is CompletoConfiguracoesChapaEstados) {
      listaComChapas = chapastate.lista;
    }
    if (chapastate is CarregandoConfiguracoesChapaEstados) {
      listaComChapas = [];
    }
    if (produtostate is CompletoConfiguracoesProdutoEstados) {
      produtostate.lista.forEach((element) {
        if (element.quantidade >= 1) {
          listaComProdutos.add(element);
        }
      });
    }
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 20),
          if (produtostate is CompletoConfiguracoesProdutoEstados)
            Container(
              width: MediaQuery.of(context).size.width * 0.75,
              height: MediaQuery.of(context).size.width * 0.6,
              child: ListView.builder(
                  itemCount: produtostate.lista.length,
                  itemBuilder: (context, index) {
                    final produto = produtostate.lista[index];
                    return Column(
                      children: [
                        if (produto.quantidade >= 1)
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('${produto.quantidade} - ${produto.titulo}'),
                              const Text('-------------'),
                              Text(
                                  '${(produto.preco * produto.quantidade).toStringAsFixed(2)}'),
                            ],
                          ),
                        SizedBox(
                          height: 20,
                        )
                      ],
                    );
                  }),
            ),
          // const Text('------------------------------'),
          SizedBox(height: 25),
          Center(
            child: Column(
              children: [
                Column(
                  children: [
                    TextFormField(
                      initialValue: ordem.observacao,
                      onChanged: (value) {
                        ordem = ordem.copyWith(observacao: value);
                        context
                            .read<EntradaBloc>()
                            .add(AtualizarOrdemBaseEntradaEventos(ordem));
                      },
                      decoration: InputDecoration(
                        labelText: 'Fazer Observação',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 25),
                Row(
                  children: [
                    Text('Embalar para viajem? '),
                    Checkbox(
                        value: ordem.embalarParaViajem,
                        onChanged: (value) {
                          setState(() {
                            ordem = ordem.copyWith(embalarParaViajem: value);
                          });
                          context
                              .read<EntradaBloc>()
                              .add(AtualizarOrdemBaseEntradaEventos(ordem));
                        }),
                  ],
                ),
                SizedBox(height: 25),
                Row(
                  children: [
                    Text('Total : '),
                    precoTotal,
                  ],
                ),
              ],
            ),
          )
        ],
      ),
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                color: Colors.black12,
                width: 90,
                height: 50,
                child: TextButton(
                    style: TextButton.styleFrom(
                      minimumSize: Size.infinite,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('Voltar')),
              ),
              Container(
                color: Colors.black12,
                width: 90,
                height: 50,
                child: TextButton(
                    style: TextButton.styleFrom(
                      minimumSize: Size.infinite,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('Pagar')),
              ),
              Container(
                color: Colors.black12,
                width: 90,
                height: 50,
                child: TextButton(
                    style: TextButton.styleFrom(
                      minimumSize: Size.infinite,
                    ),
                    onPressed: () {
                      print(listaComChapas.length);
                      context
                          .read<EntradaBloc>()
                          .add(FinalizarImprimirPedidoEntradaEventos(
                            ordem.observacao,
                            ordem.embalarParaViajem,
                            listaComProdutos,
                            listaComChapas,
                          ));
                      context.read<EntradaBloc>().add(
                          ResetarProdutosReceberamIncrementoQuantidadeEntradaEventos());
                      context
                          .read<EntradaBloc>()
                          .add(ResetarOrdemBaseEntradaEventos());

                      // final String observacao;
                      // final bool embalarParaViajem;
                      // final List<ProdutoEntidade> produtos;
                      // final List<ChapaEntidade> listaChapas;
                      Navigator.pop(context);
                    },
                    child: Text('Imprimir')),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
