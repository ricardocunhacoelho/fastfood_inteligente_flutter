import 'package:fastfood_inteligente_flutter/src/usuarios/dominio/entidade/usuario.entidade.dart';
import 'package:fastfood_inteligente_flutter/src/usuarios/dominio/repositorio/iusuario.repositorio.dart';

abstract class IBuscarUsuario {
  Future<UsuarioEntidade> call(String uid);
}

class BuscarUsuario implements IBuscarUsuario {
  final IUsuarioRepositorio repositorio;

  BuscarUsuario(this.repositorio);
  @override
  Future<UsuarioEntidade> call(String uid) async {
    return await repositorio.buscarUsuario(uid);
  }
}
