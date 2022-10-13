import 'package:fastfood_inteligente_flutter/src/chapas/dominio/objetosdevalor/ordem.objeto.dart';
import 'package:fastfood_inteligente_flutter/src/configuracoes/bloc/configuracoes.produto.bloc.dart';
import 'package:fastfood_inteligente_flutter/src/entrada/bloc/entrada.bloc.dart';
import 'package:fastfood_inteligente_flutter/src/entrada/componentes/finalizar.botao.componente.dart';
import 'package:fastfood_inteligente_flutter/src/entrada/componentes/mostrarpreco.entrada.componente.dart';
import 'package:fastfood_inteligente_flutter/src/entrada/componentes/recomecar.botao.componente.dart';
import 'package:fastfood_inteligente_flutter/src/entrada/estados/entrada.estados.dart';
import 'package:fastfood_inteligente_flutter/src/entrada/modelo/entrada.ordem.model.dart';
import 'package:fastfood_inteligente_flutter/src/produtos/dominio/casodeuso/checarsefoiadicionadoproduto.casodeuso.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CaixaValorRecomecarFinalizarRecepcaoWeb extends StatefulWidget {
  const CaixaValorRecomecarFinalizarRecepcaoWeb({Key? key}) : super(key: key);

  @override
  State<CaixaValorRecomecarFinalizarRecepcaoWeb> createState() =>
      _CaixaValorRecomecarFinalizarRecepcaoWebState();
}

class _CaixaValorRecomecarFinalizarRecepcaoWebState
    extends State<CaixaValorRecomecarFinalizarRecepcaoWeb> {
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
    bool habilitar = false;
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

    return Container(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: habilitar
            ? EdgeInsets.only(left: 10, right: 10)
            : EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            if (MediaQuery.of(context).size.height > 720) SizedBox(height: 25),
            SizedBox(height: habilitar ? 10 : 25),
            Container(
              child: const Text(
                "TOTAL",
                textAlign: TextAlign.start,
                style: TextStyle(
                    fontSize: 20, color: Color.fromARGB(255, 241, 237, 237)),
              ),
            ),
            SizedBox(height: 15),
            const MostrarPrecoEntrada(),
            if (habilitar) const RecomecarBotao(largura: 100, altura: 25),
          ],
        ),
      ),
    );
  }
}
