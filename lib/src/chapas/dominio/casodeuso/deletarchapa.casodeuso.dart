import 'package:fastfood_inteligente_flutter/src/chapas/dominio/entidade/chapa.entidade.dart';
import 'package:fastfood_inteligente_flutter/src/chapas/dominio/irepositorio/ichapa.repositorio.dart';
import 'package:fastfood_inteligente_flutter/src/produtos/dominio/entidade/produto.entidade.dart';

abstract class IDeletarChapa {
  Future<void> call(ChapaEntidade chapa);
}

class DeletarChapa implements IDeletarChapa {
  final IChapaRepositorio repositorio;

  DeletarChapa(this.repositorio);
  @override
  Future<void> call(ChapaEntidade chapa) async {
    await repositorio.deletarChapa(chapa);
  }
}
