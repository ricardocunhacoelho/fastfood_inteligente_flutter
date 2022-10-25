import 'package:fastfood_inteligente_flutter/src/usuarios/dominio/repositorio/iusuario.repositorio.dart';

abstract class IAutenticaUsuario {
  Future<void> call(String nomeUsuario, String senha);
}
class AutenticaUsuario implements IAutenticaUsuario {
  final IUsuarioRepositorio repositorio;

  AutenticaUsuario(this.repositorio);
  @override
  Future<void> call(String nomeUsuario, String senha) async {
    await repositorio.autenticarUsuario(nomeUsuario, senha);
  }
}
