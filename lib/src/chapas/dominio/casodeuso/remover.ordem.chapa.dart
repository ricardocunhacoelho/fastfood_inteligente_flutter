import 'package:fastfood_inteligente_flutter/src/chapas/dominio/irepositorio/ichapa.repositorio.dart';

abstract class IRemoverOrdemChapa {
  Future<void> call(int numeroDaChapa, int indexOrdem);
}

class RemoverOrdemChapa implements IRemoverOrdemChapa {
  final IChapaRepositorio repositorio;

  RemoverOrdemChapa(this.repositorio);
  @override
  Future<void> call(int numeroDaChapa, int indexOrdem) async {
    await repositorio.removerOrdemChapa(numeroDaChapa, indexOrdem);
  }
}
