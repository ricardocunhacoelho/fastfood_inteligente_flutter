import 'package:fastfood_inteligente_flutter/src/configuracoes/modelo/configuracoes.produto.modelo.dart';
import 'package:fastfood_inteligente_flutter/src/recepcao/bloc/entrada.bloc.dart';
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
  var produtocriado = ConfiguracoesProdutoModelo.empty();
  void initState() {
    super.initState();
    produtocriado = ConfiguracoesProdutoModelo.converter(widget.produto);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
            onPressed: () {
              if (widget.produto.quantidade >= 1) {
                context
                    .read<EntradaBloc>()
                    .add(SubtrairQuantidadeEntradaEventos(widget.produto));
              }
            },
            icon: const Icon(Icons.remove)),
        Text(
          '${widget.produto.quantidade}',
        ),
        IconButton(
            onPressed: () {
              // if (widget.produto == 0) {
              //   produtocriado = produtocriado.copyWith(quantidade: 0);
              // }
              // produtocriado = produtocriado.copyWith(
              //     quantidade: produtocriado.quantidade + 1);
              context
                  .read<EntradaBloc>()
                  .add(AdicionarQuantidadeEntradaEventos(widget.produto));
            },
            icon: const Icon(Icons.add)),
      ],
    );
  }
}
