import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fastfood_inteligente_flutter/src/produtos/dominio/entidade/produto.entidade.dart';
import 'package:fastfood_inteligente_flutter/src/produtos/dominio/repositorio/iprodutos.repository.dart';
import 'package:fastfood_inteligente_flutter/src/produtos/infraestrutura/adaptadores/json.to.produtoentity.dart';
import 'package:fastfood_inteligente_flutter/src/produtos/infraestrutura/adaptadores/produtoentidade.para.json.dart';
import 'package:fastfood_inteligente_flutter/src/produtos/infraestrutura/fontededados/iproduto.data.source.dart';

class ProdutoRepositorio implements IProdutoRepositorio {
  final IProdutoDataSource fontededados;

  ProdutoRepositorio(this.fontededados);
  @override
  Stream<List<ProdutoEntidade>> buscarTodosProdutos() {
    final streammap = fontededados.buscarTodosProdutos();
    return streammap.map(_convert);
  }

  List<ProdutoEntidade> _convert(List<Map<dynamic, dynamic>> list) {
    return list.map(JsonToProdutoEntity.fromMap).toList();
  }

  @override
  Future<void> adicionarProduto(ProdutoEntidade produto) async {
    final map = ProdutosEntidadeToJson.toMap(produto);
    await fontededados.adicionarProduto(map);
  }

  @override
  Future<void> deletarProdutoCasodeUso(ProdutoEntidade produto) async {
    final map = ProdutosEntidadeToJson.toMap(produto);
    await fontededados.deletarProdutoCasodeUso(map);
  }

  @override
  Future<void> editarProduto(ProdutoEntidade produto) async {
    final map = ProdutosEntidadeToJson.toMap(produto);
    await fontededados.editarProduto(map);
  }

  @override
  Future<void> adicionarQuantidade(ProdutoEntidade produto) async {
    final map = ProdutosEntidadeToJson.toMap(produto);
    await fontededados.adicionarQuantidade(map);
  }

  @override
  Future<void> subtrairQuantidade(ProdutoEntidade produto) async {
    final map = ProdutosEntidadeToJson.toMap(produto);
    await fontededados.subtrairQuantidade(map);
  }

  @override
  Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>>
      buscarTodosDocumentos() async {
    final documentosList = await fontededados.buscarTodosDocumentos();
    return documentosList;
  }

  @override
  Future<void> resetarProdutosReceberamIncrementoQuantidade() async {
    await fontededados.resetarProdutosReceberamIncrementoQuantidade();
  }
}
