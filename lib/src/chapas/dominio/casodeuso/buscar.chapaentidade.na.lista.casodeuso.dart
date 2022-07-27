import 'package:fastfood_inteligente_flutter/src/chapas/dominio/entidade/chapa.entidade.dart';

abstract class IBuscarChapaEntidadeNaLista {
  ChapaEntidade call(List<dynamic> listaChapas, int numeroDaChapa);
}

class BuscarChapaEntidadeNaLista implements IBuscarChapaEntidadeNaLista {
  ChapaEntidade chapa = ChapaEntidade(
      titulo: 'titulo',
      id: 'id',
      numerodachapa: 0,
      estado: EChapaEstado.desligada,
      ordens: []);
  @override
  ChapaEntidade call(List<dynamic> listaChapas, int numeroDaChapa) {
    listaChapas.forEach((element) {
      if (element.numerodachapa == numeroDaChapa) {
        chapa = element;
      }
    });
    return chapa;
  }
}
