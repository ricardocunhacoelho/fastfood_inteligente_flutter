import 'package:fastfood_inteligente_flutter/src/chapas/infraestrutura/adaptadores/jsonparaordem.adaptador.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('veraqui', () {
    final valorOrdem = JsonParaOrders.fromMap(
      {
        'id': 'ordem1',
        'observacao': 'obs',
        'posicao': 1,
        'embalarParaViajem': true,
        'produtos': [],
        'estado': 'aguardando',
        'datahora': '2022-07-11T23:20:29.230241'
      },
    );
    print(valorOrdem);
  });
}
