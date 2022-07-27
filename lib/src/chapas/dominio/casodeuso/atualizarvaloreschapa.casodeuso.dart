import 'package:fastfood_inteligente_flutter/src/chapas/dominio/entidade/chapa.entidade.dart';
import 'package:fastfood_inteligente_flutter/src/chapas/dominio/irepositorio/ichapa.repositorio.dart';

abstract class IAtualizarValoresChapa {
  Future<void> call(ChapaEntidade chapa);
}

class AtualizarValoresChapa implements IAtualizarValoresChapa {
  final IChapaRepositorio repositorio;

  AtualizarValoresChapa(this.repositorio);
  @override
  Future<void> call(ChapaEntidade chapa) async {
    await repositorio.atualizarValoresChapa(chapa);
  }
}
