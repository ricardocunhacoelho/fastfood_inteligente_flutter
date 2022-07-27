import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:fastfood_inteligente_flutter/src/produtos/infraestrutura/externo/produto.firestore.external.data.source.dart';
import 'package:fastfood_inteligente_flutter/src/produtos/infraestrutura/fontededados/iproduto.data.source.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('description', () async {
    final instance = FakeFirebaseFirestore();
    final map = {
      'id': 'id',
      'categoria': 'lanche',
      'titulo': 'lanchenumero1',
      'imagem': 'imagem',
      'descricao': 'descricao',
      'preco': 23.00,
      'quantidade': 1,
    };
    await instance.collection('produtos').add(map);
    final IProdutoDataSource datasource = ProdutoFirestore(instance);
    final result = datasource.buscarTodosProdutos();
    expect(result, emits(isA<List<Map<dynamic, dynamic>>>()));
  });
}
