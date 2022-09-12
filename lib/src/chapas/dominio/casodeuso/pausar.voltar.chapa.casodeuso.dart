import 'package:fastfood_inteligente_flutter/src/chapas/dominio/entidade/chapa.entidade.dart';
import 'package:fastfood_inteligente_flutter/src/chapas/dominio/irepositorio/ichapa.repositorio.dart';

abstract class IPausarVoltarChapa {
  Future<void> call(ChapaEntidade chapa, String valor);
}

class PausarVoltarChapa implements IPausarVoltarChapa {
  final IChapaRepositorio repositorio;

  PausarVoltarChapa(this.repositorio);
  @override
  Future<void> call(ChapaEntidade chapa, String valor) async {
    await repositorio.pausarVoltarChapa(chapa, valor);
  }
}
