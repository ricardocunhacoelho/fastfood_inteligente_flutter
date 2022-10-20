import 'package:fastfood_inteligente_flutter/src/recepcao/bloc/entrada.bloc.dart';
import 'package:fastfood_inteligente_flutter/src/recepcao/componentes/mostrarpreco.entrada.componente.dart';
import 'package:fastfood_inteligente_flutter/src/recepcao/componentes/recomecar.botao.componente.dart';
import 'package:fastfood_inteligente_flutter/src/recepcao/estados/entrada.estados.dart';
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
  bool habilitar = false;

  double tamanho = 90;

  @override
  Widget build(BuildContext context) {

    final entradabloc = context.watch<EntradaBloc>();
    final entradastates = entradabloc.state;
    if (entradastates is CarregaListaProdutosAdicionadosPedidoEntradaEstados) {
      if (entradastates.produtos.isNotEmpty) {
        setState(() {
          habilitar = true;
        });
      }else{setState(() {
          habilitar = false;
        });}
    }

    return Container(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: habilitar
            ? const EdgeInsets.only(left: 10, right: 10)
            : const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            if (MediaQuery.of(context).size.height > 720)
              const SizedBox(height: 25),
            SizedBox(height: habilitar ? 10 : 25),
            Container(
              child: const Text(
                "TOTAL",
                textAlign: TextAlign.start,
                style: TextStyle(
                    fontSize: 20, color: Color.fromARGB(255, 241, 237, 237)),
              ),
            ),
            const SizedBox(height: 15),
            const MostrarPrecoEntrada(),
            if (habilitar) RecomecarBotao(largura: 100, altura: 25),
          ],
        ),
      ),
    );
  }
}
