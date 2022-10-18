
import 'package:fastfood_inteligente_flutter/src/produtos/dominio/entidade/produto.entidade.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
test('deve retornar verdadeiro ou falso para checar s eum valor existe na lista',() {
    ProdutoEntidade produto1 = ProdutoEntidade(id: 'id1', categoria: EProdutoCategorias.bebida, titulo: 'titulo', imagem: 'imagem', descricao: 'descricao', preco: 2.0, quantidade: 1);
  ProdutoEntidade produto2 = ProdutoEntidade(id: 'id2', categoria: EProdutoCategorias.bebida, titulo: 'titulo', imagem: 'imagem', descricao: 'descricao', preco: 2.0, quantidade: 2);
  ProdutoEntidade produto3 = ProdutoEntidade(id: 'id3', categoria: EProdutoCategorias.bebida, titulo: 'titulo', imagem: 'imagem', descricao: 'descricao', preco: 2.0, quantidade: 3);
  ProdutoEntidade produto4 = ProdutoEntidade(id: 'id4', categoria: EProdutoCategorias.bebida, titulo: 'titulo', imagem: 'imagem', descricao: 'descricao', preco: 2.0, quantidade: 4);
  ProdutoEntidade produto5 = ProdutoEntidade(id: 'id5', categoria: EProdutoCategorias.bebida, titulo: 'titulo', imagem: 'imagem', descricao: 'descricao', preco: 2.0, quantidade: 5);
  List<ProdutoEntidade> produtos = [produto1,produto2,produto3,produto4,produto5];

  bool? valueByKey(String key) {
  for (final entry in produtos) {
    if (entry.id.contains(key)) return true;
  }
}
print('possui id id1? ${valueByKey('id1')}');
print('possui id id20? ${valueByKey('id20')}');
print('possui id id2? ${valueByKey('id2')}');
print('possui id id5? ${valueByKey('id5')}');
});

test('deve deletar da lista o produto verdadeiro',() {
    ProdutoEntidade produto1 = ProdutoEntidade(id: 'id1', categoria: EProdutoCategorias.bebida, titulo: 'titulo', imagem: 'imagem', descricao: 'descricao', preco: 2.0, quantidade: 1);
  ProdutoEntidade produto2 = ProdutoEntidade(id: 'id2', categoria: EProdutoCategorias.bebida, titulo: 'titulo', imagem: 'imagem', descricao: 'descricao', preco: 2.0, quantidade: 2);
  ProdutoEntidade produto3 = ProdutoEntidade(id: 'id3', categoria: EProdutoCategorias.bebida, titulo: 'titulo', imagem: 'imagem', descricao: 'descricao', preco: 2.0, quantidade: 3);
  ProdutoEntidade produto4 = ProdutoEntidade(id: 'id4', categoria: EProdutoCategorias.bebida, titulo: 'titulo', imagem: 'imagem', descricao: 'descricao', preco: 2.0, quantidade: 4);
  ProdutoEntidade produto5 = ProdutoEntidade(id: 'id5', categoria: EProdutoCategorias.bebida, titulo: 'titulo', imagem: 'imagem', descricao: 'descricao', preco: 2.0, quantidade: 5);
  List<ProdutoEntidade> produtos = [produto1,produto2,produto3,produto4,produto5];
  var toRemove = [];

  bool? valueByKey(String key) {
  for (final entry in produtos) {
    if (entry.id.contains(key)) return true;
  }
}
print('possui quantos items? ${produtos.length}');

void deletValue (String key){
if(valueByKey(key) == true){
  bool deletar = false;
  for (final entry in produtos) {
    if (entry.id.contains('id1')) toRemove.add(entry);
  }
  produtos.removeWhere( (e) => toRemove.contains(e));
}
}

deletValue('id1');


print('possui quantos items? ${produtos.length}');

// print('possui id id20? ${valueByKey('id20')}');
// print('possui id id2? ${valueByKey('id2')}');
// print('possui id id5? ${valueByKey('id5')}');
});

test('deve trocar um valor do Produto lista que apresentar true',() {
  ProdutoEntidade produto1 = ProdutoEntidade(id: 'id1', categoria: EProdutoCategorias.bebida, titulo: 'titulodoid1', imagem: 'imagem', descricao: 'descricao', preco: 2.0, quantidade: 1);
  ProdutoEntidade produto2 = ProdutoEntidade(id: 'id2', categoria: EProdutoCategorias.bebida, titulo: 'titulo', imagem: 'imagem', descricao: 'descricao', preco: 2.0, quantidade: 2);
  ProdutoEntidade produto3 = ProdutoEntidade(id: 'id3', categoria: EProdutoCategorias.bebida, titulo: 'titulo', imagem: 'imagem', descricao: 'descricao', preco: 2.0, quantidade: 3);
  ProdutoEntidade produto4 = ProdutoEntidade(id: 'id4', categoria: EProdutoCategorias.bebida, titulo: 'titulo', imagem: 'imagem', descricao: 'descricao', preco: 2.0, quantidade: 4);
  ProdutoEntidade produto5 = ProdutoEntidade(id: 'id5', categoria: EProdutoCategorias.bebida, titulo: 'titulo', imagem: 'imagem', descricao: 'descricao', preco: 2.0, quantidade: 5);

  
  List<ProdutoEntidade> produtos = [produto1,produto2,produto3,produto4,produto5];


  List<ProdutoModelo> listProdutsModel = produtos.map((e) => ProdutoModelo.toModel(e)).toList();
    
    var toChange = [];
    
  bool? valueByKey(String key) {
  for (final entry in produtos) {
    if (entry.id.contains(key)) return true;
  }
}
print('valor titulo ${listProdutsModel[0].titulo}');

void changeValue (String key){
if(valueByKey(key) == true){
  for (final entry in listProdutsModel) {
    if (entry.id.contains(key)) toChange.add(entry);    
  }
  var indice = listProdutsModel.indexWhere((e) => toChange.contains(e));
  listProdutsModel[indice] = listProdutsModel[indice].copyWith(titulo: 'titulo modificado');
}
}

changeValue('id1');

print('valor titulo modificado ${listProdutsModel[0].titulo}');
});


test('deve trocar um valor quantidade do Produto para o que veio da lista caso id sejam iguais',() {
  ProdutoEntidade produto1 = ProdutoEntidade(id: 'id1', categoria: EProdutoCategorias.bebida, titulo: 'titulodoid1', imagem: 'imagem', descricao: 'descricao', preco: 2.0, quantidade: 1);
  ProdutoEntidade produto2 = ProdutoEntidade(id: 'id2', categoria: EProdutoCategorias.bebida, titulo: 'titulo', imagem: 'imagem', descricao: 'descricao', preco: 2.0, quantidade: 2);
  ProdutoEntidade produto3 = ProdutoEntidade(id: 'id3', categoria: EProdutoCategorias.bebida, titulo: 'titulo', imagem: 'imagem', descricao: 'descricao', preco: 2.0, quantidade: 3);
  ProdutoEntidade produto4 = ProdutoEntidade(id: 'id4', categoria: EProdutoCategorias.bebida, titulo: 'titulo', imagem: 'imagem', descricao: 'descricao', preco: 2.0, quantidade: 4);
  ProdutoEntidade produto5 = ProdutoEntidade(id: 'id5', categoria: EProdutoCategorias.bebida, titulo: 'titulo', imagem: 'imagem', descricao: 'descricao', preco: 2.0, quantidade: 5);

  
  List<ProdutoEntidade> produtos = [produto1,produto2,produto3,produto4,produto5];

  ProdutoModelo produtoModelo = ProdutoModelo.toModel(produto4);

  List<ProdutoModelo> listProdutsModel = produtos.map((e) => ProdutoModelo.toModel(e)).toList();
    
    var toChange = [];
    
  bool? valueByKey(String key) {
  for (final entry in produtos) {
    if (entry.id.contains(key)) return true;
  }
}
print('valor produtoModelo ${produtoModelo.quantidade}');

void changeValueOutList (String key){
if(valueByKey(key) == true){
  for (final entry in listProdutsModel) {
    if (entry.id.contains(key)) toChange.add(entry);    
  }
  var indice = listProdutsModel.indexWhere((e) => toChange.contains(e));
  produtoModelo = produtoModelo.copyWith(quantidade: listProdutsModel[indice].quantidade);
}
}

changeValueOutList('id1');

print('valor produtoModelo modificado ${produtoModelo.quantidade}');
});
}


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
  factory ProdutoModelo.converter(ProdutoEntidade produto) {
      return ProdutoModelo(
          id: produto.id,
          categoria: produto.categoria,
          titulo: produto.titulo,
          imagem: produto.imagem,
          descricao: produto.descricao,
          preco: produto.preco,
          quantidade: produto.quantidade);}

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
  }
            