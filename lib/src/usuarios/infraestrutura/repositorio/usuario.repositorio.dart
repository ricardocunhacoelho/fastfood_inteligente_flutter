import 'package:fastfood_inteligente_flutter/src/usuarios/dominio/entidade/usuario.entidade.dart';
import 'package:fastfood_inteligente_flutter/src/usuarios/dominio/repositorio/iusuario.repositorio.dart';
import 'package:fastfood_inteligente_flutter/src/usuarios/infraestrutura/adaptadores/usuarioentidade.para.json.adaptador.dart';
import 'package:fastfood_inteligente_flutter/src/usuarios/infraestrutura/fontededados/iusuario.fontededados.dart';

class UsuarioRepositorio implements IUsuarioRepositorio {
  final IUsuarioFonteDeDados fontededados;

  UsuarioRepositorio(this.fontededados);

  @override
  Future<void> registrarUsuario(UsuarioEntidade usuario, String senha) async {
    final map = UsuarioEntidadeParaJson.paraMap(usuario);
    await fontededados.registrarUsuario(map, senha);
  }

  @override
  Future<void> autenticarUsuario(String email, String senha) async {
    await fontededados.autenticarUsuario(email, senha);
  }
}
