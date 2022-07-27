import 'package:fastfood_inteligente_flutter/src/produtos/dominio/entidade/produto.entidade.dart';

abstract class ConfiguracoesProdutoEstados {}

class InicialConfiguracoesProdutoEstados
    implements ConfiguracoesProdutoEstados {}

class CarregandoConfiguracoesProdutoEstados
    implements ConfiguracoesProdutoEstados {}

class CompletoConfiguracoesProdutoEstados
    implements ConfiguracoesProdutoEstados {
  final List<ProdutoEntidade> lista;

  CompletoConfiguracoesProdutoEstados(this.lista);
}

class ErroConfiguracoesProdutoEstados implements ConfiguracoesProdutoEstados {
  final String menssagem;

  ErroConfiguracoesProdutoEstados(this.menssagem);
}
