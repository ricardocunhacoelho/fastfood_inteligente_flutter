import 'package:fastfood_inteligente_flutter/src/produtos/dominio/entidade/produto.entidade.dart';
import 'package:fastfood_inteligente_flutter/src/produtos/dominio/repositorio/iprodutos.repository.dart';

abstract class IAdicionarQuantidade {
  Future<void> call(ProdutoEntidade produto);
}

class AdicionarQuantidade implements IAdicionarQuantidade {
  final IProdutoRepositorio repositorio;

  AdicionarQuantidade(this.repositorio);
  @override
  Future<void> call(ProdutoEntidade produto) async {
    await repositorio.adicionarQuantidade(produto);
  }
}
