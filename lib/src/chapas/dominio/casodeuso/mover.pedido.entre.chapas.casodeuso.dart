import 'package:fastfood_inteligente_flutter/src/chapas/dominio/entidade/chapa.entidade.dart';
import 'package:fastfood_inteligente_flutter/src/chapas/dominio/irepositorio/ichapa.repositorio.dart';
import 'package:fastfood_inteligente_flutter/src/chapas/dominio/objetosdevalor/ordem.objeto.dart';

abstract class IMoverPedidoEntreChapas {
  Future<void> call(
      Ordem ordem, ChapaEntidade chapaAtual, ChapaEntidade chapaDestino);
}

class MoverPedidoEntreChapas implements IMoverPedidoEntreChapas {
  final IChapaRepositorio repositorio;

  MoverPedidoEntreChapas(this.repositorio);
  @override
  Future<void> call(
      Ordem ordem, ChapaEntidade chapaAtual, ChapaEntidade chapaDestino) async {
    await repositorio.moverPedidoEntreChapas(ordem, chapaAtual, chapaDestino);
  }
}
