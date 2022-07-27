import 'package:fastfood_inteligente_flutter/src/produtos/dominio/entidade/produto.entidade.dart';
import 'package:fastfood_inteligente_flutter/src/produtos/dominio/repositorio/iprodutos.repository.dart';

abstract class IBuscarTodosProdutos {
  Stream<List<ProdutoEntidade>> call();
}

class BuscarTodosProdutos implements IBuscarTodosProdutos {
  final IProdutoRepositorio repositorio;

  BuscarTodosProdutos(this.repositorio);
  @override
  Stream<List<ProdutoEntidade>> call() {
    return repositorio.buscarTodosProdutos();
  }
}
