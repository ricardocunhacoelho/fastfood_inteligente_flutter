import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:fastfood_inteligente_flutter/src/produtos/infraestrutura/externo/produto.firestore.external.data.source.dart';
import 'package:fastfood_inteligente_flutter/src/produtos/infraestrutura/fontededados/iproduto.data.source.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('deve adicionar um produto novo', () async {
    final firestore = FakeFirebaseFirestore();
    await firestore.collection('queue').add({
      'id': 'id',
      'categoria': 'lanche',
      'titulo': 'hamburguezin',
      'imagem': 'imagem',
      'descricao': 'descricao',
      'preco': '1.1',
      'quantidade': '1',
    });

    final IProdutoDataSource datasource = ProdutoFirestore(firestore);
    datasource.adicionarProduto({
      'id': 'id',
      'categoria': 'lanche',
      'titulo': 'hamburguezin',
      'imagem': 'imagem',
      'descricao': 'descricao',
      'preco': '3.15',
      'quantidade': '2',
    });
    datasource.adicionarProduto({
      'id': 'id3',
      'categoria': 'lanche3',
      'titulo': 'hamburguezin3',
      'imagem': 'imagem3',
      'descricao': 'descricao3',
      'preco': '13.5',
      'quantidade': '3',
    });
    final ref = firestore.collection('queue');
    final query = await ref.get();
    print(query);
    expect(query.docs.length, 3);
  });
  test('deve retornar a soma', () async {
    final firestore = FakeFirebaseFirestore();
    await firestore.collection('queue').add({
      'id': 'id',
      'categoria': 'lanche',
      'titulo': 'hamburguezin',
      'imagem': 'imagem',
      'descricao': 'descricao',
      'preco': '1.1',
      'quantidade': '1',
    });

    final IProdutoDataSource datasource = ProdutoFirestore(firestore);
    datasource.adicionarProduto({
      'id': 'id',
      'categoria': 'lanche',
      'titulo': 'hamburguezin',
      'imagem': 'imagem',
      'descricao': 'descricao',
      'preco': '3.15',
      'quantidade': '2',
    });
    datasource.adicionarProduto({
      'id': 'id3',
      'categoria': 'lanche3',
      'titulo': 'hamburguezin3',
      'imagem': 'imagem3',
      'descricao': 'descricao3',
      'preco': '13.5',
      'quantidade': '3',
    });
    final ref = firestore.collection('queue');
    final query = await ref.get();
    print(query);
    expect(query.docs.length, 3);
  });
}
