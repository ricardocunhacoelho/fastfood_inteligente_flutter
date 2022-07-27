import 'package:fastfood_inteligente_flutter/src/chapas/dominio/entidade/chapa.entidade.dart';
import 'package:fastfood_inteligente_flutter/src/chapas/dominio/irepositorio/ichapa.repositorio.dart';

abstract class IAdicionarChapa {
  Future<void> call(ChapaEntidade chapa);
}

class AdicionarChapa implements IAdicionarChapa {
  final IChapaRepositorio repositorio;

  AdicionarChapa(this.repositorio);
  @override
  Future<void> call(ChapaEntidade chapa) async {
    await repositorio.adicionarChapa(chapa);
  }
}
