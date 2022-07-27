// import 'package:fastfood_inteligente_flutter/src/configuracoes/bloc/configuracoes.produto.bloc.dart';
// import 'package:fastfood_inteligente_flutter/src/configuracoes/estados/configuracoes.produto.estados.dart';
// import 'package:fastfood_inteligente_flutter/src/configuracoes/eventos/configuracoes.produto.eventos.dart';
// import 'package:fastfood_inteligente_flutter/src/produtos/dominio/casodeuso/adicionar.produto.casodeuso.dart';
// import 'package:fastfood_inteligente_flutter/src/produtos/dominio/casodeuso/buscartodosprodutos.casodeuso.dart';
// import 'package:fastfood_inteligente_flutter/src/produtos/dominio/casodeuso/deletar.produto.casodeuso.dart';
// import 'package:fastfood_inteligente_flutter/src/produtos/dominio/casodeuso/editar.produto.casodeuso.dart';
// import 'package:fastfood_inteligente_flutter/src/produtos/dominio/entidade/produto.entidade.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:bloc_test/bloc_test.dart';
// import 'package:mocktail/mocktail.dart';

// import '../../../mocks/mocks.dart';

// void main() {
//   late IAdicionarProduto adicionarProdutoUsecase;
//   late IBuscarTodosProdutos buscarTodosProdutosUsecase;
//   late IEditarProduto editarProdutoUsecase;
//   late IDeletarProduto deletarProdutoUsecase;
//   late ConfiguracoesProdutoBloc bloc;
//   final ProdutoEntidade produto = ProdutoEntidadeMock();

//   setUp(() {
//     buscarTodosProdutosUsecase = IBuscarTodosProdutosMock();
//     adicionarProdutoUsecase = IAdicionarProdutoMock();
//     deletarProdutoUsecase = IDeletarProdutoMock();
//     editarProdutoUsecase = IEditarProdutoMock();
//     bloc = ConfiguracoesProdutoBloc(buscarTodosProdutosUsecase,
//         adicionarProdutoUsecase, deletarProdutoUsecase, editarProdutoUsecase);
//   });

//   //GetAllQueue
//   blocTest<ConfiguracoesProdutoBloc, ConfiguracoesProdutoEstados>(
//     'config bloc getallqueue',
//     build: () {
//       when(() => buscarTodosProdutosUsecase.call())
//           .thenAnswer((_) => Stream.value([]));
//       return bloc;
//     },
//     act: (bloc) => bloc.add(BuscarTodosProdutosEventoConfiguracoesEventos()),
//     expect: () => [
//       isA<CarregandoConfiguracoesProdutoEstados>(),
//       isA<CompletoConfiguracoesProdutoEstados>(),
//     ],
//   );
//   //AdicionarProduto
//   blocTest<ConfiguracoesProdutoBloc, ConfiguracoesProdutoEstados>(
//     'config bloc adicionarproduto',
//     build: () {
//       when(() => adicionarProdutoUsecase.call(produto))
//           .thenAnswer((_) => Future.value());
//       return bloc;
//     },
//     act: (bloc) => bloc.add(AdicionarProdutoConfiguracoesEventos(produto)),
//     expect: () => [],
//   );
// }
