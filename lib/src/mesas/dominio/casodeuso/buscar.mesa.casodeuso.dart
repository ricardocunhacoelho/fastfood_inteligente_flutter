import 'package:fastfood_inteligente_flutter/src/mesas/dominio/entidade/mesa.entidade.dart';
import 'package:fastfood_inteligente_flutter/src/mesas/dominio/repositorio/imesa.repositorio.dart';

abstract class IBuscarMesas {
  Stream<MesaEntidade> call(int numeroDaMesa);
}

class BuscarMesas implements IBuscarMesas {
  final IMesaRepositorio repositorio;

  BuscarMesas(this.repositorio);
  @override
  Stream<MesaEntidade> call(int numeroDaMesa) {
    return repositorio.buscarMesas(numeroDaMesa);
  }
}
