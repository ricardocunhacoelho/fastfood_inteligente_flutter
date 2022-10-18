import 'package:fastfood_inteligente_flutter/src/produtos/dominio/entidade/produto.entidade.dart';

class ProdutoModelo extends ProdutoEntidade {
  ProdutoModelo(
      {required String id,
      required EProdutoCategorias categoria,
      required String titulo,
      required String imagem,
      required String descricao,
      required double preco,
      required int quantidade})
      : super(
            id: id,
            categoria: categoria,
            titulo: titulo,
            imagem: imagem,
            descricao: descricao,
            preco: preco,
            quantidade: quantidade);
  ProdutoModelo copyWith(
      {String? id,
      EProdutoCategorias? categoria,
      String? titulo,
      String? imagem,
      String? descricao,
      double? preco,
      int? quantidade}) {
    return ProdutoModelo(
      id: id ?? this.id,
      categoria: categoria ?? this.categoria,
      titulo: titulo ?? this.titulo,
      imagem: imagem ?? this.imagem,
      descricao: descricao ?? this.descricao,
      preco: preco ?? this.preco,
      quantidade: quantidade ?? this.quantidade,
    );
  }

  factory ProdutoModelo.empty() => ProdutoModelo(
      id: '',
      categoria: EProdutoCategorias.lanche,
      titulo: '',
      imagem: 'product-7.png',
      descricao: '',
      preco: 1.1,
      quantidade: 0);

  factory ProdutoModelo.converter(ProdutoEntidade produto) =>
      ProdutoModelo(
          id: produto.id,
          categoria: produto.categoria,
          titulo: produto.titulo,
          imagem: produto.imagem,
          descricao: produto.descricao,
          preco: produto.preco,
          quantidade: produto.quantidade);

  static ProdutoModelo toModel(ProdutoEntidade produto) {
    return ProdutoModelo(
          id: produto.id,
          categoria: produto.categoria,
          titulo: produto.titulo,
          imagem: produto.imagem,
          descricao: produto.descricao,
          preco: produto.preco,
          quantidade: produto.quantidade);
  }

  static ProdutoEntidade toProdutoEntidade(ProdutoModelo produto) {
    return ProdutoEntidade(
          id: produto.id,
          categoria: produto.categoria,
          titulo: produto.titulo,
          imagem: produto.imagem,
          descricao: produto.descricao,
          preco: produto.preco,
          quantidade: produto.quantidade);
  }
}
