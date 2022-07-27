import 'package:fastfood_inteligente_flutter/src/chapas/dominio/entidade/chapa.entidade.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('description', () {
    final List listanumerosdechapa = [4, 2, 1, 3];
    listanumerosdechapa.sort((b, a) => a.compareTo(b));
    int valorasersomado = 0;
    bool continuar = true;
    int maiorNumero = listanumerosdechapa[0];
    for (var i = 0; i < listanumerosdechapa.length - 1 && continuar; i++) {
      if (listanumerosdechapa[i] != listanumerosdechapa[i + 1] + 1) {
        valorasersomado = listanumerosdechapa[i + 1] + 1;
        continuar = false;
      } else {
        valorasersomado = listanumerosdechapa[0];
      }
    }
    print(valorasersomado);
  });
}
