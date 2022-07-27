import 'package:fastfood_inteligente_flutter/src/chapas/dominio/entidade/chapa.entidade.dart';
import 'package:fastfood_inteligente_flutter/src/chapas/dominio/irepositorio/ichapa.repositorio.dart';

abstract class IBuscarTodasChapas {
  Stream<List<ChapaEntidade>> call();
}

class BuscarTodasChapas implements IBuscarTodasChapas {
  final IChapaRepositorio repositorio;

  BuscarTodasChapas(this.repositorio);
  @override
  Stream<List<ChapaEntidade>> call() {
    return repositorio.buscarTodasChapas();
  }
}
