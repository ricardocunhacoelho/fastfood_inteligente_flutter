class UsuarioEntidade {
  final String uid;
  final EUsuarioFuncao usuarioFuncao;
  final String email;
  UsuarioEntidade({
    required this.uid,
    required this.usuarioFuncao,
    required this.email,
  });
}

enum EUsuarioFuncao { chapeiro, gerente, caixa, registraPedidos, avocaClientes  }
