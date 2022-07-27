import 'package:fastfood_inteligente_flutter/src/produtos/dominio/casodeuso/buscartodosprodutos.casodeuso.dart';
import 'package:fastfood_inteligente_flutter/src/produtos/dominio/entidade/produto.entidade.dart';
import 'package:fastfood_inteligente_flutter/src/produtos/dominio/repositorio/iprodutos.repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../mocks/mocks.dart';

void main() {
  test('deve retornar uma lista de ProdutosEntity', () {
    final IProdutoRepositorio repositorio = IProdutoRepositorioMock();
    final ProdutoEntidade produtoEntity = ProdutoEntityMock();
    final IBuscarTodosProdutos buscarTodosProdutosUsecase =
        BuscarTodosProdutos(repositorio);
    when(() => repositorio.buscarTodosProdutos())
        .thenAnswer((_) => Stream.value([produtoEntity]));
    final result = buscarTodosProdutosUsecase.call();
    expect(result, emits(isA<List<ProdutoEntidade>>()));
  });
}
