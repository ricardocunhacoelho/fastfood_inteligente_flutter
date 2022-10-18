import 'package:fastfood_inteligente_flutter/src/produtos/dominio/entidade/produto.entidade.dart';
import 'package:fastfood_inteligente_flutter/src/produtos/modelos/produto.modelo.dart';
import 'package:fastfood_inteligente_flutter/src/recepcao/bloc/entrada.bloc.dart';
import 'package:fastfood_inteligente_flutter/src/recepcao/controle/recepcao.controle.dart';
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
  RecepcaoControle controle = RecepcaoControle();
  
  List<String> tituloProdutosJaAdicionados = [];
  
  @override
  Widget build(BuildContext context) {
    List<ProdutoModelo> produtos = [];
    final entradabloc = context.watch<EntradaBloc>();
    final entradastate = entradabloc.state;
    //QUANDO CLICA EM ADICIONAR
    if (entradastate is AdicionaProdutoEntradaEstados) {
      if(controle.valueByKey(entradastate.produto.id, produtos) == null){
        produtos.add(ProdutoModelo.toModel(entradastate.produto));
      }else if (controle.valueByKey(entradastate.produto.id, produtos) == true){
        controle.changeValue([] ,entradastate.produto.id ,entradastate.produto.quantidade ,produtos);
      }
      context
          .read<EntradaBloc>()
          .add(AtualizarListaProdutosAdicionadosPedidoEntradaEventos(produtos));
      print(entradastate.produto.titulo);
      print(produtos.length);
    }
    //QUANDO CLICA EM SUBTRAIR
    if (entradastate is SubtraiProdutoEntradaEstados) {

      if (entradastate.produto.quantidade == 0) {
        controle.deletValue(entradastate.produto.id, [], produtos);
      } else if (entradastate.produto.quantidade > 0) {
        controle.changeValue([] ,entradastate.produto.id ,entradastate.produto.quantidade ,produtos);
      }
      context
          .read<EntradaBloc>()
          .add(AtualizarListaProdutosAdicionadosPedidoEntradaEventos(produtos));
    print(produtos.length);
    }

    if (MediaQuery.of(context).size.width >= 640 &&
        MediaQuery.of(context).size.width >= 720) {
      return const EntradaWebResponsivo();
    } else {
      return const RecepcaoMobile();
    }
  }
}



