import 'package:fastfood_inteligente_flutter/src/chapas/dominio/irepositorio/ichapa.repositorio.dart';
import 'package:fastfood_inteligente_flutter/src/chapas/dominio/objetosdevalor/ordem.objeto.dart';

abstract class IAtualizarOrdemBase {
  Future<void> call(Ordem ordem);
}

class AtualizarOrdemBase implements IAtualizarOrdemBase {
  final IChapaRepositorio repositorio;

  AtualizarOrdemBase(this.repositorio);
  @override
  Future<void> call(Ordem ordem) async {
    await repositorio.atualizarOrdemBase(ordem);
  }
}
