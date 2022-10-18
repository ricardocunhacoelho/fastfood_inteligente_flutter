import 'package:fastfood_inteligente_flutter/src/chapas/dominio/objetosdevalor/ordem.objeto.dart';
import 'package:fastfood_inteligente_flutter/src/recepcao/bloc/entrada.bloc.dart';
import 'package:fastfood_inteligente_flutter/src/recepcao/componentes/finalizarpedido.dialog.componente.dart';
import 'package:fastfood_inteligente_flutter/src/recepcao/estados/entrada.estados.dart';
import 'package:fastfood_inteligente_flutter/src/produtos/dominio/casodeuso/checarsefoiadicionadoproduto.casodeuso.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FinalizarBotao extends StatefulWidget {
  final double largura;
  final double altura;

  const FinalizarBotao({Key? key, required this.largura, required this.altura})
      : super(key: key);

  @override
  State<FinalizarBotao> createState() => _FinalizarBotaoState();
}

class _FinalizarBotaoState extends State<FinalizarBotao> {
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
    final entradabloc = context.watch<EntradaBloc>();
    final entradastates = entradabloc.state;
    if (entradastates is CarregaListaProdutosAdicionadosPedidoEntradaEstados) {
      if (entradastates.produtos.isNotEmpty) {
        setState(() {
          habilitar = true;
        });
      }
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
      margin: const EdgeInsets.all(15),
      width: 160,
      height: 50,
      decoration: BoxDecoration(
        color: habilitar ? Colors.orangeAccent : Colors.black12,
        borderRadius: const BorderRadius.all(
          Radius.circular(5),
        ),
      ),
      child: TextButton(
        style: TextButton.styleFrom(minimumSize: Size.infinite),
        onPressed: habilitar
            ? () {
                showDialog(
                    context: context,
                    builder: (_) {
                      return FinalizarPedidoDialogComponente(ordemInicial);
                    });
              }
            : null,
        child: const Text(
          "Finalizar",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
