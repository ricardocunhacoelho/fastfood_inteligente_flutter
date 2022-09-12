//vai ser chamado dentro do evente finalizarPedido(este evento recebe uma lista<ChapaEntidade>)
import 'package:fastfood_inteligente_flutter/src/chapas/dominio/entidade/chapa.entidade.dart';
import 'package:fastfood_inteligente_flutter/src/chapas/dominio/objetosdevalor/ordem.objeto.dart';

abstract class IQuantiaDeOrdensEmCadaChapa {
  List<dynamic> call(List<ChapaEntidade> listaChapas);
}

class QuantiaDeOrdensEmCadaChapa implements IQuantiaDeOrdensEmCadaChapa {
  @override
  List<dynamic> call(List<ChapaEntidade> listaChapas) {
    var tamanhoDaLista = listaChapas.length;
    var listaAdd = new List<int>.generate(tamanhoDaLista, (i) => 1000);
    var i = 0;
    var quantiaFeitos = 0;
    listaChapas.forEach((element) {
      if (i < tamanhoDaLista && element.estado == EChapaEstado.funcionando) {
        quantiaFeitos = 0;
        element.ordens.forEach((element) {
          if (element.estado == EOrdermEstado.feito) {
            quantiaFeitos++;
          }
        });
        listaAdd[i] = (element.ordens.length - quantiaFeitos);
      }
      i++;
    });
    return listaAdd;
  }
}
