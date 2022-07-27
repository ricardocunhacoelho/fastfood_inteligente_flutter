import 'package:fastfood_inteligente_flutter/src/produtos/dominio/entidade/produto.entidade.dart';
import 'package:fastfood_inteligente_flutter/src/produtos/dominio/repositorio/iprodutos.repository.dart';

abstract class IDeletarProduto {
  Future<void> call(ProdutoEntidade produto);
}

class DeletarProduto implements IDeletarProduto {
  final IProdutoRepositorio repositorio;

  DeletarProduto(this.repositorio);
  @override
  Future<void> call(ProdutoEntidade produto) async {
    await repositorio.deletarProdutoCasodeUso(produto);
  }
}
