import 'package:fastfood_inteligente_flutter/src/produtos/dominio/entidade/produto.entidade.dart';

class Ordem {
  final String id;
  final String observacao;
  final int posicao;
  final bool embalarParaViajem;
  final DateTime datahora;
  final List<ProdutoEntidade> produtos;
  final EOrdermEstado estado;
  Ordem({
    required this.id,
    required this.observacao,
    required this.posicao,
    required this.embalarParaViajem,
    required this.datahora,
    required this.produtos,
    required this.estado,
  });
}

enum EOrdermEstado { aguardando, atendendo, feito }
