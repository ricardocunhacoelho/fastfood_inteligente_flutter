class UsuarioEntidade {
  final String uid;
  final EUsuarioFuncao usuarioFuncao;
  final String nome;
  final String email;
  UsuarioEntidade({
    required this.uid,
    required this.usuarioFuncao,
    required this.nome,
    required this.email,
  });
}

enum EUsuarioFuncao { chapeiro, gerente, caixa, registraPedidos, avocaClientes  }
