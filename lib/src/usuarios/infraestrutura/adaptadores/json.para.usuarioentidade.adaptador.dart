import 'package:fastfood_inteligente_flutter/src/produtos/dominio/entidade/produto.entidade.dart';
import 'package:fastfood_inteligente_flutter/src/usuarios/dominio/entidade/usuario.entidade.dart';

class JsonParaUsuarioEntidade {
  static UsuarioEntidade deMap(dynamic map) {
    return UsuarioEntidade(
      uid: map['uid'],
      usuarioFuncao: EUsuarioFuncao.values.firstWhere(
        (element) => element.name == map['usuarioFuncao'],
      ),
      email: map['email'],
    );
  }
}
