import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fastfood_inteligente_flutter/src/produtos/dominio/entidade/produto.entidade.dart';

abstract class IProdutoRepositorio {
  Stream<List<ProdutoEntidade>> buscarTodosProdutos();

  Future<void> adicionarProduto(ProdutoEntidade produto);

  Future<void> deletarProdutoCasodeUso(ProdutoEntidade produto);

  Future<void> editarProduto(ProdutoEntidade produto);

  Future<void> adicionarQuantidade(ProdutoEntidade produto);

  Future<void> subtrairQuantidade(ProdutoEntidade produto);

  Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>>
      buscarTodosDocumentos();

  Future<void> resetarProdutosReceberamIncrementoQuantidade();
}
