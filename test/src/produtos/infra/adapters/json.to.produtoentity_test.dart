import 'package:fastfood_inteligente_flutter/src/produtos/dominio/entidade/produto.entidade.dart';
import 'package:fastfood_inteligente_flutter/src/produtos/infraestrutura/adaptadores/json.to.produtoentity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('deve entrar map e sair ProdutoEntity', () {
    final map = {
      'id': 'id',
      'categoria': 'lanche',
      'titulo': 'titulo',
      'imagem': 'imagem',
      'descricao': 'descricao',
      'preco': 23.00,
      'quantidade': 1,
    };
    final result = JsonToProdutoEntity.fromMap(map);
    expect(result, isA<ProdutoEntidade>());
  });
}
