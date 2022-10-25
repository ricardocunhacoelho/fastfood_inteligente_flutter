import 'package:fastfood_inteligente_flutter/src/usuarios/dominio/entidade/usuario.entidade.dart';
import 'package:fastfood_inteligente_flutter/src/usuarios/dominio/repositorio/iusuario.repositorio.dart';

abstract class IRegistrarUsuario {
  Future<void> call(UsuarioEntidade usuario, String senha);
}
class RegistrarUsuario implements IRegistrarUsuario {
  final IUsuarioRepositorio repositorio;

  RegistrarUsuario(this.repositorio);
  @override
  Future<void> call(UsuarioEntidade usuario, String senha) async {
    await repositorio.registrarUsuario(usuario, senha);
  }
}