import 'package:cloud_firestore/cloud_firestore.dart';

abstract class IProdutoDataSource {
  Stream<List<Map>> buscarTodosProdutos();

  Future<void> adicionarProduto(Map<String, dynamic> map);

  Future<void> deletarProdutoCasodeUso(Map<String, dynamic> map);

  Future<void> editarProduto(Map<String, dynamic> map);

  Future<void> adicionarQuantidade(Map<String, dynamic> map);
  Future subtrairQuantidade(Map<String, dynamic> map);

  Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>>
      buscarTodosDocumentos();

  Future<void> resetarProdutosReceberamIncrementoQuantidade();
}
