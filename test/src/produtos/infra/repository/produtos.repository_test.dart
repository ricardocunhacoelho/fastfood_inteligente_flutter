import 'package:fastfood_inteligente_flutter/src/produtos/dominio/entidade/produto.entidade.dart';
import 'package:fastfood_inteligente_flutter/src/produtos/dominio/repositorio/iprodutos.repository.dart';
import 'package:fastfood_inteligente_flutter/src/produtos/infraestrutura/fontededados/iproduto.data.source.dart';
import 'package:fastfood_inteligente_flutter/src/produtos/infraestrutura/repositorio/produtos.repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../mocks/mocks.dart';

void main() {
  test('testar o buscarTodosProdutos', () {
    final map = {
      'id': 'id',
      'categoria': 'lanche',
      'titulo': 'titulo',
      'imagem': 'imagem',
      'descricao': 'descricao',
      'preco': 23.00,
      'quantidade': 1,
    };
    final IProdutoDataSource datasource = IProdutoDataSourceMock();
    final IProdutoRepositorio repositorio = ProdutoRepositorio(datasource);
    when(() => datasource.buscarTodosProdutos())
        .thenAnswer((_) => Stream.value([map]));
    final result = repositorio.buscarTodosProdutos();
    expect(result, emits(isA<List<ProdutoEntidade>>()));
  });
}
