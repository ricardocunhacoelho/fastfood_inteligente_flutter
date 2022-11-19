import 'package:fastfood_inteligente_flutter/src/produtos/dominio/entidade/produto.entidade.dart';

class Cliente {
  final String nome;
  final List<ProdutoEntidade> consumido;
  Cliente({
    required this.nome,
    required this.consumido,
  });
}