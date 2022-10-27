import 'package:fastfood_inteligente_flutter/src/usuarios/dominio/entidade/usuario.entidade.dart';

class UsuarioModelo extends UsuarioEntidade {
  UsuarioModelo({
    required String uid,
    required EUsuarioFuncao usuarioFuncao,
    required String email,
  }) : super(
          uid: uid,
          usuarioFuncao: usuarioFuncao,
          email: email,
        );
  UsuarioModelo copyWith({
    String? uid,
    EUsuarioFuncao? usuarioFuncao,
    String? email,
  }) {
    return UsuarioModelo(
      uid: uid ?? this.uid,
      usuarioFuncao: usuarioFuncao ?? this.usuarioFuncao,
      email: email ?? this.email,
    );
  }

  factory UsuarioModelo.empty() => UsuarioModelo(
        uid: '',
        usuarioFuncao: EUsuarioFuncao.chapeiro,
        email: '',
      );

  factory UsuarioModelo.converter(UsuarioEntidade usuario) => UsuarioModelo(
        uid: usuario.uid,
        usuarioFuncao: usuario.usuarioFuncao,
        email: usuario.email,
      );

  static UsuarioModelo toModel(UsuarioModelo usuario) {
    return UsuarioModelo(
      uid: usuario.uid,
      usuarioFuncao: usuario.usuarioFuncao,
      email: usuario.email,
    );
  }

  static UsuarioModelo toProdutoEntidade(UsuarioModelo usuario) {
    return UsuarioModelo(
      uid: usuario.uid,
      usuarioFuncao: usuario.usuarioFuncao,
      email: usuario.email,
    );
  }
}
