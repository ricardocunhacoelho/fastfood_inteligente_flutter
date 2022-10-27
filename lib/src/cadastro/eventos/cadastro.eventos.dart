import 'package:fastfood_inteligente_flutter/src/usuarios/dominio/entidade/usuario.entidade.dart';

abstract class CadastroEventos {}

class RegistrarUsuarioCadastroEventos
    implements CadastroEventos {
  final UsuarioEntidade usuario;
  final String senha;

  RegistrarUsuarioCadastroEventos(this.usuario,this.senha);
}
