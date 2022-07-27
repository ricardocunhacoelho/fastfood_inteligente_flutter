import 'package:fastfood_inteligente_flutter/src/produtos/dominio/repositorio/iprodutos.repository.dart';

abstract class IResetarProdutosReceberamIncrementoQuantidade {
  Future<void> call();
}

class ResetarProdutosReceberamIncrementoQuantidade
    implements IResetarProdutosReceberamIncrementoQuantidade {
  final IProdutoRepositorio repositorio;

  ResetarProdutosReceberamIncrementoQuantidade(this.repositorio);
  @override
  Future<void> call() async {
    await repositorio.resetarProdutosReceberamIncrementoQuantidade();
  }
}
