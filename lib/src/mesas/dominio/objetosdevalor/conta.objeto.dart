import 'package:fastfood_inteligente_flutter/src/produtos/dominio/entidade/produto.entidade.dart';

class Conta {
  final List<ProdutoEntidade> produtos;
  final double total;
  Conta({
    required this.produtos,
    required this.total,
  });
}