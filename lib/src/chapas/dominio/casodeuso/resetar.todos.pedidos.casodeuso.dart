import 'package:fastfood_inteligente_flutter/src/chapas/dominio/irepositorio/ichapa.repositorio.dart';

abstract class IResetarTodosPedidos {
  Future<void> call();
}

class ResetarTodosPedidos implements IResetarTodosPedidos {
  final IChapaRepositorio repositorio;

  ResetarTodosPedidos(this.repositorio);
  @override
  Future<void> call() async {
    await repositorio.resetarTodosPedidos();
  }
}
