import 'package:fastfood_inteligente_flutter/src/produtos/dominio/entidade/produto.entidade.dart';
import 'package:fastfood_inteligente_flutter/src/produtos/dominio/repositorio/iprodutos.repository.dart';

abstract class IEditarProduto {
  Future<void> call(ProdutoEntidade produto);
}

class EditarProduto implements IEditarProduto {
  final IProdutoRepositorio repositorio;

  EditarProduto(this.repositorio);
  @override
  Future<void> call(ProdutoEntidade produto) async {
    await repositorio.editarProduto(produto);
  }
}
