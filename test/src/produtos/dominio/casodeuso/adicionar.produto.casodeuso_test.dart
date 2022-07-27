import 'package:fastfood_inteligente_flutter/src/produtos/dominio/casodeuso/adicionar.produto.casodeuso.dart';
import 'package:fastfood_inteligente_flutter/src/produtos/dominio/entidade/produto.entidade.dart';
import 'package:fastfood_inteligente_flutter/src/produtos/dominio/repositorio/iprodutos.repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../mocks/mocks.dart';

void main() {
  test('deve completar', () {
    final ProdutoEntidade produto = ProdutoEntidadeMock();
    final IProdutoRepositorio repositorio = IProdutoRepositorioMock();
    final IAdicionarProduto adicionarProdutoUsecase =
        AdicionarProduto(repositorio);
    when(() => repositorio.adicionarProduto(produto))
        .thenAnswer((_) => Future.value());

    expect(adicionarProdutoUsecase.call(produto), completes);
  });
}
