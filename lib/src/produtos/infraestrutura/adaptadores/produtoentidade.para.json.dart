import 'package:fastfood_inteligente_flutter/src/produtos/dominio/entidade/produto.entidade.dart';

class ProdutosEntidadeToJson {
  static Map<String, dynamic> toMap(ProdutoEntidade produtoentidade) {
    return ({
      'id': produtoentidade.id,
      'categoria': produtoentidade.categoria.name,
      'titulo': produtoentidade.titulo,
      'imagem': produtoentidade.imagem,
      'descricao': produtoentidade.descricao,
      'preco': produtoentidade.preco,
      'quantidade': produtoentidade.quantidade,
    });
  }
}
