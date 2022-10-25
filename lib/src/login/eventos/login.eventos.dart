import 'package:fastfood_inteligente_flutter/src/usuarios/dominio/entidade/usuario.entidade.dart';

abstract class LoginEventos {}

class AutenticarUsuarioLoginEventos
    implements LoginEventos {
  final String email;
  final String senha;
  AutenticarUsuarioLoginEventos(this.email,this.senha);

    }

class RegistrarUsuarioLoginEventos
    implements LoginEventos {
  final UsuarioEntidade usuario;
  final String senha;

  RegistrarUsuarioLoginEventos(this.usuario,this.senha);
}
