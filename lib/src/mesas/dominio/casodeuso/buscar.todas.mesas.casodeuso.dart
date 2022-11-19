import 'package:fastfood_inteligente_flutter/src/mesas/dominio/entidade/mesa.entidade.dart';
import 'package:fastfood_inteligente_flutter/src/mesas/dominio/repositorio/imesa.repositorio.dart';

abstract class IBuscarTodasMesas {
  Stream<List<MesaEntidade>> call();
}

class BuscarTodasMesas implements IBuscarTodasMesas {
  final IMesaRepositorio repositorio;

  BuscarTodasMesas(this.repositorio);
  @override
  Stream<List<MesaEntidade>> call() {
    return repositorio.buscarTodasMesas();
  }
}
