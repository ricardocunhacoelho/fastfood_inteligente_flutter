import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fastfood_inteligente_flutter/src/produtos/dominio/casodeuso/adicionar.produto.casodeuso.dart';
import 'package:fastfood_inteligente_flutter/src/produtos/dominio/casodeuso/adicionarquantidade.casodeuso.dart';
import 'package:fastfood_inteligente_flutter/src/produtos/dominio/casodeuso/buscartodosdocumentos.produto.casodeuso.dart';
import 'package:fastfood_inteligente_flutter/src/produtos/dominio/casodeuso/calcularprecopedidoprodutos.casodeuso.dart';
import 'package:fastfood_inteligente_flutter/src/produtos/dominio/casodeuso/deletar.produto.casodeuso.dart';
import 'package:fastfood_inteligente_flutter/src/produtos/dominio/casodeuso/editar.produto.casodeuso.dart';
import 'package:fastfood_inteligente_flutter/src/produtos/dominio/casodeuso/resetar.produtos.receberam.incremento.quantidade.casodeuso.dart';
import 'package:fastfood_inteligente_flutter/src/produtos/dominio/casodeuso/subtrairquantidade.casodeuso.dart';
import 'package:fastfood_inteligente_flutter/src/produtos/dominio/repositorio/iprodutos.repository.dart';
import 'package:fastfood_inteligente_flutter/src/produtos/dominio/casodeuso/buscartodosprodutos.casodeuso.dart';
import 'package:fastfood_inteligente_flutter/src/produtos/infraestrutura/fontededados/iproduto.data.source.dart';
import 'package:fastfood_inteligente_flutter/src/produtos/infraestrutura/externo/produto.firestore.external.data.source.dart';
import 'package:fastfood_inteligente_flutter/src/produtos/infraestrutura/repositorio/produtos.repository.dart';
import 'package:provider/provider.dart';

final produtosModulos = [
  Provider<FirebaseFirestore>.value(
    value: FirebaseFirestore.instance,
  ),
  Provider<IProdutoDataSource>(
      create: (context) => ProdutoFirestore(context.read())),
  Provider<IProdutoRepositorio>(
      create: (context) => ProdutoRepositorio(context.read())),
  //usecases
  Provider<IBuscarTodosProdutos>(
      create: (context) => BuscarTodosProdutos(context.read())),
  Provider<IAdicionarProduto>(
      create: (context) => AdicionarProduto(context.read())),
  Provider<IDeletarProduto>(
      create: (context) => DeletarProduto(context.read())),
  Provider<IEditarProduto>(create: (context) => EditarProduto(context.read())),
  Provider<IAdicionarQuantidade>(
      create: (context) => AdicionarQuantidade(context.read())),
  Provider<ISubtrairQuantidade>(
      create: (context) => SubtrairQuantidade(context.read())),
  Provider<IBuscarTodosDocumentosProdutos>(
      create: (context) => BuscarTodosDocumentosProdutos(context.read())),
  Provider<ICalcularPrecoPedido>(
      create: (context) => CalcularPrecoPedido(context.read())),

  Provider<IResetarProdutosReceberamIncrementoQuantidade>(
      create: (context) =>
          ResetarProdutosReceberamIncrementoQuantidade(context.read())),
];
