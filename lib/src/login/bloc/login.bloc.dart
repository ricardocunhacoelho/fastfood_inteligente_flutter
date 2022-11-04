import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:fastfood_inteligente_flutter/src/login/estados/login.estados.dart';
import 'package:fastfood_inteligente_flutter/src/login/eventos/login.eventos.dart';
import 'package:fastfood_inteligente_flutter/src/usuarios/dominio/casodeuso/autentica.usuario.dart';
import 'package:fastfood_inteligente_flutter/src/usuarios/dominio/casodeuso/buscar.todos.usuarios.dart';
import 'package:fastfood_inteligente_flutter/src/usuarios/dominio/casodeuso/registra.usuario.dart';
import 'package:fastfood_inteligente_flutter/src/usuarios/dominio/entidade/usuario.entidade.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBloc extends Bloc<LoginEventos, LoginEstados> {
  final IAutenticaUsuario autenticaUsuarioCasoDeUso;
  final IRegistrarUsuario registrarUsuarioCasoDeUso;
  final IBuscarUsuario buscarUsuarioCasoDeUso;

  LoginBloc(
    this.autenticaUsuarioCasoDeUso,
    this.registrarUsuarioCasoDeUso,
    this.buscarUsuarioCasoDeUso,
  ) : super(IniciarLoginEstado()) {
    on<AutenticarUsuarioLoginEventos>(_autenticarUsuarioLoginEventos,
        transformer: restartable());
    on<BuscarUsuarioLoginEventos>(_buscarUsuarioLoginEventos,
        transformer: restartable());
  }

  Future<void> _buscarUsuarioLoginEventos(
      BuscarUsuarioLoginEventos event, Emitter<LoginEstados> emit) async {
    emit(CarregandoUsuariosLoginEstado());
    final usuario = await buscarUsuarioCasoDeUso.call(event.uid);
    emit(CompletoBuscarUsuarioLoginEstado(usuario));
  }

  Future<void> _autenticarUsuarioLoginEventos(
      AutenticarUsuarioLoginEventos event, Emitter<LoginEstados> emit) async {
    emit(AutenticarUsuarioCarregandoEstado());
    await autenticaUsuarioCasoDeUso.call(event.email, event.senha);
    await Future.delayed(const Duration(seconds: 2));
    emit(AutenticarUsuarioCompletoEstado());
  }
}
