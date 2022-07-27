// import 'package:fastfood_inteligente_flutter/src/chapas/dominio/casodeuso/atualizarvaloreschapa.casodeuso.dart';
// import 'package:fastfood_inteligente_flutter/src/chapas/dominio/casodeuso/buscartodaschapas.casodeuso.dart';
// import 'package:fastfood_inteligente_flutter/src/chapas/dominio/entidade/chapa.entidade.dart';
// import 'package:fastfood_inteligente_flutter/src/configuracoes/bloc/configuracoes.Chapa.bloc.dart';
// import 'package:fastfood_inteligente_flutter/src/configuracoes/bloc/configuracoes.produto.bloc.dart';
// import 'package:fastfood_inteligente_flutter/src/configuracoes/estados/configuracoes.chapa.estados.dart';
// import 'package:fastfood_inteligente_flutter/src/configuracoes/estados/configuracoes.produto.estados.dart';
// import 'package:fastfood_inteligente_flutter/src/configuracoes/eventos/configuracoes.chapa.eventos.dart';
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
//   late IBuscarTodasChapas buscarTodasChapasUsecase;
//   late IAtualizarValoresChapa atualizarValoresChapaUsecase;
//   late ConfiguracoesChapaBloc bloc;
//   final ChapaEntidade chapa = ChapaEntidadeMock();

//   setUp(() {
//     buscarTodasChapasUsecase = IBuscarTodasChapasMock();
//     atualizarValoresChapaUsecase = IAtualizarValoresChapaMock();

//     bloc = ConfiguracoesChapaBloc(
//       buscarTodasChapasUsecase,
//       atualizarValoresChapaUsecase,
//     );
//   });

//   //BuscarTodasChapas
//   blocTest<ConfiguracoesChapaBloc, ConfiguracoesChapaEstados>(
//     'config bloc getallqueue',
//     build: () {
//       when(() => buscarTodasChapasUsecase.call())
//           .thenAnswer((_) => Stream.value([]));
//       return bloc;
//     },
//     act: (bloc) => bloc.add(BuscarTodasChapasEventoConfiguracoesEventos()),
//     expect: () => [
//       isA<CarregandoConfiguracoesChapaEstados>(),
//       isA<CompletoConfiguracoesChapaEstados>(),
//     ],
//   );
// }
