import 'package:fastfood_inteligente_flutter/src/chapas/dominio/entidade/chapa.entidade.dart';

class CalculoNumeroChapa {
  final List listanumerosdechapa = [];
  int calcular(List<ChapaEntidade>? todasChapas) {
    todasChapas!.forEach((chapa) {
      listanumerosdechapa.add(chapa.numerodachapa);
    });
    if (listanumerosdechapa.length == 0) {
      return 1;
    } else if (listanumerosdechapa.length == 1 && listanumerosdechapa[0]! < 2) {
      return 2;
    } else if (listanumerosdechapa.length == 1 && listanumerosdechapa[0] == 2) {
      return 1;
    } else {
      listanumerosdechapa.sort((b, a) => a.compareTo(b));
      if ((listanumerosdechapa.length - (listanumerosdechapa.first - 1)) <= 0) {
        return listanumerosdechapa.last - 1;
      }
      int valorasersomado = 0;
      bool continuar = true;
      int maiorNumero = listanumerosdechapa[0];
      for (var i = 0; i < listanumerosdechapa.length - 1 && continuar; i++) {
        if (listanumerosdechapa[i] != listanumerosdechapa[i + 1] + 1) {
          valorasersomado = listanumerosdechapa[i + 1] + 1;
          continuar = false;
        } else {
          valorasersomado = listanumerosdechapa[0] + 1;
        }
      }
      return valorasersomado;
    }
  }
}
