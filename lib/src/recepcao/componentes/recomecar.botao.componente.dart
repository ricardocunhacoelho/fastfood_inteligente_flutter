import 'package:fastfood_inteligente_flutter/src/recepcao/bloc/entrada.bloc.dart';
import 'package:fastfood_inteligente_flutter/src/recepcao/componentes/recomecar.dialog.componente.dart';
import 'package:fastfood_inteligente_flutter/src/recepcao/estados/entrada.estados.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RecomecarBotao extends StatefulWidget {
  final double largura;
  final double altura;

  const RecomecarBotao({Key? key, required this.largura, required this.altura})
      : super(key: key);

  @override
  State<RecomecarBotao> createState() => _RecomecarBotaoState();
}

class _RecomecarBotaoState extends State<RecomecarBotao> {
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

    return Container(
      margin: const EdgeInsets.all(15),
      width: widget.largura,
      height: widget.altura,
      decoration: BoxDecoration(
        color: habilitar ? Colors.orangeAccent : Colors.black12,
        borderRadius: const BorderRadius.all(Radius.circular(5)),
      ),
      child: TextButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (_) {
                  return RecomecarDialogComponente();
                });
          },
          child: const Center(
            child: Text(
              'Recomeçar',
              style: TextStyle(color: Colors.white, fontSize: 10),
            ),
          )),
    );
  }
}
