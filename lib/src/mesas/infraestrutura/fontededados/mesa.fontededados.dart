abstract class IMesaFonteDeDados {

  Future<void> adicionarMesa(Map<String, dynamic> map);

  Future<void> removerMesa(Map<String, dynamic> map);

  Stream<List<Map>> buscarTodasMesas();

  Stream<Map> buscarMesas(int numeroDaMesa);

}
