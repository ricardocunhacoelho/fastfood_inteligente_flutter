import 'package:fastfood_inteligente_flutter/src/mesas/dominio/entidade/mesa.entidade.dart';

abstract class IMesaRepositorio {
  
  Future<void> adicionarMesa(MesaEntidade mesa);

  Future<void> removerMesa(MesaEntidade mesa);

  Stream<List<MesaEntidade>> buscarTodasMesas();
  
}
