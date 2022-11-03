import 'package:fastfood_inteligente_flutter/src/usuarios/dominio/entidade/usuario.entidade.dart';

abstract class LoginEstados {}

class IniciarLoginEstado implements LoginEstados {}

class CarregandoUsuariosLoginEstado implements LoginEstados {}

class CompletoBuscarUsuarioLoginEstado implements LoginEstados {
  final UsuarioEntidade usuario;

  CompletoBuscarUsuarioLoginEstado(this.usuario);
}

class ErroUsuariosLoginEstado implements LoginEstados {
  final String menssagem;

  ErroUsuariosLoginEstado(this.menssagem);
}

class AutenticarUsuarioCarregandoEstado implements LoginEstados {}

class AutenticarUsuarioCompletoEstado implements LoginEstados {}

class AutenticarUsuarioErroEstado implements LoginEstados {}
