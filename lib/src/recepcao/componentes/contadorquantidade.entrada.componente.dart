import 'package:fastfood_inteligente_flutter/src/configuracoes/modelo/configuracoes.produto.modelo.dart';
import 'package:fastfood_inteligente_flutter/src/produtos/modelos/produto.modelo.dart';
import 'package:fastfood_inteligente_flutter/src/recepcao/bloc/entrada.bloc.dart';
import 'package:fastfood_inteligente_flutter/src/recepcao/controle/recepcao.controle.dart';
import 'package:fastfood_inteligente_flutter/src/recepcao/estados/entrada.estados.dart';
import 'package:fastfood_inteligente_flutter/src/recepcao/eventos/entrada.eventos.dart';
import 'package:fastfood_inteligente_flutter/src/produtos/dominio/entidade/produto.entidade.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ContadorQuantidadeComponente extends StatefulWidget {
  final ProdutoEntidade produto;
  const ContadorQuantidadeComponente({
    Key? key,
    required this.produto,
  }) : super(key: key);
  @override
  _ContadorQuantidadeComponenteState createState() =>
      new _ContadorQuantidadeComponenteState();
}

class _ContadorQuantidadeComponenteState
    extends State<ContadorQuantidadeComponente> {
  
  RecepcaoControle controle = RecepcaoControle();

  int index = 0;
  var produtocriado = ProdutoModelo.empty();
  int contador = 0;

  void initState() {
    super.initState();
    produtocriado = ProdutoModelo.converter(widget.produto);
  }

  @override
  Widget build(BuildContext context) {
    final entradabloc = context.watch<EntradaBloc>();
    final entradastate = entradabloc.state;

    if (entradastate is CarregaListaProdutosAdicionadosPedidoEntradaEstados &&
        entradastate.produtos.isNotEmpty) {
    if(controle.valueByKey(produtocriado.id, entradastate.produtos) == true && produtocriado.quantidade == 0){
      var indice = controle.indexOfValue([], produtocriado.id, entradastate.produtos.map((e) => ProdutoModelo.toModel(e)).toList());
      setState(() {
          produtocriado = produtocriado.copyWith(quantidade: entradastate.produtos[indice].quantidade);
          contador = entradastate.produtos[indice].quantidade;
        });
    }
    }

   
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
            onPressed: () async {
              if (contador > 0) {
                setState(() {
                  contador--;
                  produtocriado = produtocriado.copyWith(quantidade: contador);
                });
                context
                    .read<EntradaBloc>()
                    .add(SubtrairQuantidadeEntradaEventos(produtocriado));
              }
            },
            icon: const Icon(Icons.remove)),
        Text(
          produtocriado.quantidade.toString(),
        ),
        IconButton(
            onPressed: () async {
              setState(() {
                contador++;
                produtocriado = produtocriado.copyWith(quantidade: contador);
              });
              context
                  .read<EntradaBloc>()
                  .add(AdicionarQuantidadeEntradaEventos(produtocriado));
            },
            icon: const Icon(Icons.add)),
      ],
    );
  }
}
