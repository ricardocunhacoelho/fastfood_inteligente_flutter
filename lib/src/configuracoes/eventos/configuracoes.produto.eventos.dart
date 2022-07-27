import 'package:fastfood_inteligente_flutter/src/produtos/dominio/entidade/produto.entidade.dart';

abstract class ConfiguracoesProdutoEventos {}

class BuscarTodosProdutosEventoConfiguracoesEventos
    implements ConfiguracoesProdutoEventos {}

class AdicionarProdutoConfiguracoesEventos
    implements ConfiguracoesProdutoEventos {
  final ProdutoEntidade produto;

  AdicionarProdutoConfiguracoesEventos(this.produto);
}

class DeletarProdutoConfiguracoesEventos
    implements ConfiguracoesProdutoEventos {
  final ProdutoEntidade produto;

  DeletarProdutoConfiguracoesEventos(this.produto);
}

class EditarProdutoConfiguracoesEventos implements ConfiguracoesProdutoEventos {
  final ProdutoEntidade produto;

  EditarProdutoConfiguracoesEventos(this.produto);
}
