import 'package:fastfood_inteligente_flutter/src/mesas/dominio/entidade/mesa.entidade.dart';
import 'package:fastfood_inteligente_flutter/src/mesas/dominio/repositorio/imesa.repositorio.dart';

abstract class IAdicionarMesa {
  Future<void> call(MesaEntidade mesa);
}

class AdicionarMesa implements IAdicionarMesa {
  final IMesaRepositorio repositorio;

  AdicionarMesa(this.repositorio);
  @override
  Future<void> call(MesaEntidade mesa) async {
    await repositorio.adicionarMesa(mesa);
  }
}
