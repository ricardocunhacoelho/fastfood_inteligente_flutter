import 'package:fastfood_inteligente_flutter/src/mesas/dominio/entidade/mesa.entidade.dart';
import 'package:fastfood_inteligente_flutter/src/mesas/dominio/repositorio/imesa.repositorio.dart';

abstract class IRemoverMesa {
  Future<void> call(MesaEntidade mesa);
}

class RemoverMesa implements IRemoverMesa {
  final IMesaRepositorio repositorio;

  RemoverMesa(this.repositorio);
  @override
  Future<void> call(MesaEntidade mesa) async {
    await repositorio.removerMesa(mesa);
  }
}
