import 'package:fastfood_inteligente_flutter/src/chapas/dominio/objetosdevalor/ordem.objeto.dart';
import 'package:fastfood_inteligente_flutter/src/configuracoes/bloc/configuracoes.produto.bloc.dart';
import 'package:fastfood_inteligente_flutter/src/recepcao/bloc/entrada.bloc.dart';
import 'package:fastfood_inteligente_flutter/src/recepcao/componentes/finalizarpedido.dialog.componente.dart';
import 'package:fastfood_inteligente_flutter/src/recepcao/componentes/mostrarpreco.entrada.componente.dart';
import 'package:fastfood_inteligente_flutter/src/recepcao/componentes/recomecar.dialog.componente.dart';
import 'package:fastfood_inteligente_flutter/src/recepcao/estados/entrada.estados.dart';
import 'package:fastfood_inteligente_flutter/src/recepcao/modelo/entrada.ordem.model.dart';
import 'package:fastfood_inteligente_flutter/src/produtos/dominio/casodeuso/checarsefoiadicionadoproduto.casodeuso.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Precofinalizar extends StatefulWidget {
  const Precofinalizar({Key? key}) : super(key: key);

  @override
  State<Precofinalizar> createState() => _PrecofinalizarState();
}

class _PrecofinalizarState extends State<Precofinalizar> {
  Ordem ordemInicial = Ordem(
      produtos: [],
      embalarParaViajem: false,
      estado: EOrdermEstado.aguardando,
      id: 'ordem1',
      datahora: DateTime.now(),
      observacao: '',
      posicao: 1,
      nomeCliente: '',
      atendente: '',
      nomeChapeiro: '',
      numeroMesa: 0,
      valorTotalPedido: 0,   
      );
  double tamanho = 90;
  bool habilitar = false;
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

    if (MediaQuery.of(context).size.width < 640) {
      return Container(
        // duration: Duration(seconds: 1),
        width: double.infinity,
        color: Colors.black12,
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
                  Row(
                    children: [
                      Container(
                        child: Text(
                          "TOTAL",
                          textAlign: TextAlign.start,
                        ),
                      ),
                      if (habilitar)
                        Container(
                          margin: EdgeInsets.all(
                            15,
                          ),
                          width: 100,
                          height: 25,
                          decoration: BoxDecoration(
                            color: habilitar
                                ? Colors.orangeAccent
                                : Colors.black12,
                            borderRadius: BorderRadius.all(
                              Radius.circular(
                                5,
                              ),
                            ),
                          ),
                          child: TextButton(
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (_) {
                                      return RecomecarDialogComponente();
                                    });
                              },
                              child: Center(
                                child: Text(
                                  'Recomeçar',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 10),
                                ),
                              )),
                        ),
                    ],
                  ),
                  Container(child: MostrarPrecoEntrada()),
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
                color: habilitar ? Colors.orangeAccent : Colors.black12,
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
      );
    } else {
      return Column(
        children: [
          Container(
            child: Text(
              "TOTAL",
              textAlign: TextAlign.start,
            ),
          ),
          Container(child: MostrarPrecoEntrada()),
          if (habilitar)
            Container(
              margin: EdgeInsets.all(
                15,
              ),
              width: 100,
              height: 25,
              decoration: BoxDecoration(
                color: habilitar ? Colors.orangeAccent : Colors.black12,
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    5,
                  ),
                ),
              ),
              child: TextButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (_) {
                          return RecomecarDialogComponente();
                        });
                  },
                  child: Center(
                    child: Text(
                      'Recomeçar',
                      style: TextStyle(color: Colors.white, fontSize: 10),
                    ),
                  )),
            ),
        ],
      );
    }
  }
}
