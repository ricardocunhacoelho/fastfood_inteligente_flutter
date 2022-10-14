import 'package:fastfood_inteligente_flutter/src/chapas/dominio/entidade/chapa.entidade.dart';
import 'package:fastfood_inteligente_flutter/src/chapas/dominio/objetosdevalor/ordem.objeto.dart';
import 'package:fastfood_inteligente_flutter/src/produtos/dominio/entidade/produto.entidade.dart';

abstract class EntradaEventos {}

class BuscarTodosProdutosEntradaEventos implements EntradaEventos {}

class AdicionarQuantidadeEntradaEventos implements EntradaEventos {
  final ProdutoEntidade produto;

  AdicionarQuantidadeEntradaEventos(this.produto);
}

class SubtrairQuantidadeEntradaEventos implements EntradaEventos {
  final ProdutoEntidade produto;

  SubtrairQuantidadeEntradaEventos(this.produto);
}

class AtualizarPrecoEntradaEventos implements EntradaEventos {}

class BuscarOrdemBaseEntradaEventos implements EntradaEventos {}

class AtualizarOrdemBaseEntradaEventos implements EntradaEventos {
  final Ordem ordem;

  AtualizarOrdemBaseEntradaEventos(this.ordem);
}

class FinalizarImprimirPedidoEntradaEventos implements EntradaEventos {
  final String observacao;
  final bool embalarParaViajem;
  final List<ProdutoEntidade> produtos;
  final List<ChapaEntidade> listaChapas;

  FinalizarImprimirPedidoEntradaEventos(
    this.observacao,
    this.embalarParaViajem,
    this.produtos,
    this.listaChapas,
  );
}

class ResetarProdutosReceberamIncrementoQuantidadeEntradaEventos
    implements EntradaEventos {}

class ResetarOrdemBaseEntradaEventos implements EntradaEventos {}
