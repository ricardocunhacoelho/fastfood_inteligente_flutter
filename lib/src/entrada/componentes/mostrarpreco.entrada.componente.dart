import 'package:fastfood_inteligente_flutter/src/configuracoes/bloc/configuracoes.produto.bloc.dart';
import 'package:fastfood_inteligente_flutter/src/configuracoes/estados/configuracoes.produto.estados.dart';
import 'package:fastfood_inteligente_flutter/src/produtos/dominio/entidade/produto.entidade.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MostrarPrecoEntrada extends StatefulWidget {
  const MostrarPrecoEntrada({Key? key}) : super(key: key);

  @override
  State<MostrarPrecoEntrada> createState() => _MostrarPrecoEntradaState();
}

class _MostrarPrecoEntradaState extends State<MostrarPrecoEntrada> {
  List<ProdutoEntidade> lista = [];
  double precototal = 0.0;

  var initialValue = 0.0;

  @override
  Widget build(BuildContext context) {
    final produtobloc = context.watch<ConfiguracoesProdutoBloc>();
    final produtostate = produtobloc.state;
    if (produtostate is CarregandoConfiguracoesProdutoEstados)
      return Center(child: CircularProgressIndicator());
    if (produtostate is CompletoConfiguracoesProdutoEstados)
      lista = produtostate.lista;
    var listafinal = new List<double>.generate(lista.length, (i) => i + 1);
    var i = 0;
    lista.forEach((element) {
      if (i < lista.length)
        listafinal[i] = ((element.preco * element.quantidade));
      i++;
    });
    double? sumAllElements = listafinal.fold(
        initialValue, (accumulated, element) => accumulated! + element);

    final total = sumAllElements!.toStringAsFixed(2);
    return Text(
      'R\$${total}',
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
