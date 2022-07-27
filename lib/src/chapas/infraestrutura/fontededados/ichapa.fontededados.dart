abstract class IChapaFonteDeDados {
  Stream<List<Map>> buscarTodasChapas();

  Future<void> adicionarChapa(Map<String, dynamic> map);

  Future<void> deletarChapa(Map<String, dynamic> map);

  Future<void> atualizarValoresChapa(Map<String, dynamic> map);

  Future<void> atualizarOrdensChapa(
      List<Map<String, dynamic>> listaMapOrdens, String id);

  Stream<List<Map>> buscarOrdemBase();

  Future<void> atualizarOrdemBase(Map<String, dynamic> map);

  Future<void> resetarTodosPedidos();

  Future<void> atualizarEstadoPedido(
      Map<String, dynamic> mapChapaEntidade, String estado, int indexOrdem);

  Stream<Map> vigiarChapa(int numeroChapa);

  Future<void> removerOrdemChapa(String id, int indexOrdem);
}
