import 'package:flutter/cupertino.dart';

class ProdutoEntidade {
  final String id;
  final EProdutoCategorias categoria;
  final String titulo;
  final String imagem;
  final String descricao;
  final double preco;
  final int quantidade;
  ProdutoEntidade({
    required this.id,
    required this.categoria,
    required this.titulo,
    required this.imagem,
    required this.descricao,
    required this.preco,
    required this.quantidade,
  });
}

enum EProdutoCategorias { lanche, bebida, sobremesa, combo }
