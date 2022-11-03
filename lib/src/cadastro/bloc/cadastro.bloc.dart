import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:fastfood_inteligente_flutter/src/cadastro/estados/Cadastro.estados.dart';
import 'package:fastfood_inteligente_flutter/src/cadastro/eventos/Cadastro.eventos.dart';
import 'package:fastfood_inteligente_flutter/src/usuarios/dominio/casodeuso/registra.usuario.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CadastroBloc
    extends Bloc<CadastroEventos, CadastroEstados> {
  
  final IRegistrarUsuario registrarUsuarioCasoDeUso;
  
  CadastroBloc(
      this.registrarUsuarioCasoDeUso,
      )
      : super(InicialCadastroEstado()) {
    on<RegistrarUsuarioCadastroEventos>(
        _registrarUsuarioCadastroEventos,
        transformer: restartable());
  }

  Future<void> _registrarUsuarioCadastroEventos(
      RegistrarUsuarioCadastroEventos event,
      Emitter<CadastroEstados> emit) async {
    emit(RegistrarUsuarioCarregandoEstado());
    await registrarUsuarioCasoDeUso.call(event.usuario, event.senha);
    await Future.delayed(const Duration(seconds: 2));
        emit(RegistrarUsuarioCompletoEstado());

  }
}
