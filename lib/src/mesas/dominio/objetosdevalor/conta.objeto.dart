import 'package:fastfood_inteligente_flutter/src/produtos/dominio/entidade/produto.entidade.dart';

class Conta {
  final List<ProdutoEntidade> produtosPagos;
  final double dinheiroAvulso;
  Conta({
    required this.produtosPagos,
    required this.dinheiroAvulso,
  });
}