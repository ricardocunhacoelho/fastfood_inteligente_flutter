import 'package:fastfood_inteligente_flutter/src/configuracoes/bloc/configuracoes.produto.bloc.dart';
import 'package:fastfood_inteligente_flutter/src/configuracoes/estados/configuracoes.produto.estados.dart';
import 'package:fastfood_inteligente_flutter/src/configuracoes/eventos/configuracoes.produto.eventos.dart';
import 'package:fastfood_inteligente_flutter/src/login/bloc/login.bloc.dart';
import 'package:fastfood_inteligente_flutter/src/login/estados/login.estados.dart';
import 'package:fastfood_inteligente_flutter/src/login/eventos/login.eventos.dart';
import 'package:fastfood_inteligente_flutter/src/produtos/dominio/casodeuso/adicionar.produto.casodeuso.dart';
import 'package:fastfood_inteligente_flutter/src/produtos/dominio/casodeuso/buscartodosprodutos.casodeuso.dart';
import 'package:fastfood_inteligente_flutter/src/produtos/dominio/casodeuso/deletar.produto.casodeuso.dart';
import 'package:fastfood_inteligente_flutter/src/produtos/dominio/casodeuso/editar.produto.casodeuso.dart';
import 'package:fastfood_inteligente_flutter/src/produtos/dominio/entidade/produto.entidade.dart';
import 'package:fastfood_inteligente_flutter/src/usuarios/dominio/casodeuso/autentica.usuario.dart';
import 'package:fastfood_inteligente_flutter/src/usuarios/dominio/casodeuso/buscar.todos.usuarios.dart';
import 'package:fastfood_inteligente_flutter/src/usuarios/dominio/casodeuso/registra.usuario.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../mocks/mocks.dart';

void main() {
  late IAutenticaUsuario autenticaUsuarioCasoDeUso;
  late IRegistrarUsuario registrarUsuarioCasoDeUso;
  late IBuscarUsuario buscarUsuarioCasoDeUso;
  late LoginBloc bloc;

  setUp(() {
    autenticaUsuarioCasoDeUso = IAutenticaUsuarioMock();
    registrarUsuarioCasoDeUso = IRegistrarUsuarioMock();
    buscarUsuarioCasoDeUso = IBuscarUsuarioMock();
    bloc = LoginBloc(autenticaUsuarioCasoDeUso, registrarUsuarioCasoDeUso, buscarUsuarioCasoDeUso);
  });

  //BuscarUsuario
  blocTest<LoginBloc, LoginEstados>(
    'login bloc buscausuario',
    build: () {
      when(() => buscarUsuarioCasoDeUso.call('uid'))
          .thenAnswer((_) async => await (UsuarioEntidadeMock()));
      return bloc;
    },
    act: (bloc) => bloc.add(BuscarUsuarioLoginEventos('uid')),
    expect: () => [
      isA<CarregandoUsuariosLoginEstado>(),
      isA<CompletoBuscarUsuarioLoginEstado>(),
    ],
  );
}
