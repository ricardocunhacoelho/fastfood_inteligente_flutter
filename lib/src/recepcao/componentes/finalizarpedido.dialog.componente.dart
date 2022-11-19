import 'package:fastfood_inteligente_flutter/src/chapas/dominio/entidade/chapa.entidade.dart';
import 'package:fastfood_inteligente_flutter/src/chapas/dominio/objetosdevalor/ordem.objeto.dart';
import 'package:fastfood_inteligente_flutter/src/configuracoes/bloc/configuracoes.chapa.bloc.dart';
import 'package:fastfood_inteligente_flutter/src/configuracoes/bloc/configuracoes.produto.bloc.dart';
import 'package:fastfood_inteligente_flutter/src/configuracoes/estados/configuracoes.chapa.estados.dart';
import 'package:fastfood_inteligente_flutter/src/configuracoes/estados/configuracoes.produto.estados.dart';
import 'package:fastfood_inteligente_flutter/src/recepcao/bloc/entrada.bloc.dart';
import 'package:fastfood_inteligente_flutter/src/recepcao/componentes/mostrarpreco.entrada.componente.dart';
import 'package:fastfood_inteligente_flutter/src/recepcao/estados/entrada.estados.dart';
import 'package:fastfood_inteligente_flutter/src/recepcao/eventos/entrada.eventos.dart';
import 'package:fastfood_inteligente_flutter/src/recepcao/modelo/entrada.ordem.model.dart';
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
  ScrollController _controller = ScrollController();

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
    final entradabloc = context.watch<EntradaBloc>();
    final entradastates = entradabloc.state;
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
    
    return AlertDialog(
      content: SingleChildScrollView(
        child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (entradastates is CarregaListaProdutosAdicionadosPedidoEntradaEstados)
                Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: MediaQuery.of(context).size.width < 640
                      ? MediaQuery.of(context).size.width * 0.4
                      : MediaQuery.of(context).size.width * 0.2,
                  child: Scrollbar(
                    controller: _controller,
              trackVisibility: true,
              thumbVisibility: true,
              thickness: 5, // Optional: Thickness
              radius: const Radius.circular(5), // Optional: Radius
                    child: ListView.builder(
                      controller: _controller,
                        itemCount: entradastates.produtos.length,
                        itemBuilder: (context, index) {
                          final produto = entradastates.produtos[index];
                          return Column(
                            children: [
                                ListTile(
                                  leading: Text('${produto.quantidade}'),
                                  title: Text('${produto.titulo}'),
                                  trailing: Text(
                                      'R\$ ${(produto.preco * produto.quantidade).toStringAsFixed(2)}'),
                                ),
                              const SizedBox(
                                height: 10,
                              )
                            ],
                          );
                        }),
                  ),
                ),
              const SizedBox(
                height: 30,
              ),
              TextFormField(
                initialValue: ordem.observacao,
                onChanged: (value) {
                  ordem = ordem.copyWith(observacao: value);
                 
                },
                decoration: const InputDecoration(
                  labelText: 'Fazer Observação',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 15),
              Row(
                children: [
                  Text('Embalar para viajem? '),
                  Checkbox(
                      value: ordem.embalarParaViajem,
                      onChanged: (value) {
                        setState(() {
                          ordem = ordem.copyWith(embalarParaViajem: value);
                        });
                      }),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Text('Total : '),
                  precoTotal,
                ],
              ),
            ]),
      ),
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                color: Colors.black12,
                width: 90,
                height: 50,
                child: TextButton(
                    style: TextButton.styleFrom(
                      primary: Colors.orangeAccent,
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
                      primary: Colors.orangeAccent,
                      minimumSize: Size.infinite,
                    ),
                    onPressed: () {
                      print(listaComChapas.length);
                      context
                          .read<EntradaBloc>()
                          .add(FinalizarImprimirPedidoEntradaEventos(
                            ordem.observacao,
                            ordem.embalarParaViajem,
                            ordem.produtos,
                            listaComChapas,
                          ));
                      Navigator.pop(context);
                    },
                    child: const Text('Imprimir')),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
