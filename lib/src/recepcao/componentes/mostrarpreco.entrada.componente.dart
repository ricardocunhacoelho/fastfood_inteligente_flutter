import 'package:fastfood_inteligente_flutter/src/recepcao/bloc/entrada.bloc.dart';
import 'package:fastfood_inteligente_flutter/src/recepcao/controle/recepcao.controle.dart';
import 'package:fastfood_inteligente_flutter/src/recepcao/estados/entrada.estados.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class MostrarPrecoEntrada extends StatefulWidget {
  const MostrarPrecoEntrada({Key? key}) : super(key: key);

  @override
  State<MostrarPrecoEntrada> createState() => _MostrarPrecoEntradaState();
}

class _MostrarPrecoEntradaState extends State<MostrarPrecoEntrada> {
  RecepcaoControle controle = RecepcaoControle();
  double? precototal = 0.0;
  


  @override
  Widget build(BuildContext context) {
List<double> valores = [];
    final entradabloc = context.watch<EntradaBloc>();
    final entradastates = entradabloc.state;
    if (entradastates is CarregaListaProdutosAdicionadosPedidoEntradaEstados) {
      setState(() {
        precototal = controle.sumValues(entradastates.produtos, valores);
      });
    }
    
    return Text(
      'R\$${precototal!.toStringAsFixed(2)}',
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Color.fromARGB(255, 245, 241, 241),
      ),
    );
  }
}
