import 'package:fastfood_inteligente_flutter/src/configuracoes/modelo/configuracoes.produto.modelo.dart';
import 'package:fastfood_inteligente_flutter/src/recepcao/bloc/entrada.bloc.dart';
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
  int index = 0;
  var produtocriado = ConfiguracoesProdutoModelo.empty();
  List<ProdutoEntidade> produtos = [];
  List<String> produtosNomes = [];
  int contador = 0;
  int contadorHerdado = 0;
  bool jaAdd = false;

  void initState() {
    super.initState();
    produtocriado = ConfiguracoesProdutoModelo.converter(widget.produto);
  }

  @override
  Widget build(BuildContext context) {
    final entradabloc = context.watch<EntradaBloc>();
    final entradastate = entradabloc.state;

    if (entradastate is CarregaListaProdutosAdicionadosPedidoEntradaEstados) {
      produtos = entradastate.produtos;
    }

    for (int i = 0; i < produtos.length; i++) {
      if (produtos[i].titulo == widget.produto.titulo) {
        index = i;
      }
    }
    if (index >= 1 && produtocriado.quantidade == 0) {
      setState(() {
        produtocriado =
            produtocriado.copyWith(quantidade: produtos[index].quantidade);
        contador = produtos[index].quantidade;
      });
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
