import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:fastfood_inteligente_flutter/src/login/estados/login.estados.dart';
import 'package:fastfood_inteligente_flutter/src/login/eventos/login.eventos.dart';
import 'package:fastfood_inteligente_flutter/src/usuarios/dominio/casodeuso/autentica.usuario.dart';
import 'package:fastfood_inteligente_flutter/src/usuarios/dominio/casodeuso/registra.usuario.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBloc
    extends Bloc<LoginEventos, LoginEstados> {
  
  final IAutenticaUsuario autenticaUsuarioCasoDeUso;
  final IRegistrarUsuario registrarUsuarioCasoDeUso;
  
  LoginBloc(
      this.autenticaUsuarioCasoDeUso,
      this.registrarUsuarioCasoDeUso,
      )
      : super(IniciarLoginEstado()) {
    on<AutenticarUsuarioLoginEventos>(
        _autenticarUsuarioLoginEventos,
        transformer: restartable());
    on<RegistrarUsuarioLoginEventos>(
        _registrarUsuarioLoginEventos,
        transformer: restartable());
  }




  // Future<void> _buscarTodosProdutosEventoConfiguracoesEventos(
  //     BuscarTodosProdutosEventoConfiguracoesEventos event,
  //     Emitter<ConfiguracoesProdutoEstados> emit) async {
  //   emit(CarregandoConfiguracoesProdutoEstados());
  //   await emit.forEach<List<ProdutoEntidade>>(
  //     buscarTodosProdutosUsecase.call(),
  //     onData: (filas) => CompletoConfiguracoesProdutoEstados(filas),
  //     onError: (error, st) => ErroConfiguracoesProdutoEstados(error.toString()),
  //   );
  // }

  Future<void> _autenticarUsuarioLoginEventos(
      AutenticarUsuarioLoginEventos event,
      Emitter<LoginEstados> emit) async {
    emit(AutenticarUsuarioCarregandoEstado());
    await autenticaUsuarioCasoDeUso.call(event.email, event.senha);
    await Future.delayed(const Duration(seconds: 2));
    emit(AutenticarUsuarioCompletoEstado());
  }

  Future<void> _registrarUsuarioLoginEventos(
      RegistrarUsuarioLoginEventos event,
      Emitter<LoginEstados> emit) async {
    await registrarUsuarioCasoDeUso.call(event.usuario, event.senha);
  }
}
