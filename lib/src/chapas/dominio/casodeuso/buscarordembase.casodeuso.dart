import 'package:fastfood_inteligente_flutter/src/chapas/dominio/irepositorio/ichapa.repositorio.dart';
import 'package:fastfood_inteligente_flutter/src/chapas/dominio/objetosdevalor/ordem.objeto.dart';

abstract class IBuscarOrdemBase {
  Stream<List<Ordem>> call();
}

class BuscarOrdemBase implements IBuscarOrdemBase {
  final IChapaRepositorio repositorio;

  BuscarOrdemBase(this.repositorio);
  @override
  Stream<List<Ordem>> call() {
    return repositorio.buscarOrdemBase();
  }
}
