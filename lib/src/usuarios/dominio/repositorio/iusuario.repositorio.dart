import 'package:fastfood_inteligente_flutter/src/usuarios/dominio/entidade/usuario.entidade.dart';

abstract class IUsuarioRepositorio {
  Future<void> autenticarUsuario(String nomeUsuario, String senha);

  Future<void> registrarUsuario(UsuarioEntidade usuario, String senha);
}
