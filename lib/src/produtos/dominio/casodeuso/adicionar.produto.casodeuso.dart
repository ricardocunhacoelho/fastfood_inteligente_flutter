import 'package:fastfood_inteligente_flutter/src/produtos/dominio/entidade/produto.entidade.dart';
import 'package:fastfood_inteligente_flutter/src/produtos/dominio/repositorio/iprodutos.repository.dart';

abstract class IAdicionarProduto {
  Future<void> call(ProdutoEntidade produto);
}

class AdicionarProduto implements IAdicionarProduto {
  final IProdutoRepositorio repositorio;

  AdicionarProduto(this.repositorio);
  @override
  Future<void> call(ProdutoEntidade produto) async {
    await repositorio.adicionarProduto(produto);
  }
}
