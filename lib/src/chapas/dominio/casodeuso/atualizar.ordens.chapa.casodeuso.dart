import 'package:fastfood_inteligente_flutter/src/chapas/dominio/irepositorio/ichapa.repositorio.dart';
import 'package:fastfood_inteligente_flutter/src/chapas/dominio/objetosdevalor/ordem.objeto.dart';

abstract class IAtualizarOrdensChapa {
  Future<void> call(List<Ordem> ordens, int numeroDaChapaDeveReceberPedido);
}

class AtualizarOrdensChapa implements IAtualizarOrdensChapa {
  final IChapaRepositorio repositorio;

  AtualizarOrdensChapa(this.repositorio);
  @override
  Future<void> call(
      List<Ordem> ordens, int numeroDaChapaDeveReceberPedido) async {
    await repositorio.atualizarOrdensChapa(
        ordens, numeroDaChapaDeveReceberPedido);
  }
}
