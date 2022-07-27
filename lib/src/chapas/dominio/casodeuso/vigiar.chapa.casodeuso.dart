import 'package:fastfood_inteligente_flutter/src/chapas/dominio/entidade/chapa.entidade.dart';
import 'package:fastfood_inteligente_flutter/src/chapas/dominio/irepositorio/ichapa.repositorio.dart';

abstract class IVigiarChapa {
  Stream<ChapaEntidade> call(int numeroChapa);
}

class VigiarChapa implements IVigiarChapa {
  final IChapaRepositorio repositorio;

  VigiarChapa(this.repositorio);
  @override
  Stream<ChapaEntidade> call(int numeroChapa) {
    return repositorio.vigiarChapa(numeroChapa);
  }
}
