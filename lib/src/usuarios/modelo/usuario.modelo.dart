import 'package:fastfood_inteligente_flutter/src/usuarios/dominio/entidade/usuario.entidade.dart';

class UsuarioModelo extends UsuarioEntidade {
  UsuarioModelo({
    required String uid,
    required EUsuarioFuncao usuarioFuncao,
    required String nome,
    required String email,
  }) : super(
          uid: uid,
          usuarioFuncao: usuarioFuncao,
          nome: nome,
          email: email,
        );
  UsuarioModelo copyWith({
    String? uid,
    EUsuarioFuncao? usuarioFuncao,
    String? nome,
    String? email,
  }) {
    return UsuarioModelo(
      uid: uid ?? this.uid,
      usuarioFuncao: usuarioFuncao ?? this.usuarioFuncao,
      nome: nome ?? this.nome,
      email: email ?? this.email,
    );
  }

  factory UsuarioModelo.empty() => UsuarioModelo(
        uid: '',
        usuarioFuncao: EUsuarioFuncao.chapeiro,
        nome: '',
        email: '',
      );

  factory UsuarioModelo.converter(UsuarioEntidade usuario) => UsuarioModelo(
        uid: usuario.uid,
        usuarioFuncao: usuario.usuarioFuncao,
        nome: usuario.nome,
        email: usuario.email,
      );

  static UsuarioModelo toModel(UsuarioModelo usuario) {
    return UsuarioModelo(
      uid: usuario.uid,
      usuarioFuncao: usuario.usuarioFuncao,
      nome: usuario.nome,
      email: usuario.email,
    );
  }

  static UsuarioModelo toProdutoEntidade(UsuarioModelo usuario) {
    return UsuarioModelo(
      uid: usuario.uid,
      usuarioFuncao: usuario.usuarioFuncao,
      nome: usuario.nome,
      email: usuario.email,
    );
  }
}
