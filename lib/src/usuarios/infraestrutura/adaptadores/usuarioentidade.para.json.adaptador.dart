import 'package:fastfood_inteligente_flutter/src/usuarios/dominio/entidade/usuario.entidade.dart';

class UsuarioEntidadeParaJson {
  static Map<String, dynamic> paraMap(UsuarioEntidade usuario) {
    return ({
      'uid': usuario.uid,
      'usuarioFuncao': usuario.usuarioFuncao.name,
      'nome': usuario.nome,
      'email': usuario.email,
    });
  }
}
