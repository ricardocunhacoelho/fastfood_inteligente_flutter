import 'package:fastfood_inteligente_flutter/src/produtos/dominio/entidade/produto.entidade.dart';

class HistoricoEntidade {
  final String cliente;
  final DateTime datahora;
  final List<ProdutoEntidade> produtos;
  HistoricoEntidade({
    required this.cliente,
    required this.datahora,
    required this.produtos,
  });
}