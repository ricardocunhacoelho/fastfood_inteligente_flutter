import 'package:fastfood_inteligente_flutter/src/produtos/dominio/entidade/produto.entidade.dart';
import 'package:fastfood_inteligente_flutter/src/produtos/dominio/repositorio/iprodutos.repository.dart';

abstract class ISubtrairQuantidade {
  Future<void> call(ProdutoEntidade produto);
}

class SubtrairQuantidade implements ISubtrairQuantidade {
  final IProdutoRepositorio repositorio;

  SubtrairQuantidade(this.repositorio);
  @override
  Future<void> call(ProdutoEntidade produto) async {
    await repositorio.subtrairQuantidade(produto);
  }
}
