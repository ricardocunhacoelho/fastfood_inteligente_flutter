import 'package:fastfood_inteligente_flutter/src/chapas/dominio/objetosdevalor/ordem.objeto.dart';
import 'package:fastfood_inteligente_flutter/src/configuracoes/bloc/configuracoes.produto.bloc.dart';
import 'package:fastfood_inteligente_flutter/src/entrada/bloc/entrada.bloc.dart';
import 'package:fastfood_inteligente_flutter/src/entrada/componentes/finalizar.botao.componente.dart';
import 'package:fastfood_inteligente_flutter/src/entrada/componentes/finalizarpedido.dialog.componente.dart';
import 'package:fastfood_inteligente_flutter/src/entrada/componentes/mostrarpreco.entrada.componente.dart';
import 'package:fastfood_inteligente_flutter/src/entrada/componentes/recomecar.botao.componente.dart';
import 'package:fastfood_inteligente_flutter/src/entrada/componentes/recomecar.dialog.componente.dart';
import 'package:fastfood_inteligente_flutter/src/entrada/estados/entrada.estados.dart';
import 'package:fastfood_inteligente_flutter/src/entrada/modelo/entrada.ordem.model.dart';
import 'package:fastfood_inteligente_flutter/src/produtos/dominio/casodeuso/checarsefoiadicionadoproduto.casodeuso.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

class CaixaValorRecomecarFinalizarRecepcaoMobile extends StatefulWidget {
  const CaixaValorRecomecarFinalizarRecepcaoMobile({Key? key})
      : super(key: key);

  @override
  State<CaixaValorRecomecarFinalizarRecepcaoMobile> createState() =>
      _CaixaValorRecomecarFinalizarRecepcaoMobileState();
}

bool habilitar = false;

class _CaixaValorRecomecarFinalizarRecepcaoMobileState
    extends State<CaixaValorRecomecarFinalizarRecepcaoMobile> {
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

  double tamanho = 90;

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

    if (habilitar) {
      setState(() {
        tamanho = 108;
      });
    } else {
      setState(() {
        tamanho = 90;
      });
    }
    return Container(
      width: double.infinity,
      color: Colors.black12,
      height: tamanho,
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
                      child: const Text(
                        "TOTAL",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            color: Color.fromARGB(255, 230, 225, 225)),
                      ),
                    ),
                    if (habilitar)
                      const RecomecarBotao(largura: 100, altura: 25),
                  ],
                ),
                const MostrarPrecoEntrada(),
              ],
            ),
          ),
          const FinalizarBotao(largura: 160, altura: 50)
        ],
      ),
    );
  }
}
