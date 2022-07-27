import 'package:fastfood_inteligente_flutter/src/chapas/dominio/objetosdevalor/ordem.objeto.dart';
import 'package:fastfood_inteligente_flutter/src/produtos/dominio/entidade/produto.entidade.dart';

abstract class EntradaEstados {}

class InicialEntradaEstados implements EntradaEstados {}

class CarregandoEntradaEstados implements EntradaEstados {}

class CarregandoOrdemBaseEstados implements EntradaEstados {}

class CompletoEntradaEstados implements EntradaEstados {
  final List<ProdutoEntidade> lista;

  CompletoEntradaEstados(this.lista);
}

class CompletoOrdemBaseEstados implements EntradaEstados {
  final List<Ordem> lista;

  CompletoOrdemBaseEstados(this.lista);
}

class ErroEntradaEstados implements EntradaEstados {
  final String menssagem;

  ErroEntradaEstados(this.menssagem);
}

class ErroOrdemBaseEntradaEstados implements EntradaEstados {
  final String menssagem;

  ErroOrdemBaseEntradaEstados(this.menssagem);
}

class AtualizarPrecoEntradaEstados implements EntradaEstados {
  final double precoAtt;

  AtualizarPrecoEntradaEstados(this.precoAtt);
}
