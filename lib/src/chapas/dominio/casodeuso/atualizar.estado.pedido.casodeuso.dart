import 'package:fastfood_inteligente_flutter/src/chapas/dominio/entidade/chapa.entidade.dart';
import 'package:fastfood_inteligente_flutter/src/chapas/dominio/irepositorio/ichapa.repositorio.dart';

abstract class IAtualizarEstadoPedido {
  Future<void> call(String estado, int indexOrdem, ChapaEntidade chapaEntidade);
}

class AtualizarEstadoPedido implements IAtualizarEstadoPedido {
  final IChapaRepositorio repositorio;

  AtualizarEstadoPedido(this.repositorio);
  @override
  Future<void> call(
      String estado, int indexOrdem, ChapaEntidade chapaEntidade) async {
    await repositorio.atualizarEstadoPedido(estado, indexOrdem, chapaEntidade);
  }
}
