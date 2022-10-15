import 'package:fastfood_inteligente_flutter/src/produtos/dominio/entidade/produto.entidade.dart';
import 'package:fastfood_inteligente_flutter/src/recepcao/bloc/entrada.bloc.dart';
import 'package:fastfood_inteligente_flutter/src/recepcao/estados/entrada.estados.dart';
import 'package:fastfood_inteligente_flutter/src/recepcao/eventos/entrada.eventos.dart';
import 'package:fastfood_inteligente_flutter/src/recepcao/pagina/entrada.web.responsivo.dart';
import 'package:fastfood_inteligente_flutter/src/recepcao/pagina/recepcao.mobile.pagina.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EntradaPagina extends StatefulWidget {
  const EntradaPagina({Key? key}) : super(key: key);

  @override
  State<EntradaPagina> createState() => _EntradaPaginaState();
}

class _EntradaPaginaState extends State<EntradaPagina> {
  List<ProdutoEntidade> produtos = [];
  List<String> tituloProdutosJaAdicionados = [];
  @override
  Widget build(BuildContext context) {
    final entradabloc = context.watch<EntradaBloc>();
    final entradastate = entradabloc.state;
    //QUANDO CLICA EM ADICIONAR
    if (entradastate is AdicionaProdutoEntradaEstados) {
      if (!tituloProdutosJaAdicionados.contains(entradastate.produto.titulo)) {
        produtos.add(entradastate.produto);
        tituloProdutosJaAdicionados.add(entradastate.produto.titulo);
        print(
            'quantidade do produto ${entradastate.produto.titulo} que chega para a lista ${entradastate.produto.quantidade}');
      } else if (tituloProdutosJaAdicionados
          .contains(entradastate.produto.titulo)) {
        produtos[tituloProdutosJaAdicionados
            .indexOf(entradastate.produto.titulo)] = entradastate.produto;
        print(
            'quantidade do produto ${entradastate.produto.titulo} que chega para a lista ${entradastate.produto.quantidade}');
      }
      context
          .read<EntradaBloc>()
          .add(AtualizarListaProdutosAdicionadosPedidoEntradaEventos(produtos));
    }
    //QUANDO CLICA EM SUBTRAIR
    if (entradastate is SubtraiProdutoEntradaEstados) {
      if (entradastate.produto.quantidade == 0) {
        int index = 0;
        for (int i = 0; i < produtos.length; i++) {
          if (produtos[i].titulo == entradastate.produto.titulo) {
            index = i;
          }
        }
        tituloProdutosJaAdicionados.remove(entradastate.produto.titulo);
        produtos.removeAt(index);
      } else {
        int index = 0;
        for (int i = 0; i < produtos.length; i++) {
          if (produtos[i].titulo == entradastate.produto.titulo) {
            index = i;
          }
        }
        produtos[index] = entradastate.produto;
        print(
            'quantidade do produto ${entradastate.produto.titulo} que chega para a lista ${entradastate.produto.quantidade}');
      }
      context
          .read<EntradaBloc>()
          .add(AtualizarListaProdutosAdicionadosPedidoEntradaEventos(produtos));
    }

    if (MediaQuery.of(context).size.width >= 640 &&
        MediaQuery.of(context).size.width >= 720) {
      return const EntradaWebResponsivo();
    } else {
      return const RecepcaoMobile();
    }
  }
}
