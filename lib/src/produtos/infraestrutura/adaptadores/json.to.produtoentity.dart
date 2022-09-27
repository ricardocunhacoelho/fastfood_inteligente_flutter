import 'package:fastfood_inteligente_flutter/src/produtos/dominio/entidade/produto.entidade.dart';

class JsonToProdutoEntity {
  static ProdutoEntidade fromMap(dynamic map) {
    return ProdutoEntidade(
      id: map['id'],
      categoria: EProdutoCategorias.values
          .firstWhere((element) => element.name == map['categoria']),
      titulo: map['titulo'],
      imagem: map['imagem'] ?? '',
      descricao: map['descricao'] ?? '',
      preco: map['preco'].toDouble() ?? 0,
      quantidade: map['quantidade'] ?? 0,
    );
  }
}
