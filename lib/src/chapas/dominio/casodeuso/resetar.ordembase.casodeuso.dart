import 'package:fastfood_inteligente_flutter/src/chapas/dominio/irepositorio/ichapa.repositorio.dart';
import 'package:fastfood_inteligente_flutter/src/recepcao/modelo/entrada.ordem.model.dart';

abstract class IResetarOrdemBase {
  Future<void> call();
}

class ResetarOrdemBase implements IResetarOrdemBase {
  final IChapaRepositorio repositorio;

  ResetarOrdemBase(this.repositorio);
  final ordem = EntradaOrdemModelo.empty();
  @override
  Future<void> call() async {
    await repositorio.atualizarOrdemBase(ordem);
  }
}
