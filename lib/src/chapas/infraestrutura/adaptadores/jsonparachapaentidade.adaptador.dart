import 'package:fastfood_inteligente_flutter/src/chapas/dominio/entidade/chapa.entidade.dart';
import 'package:fastfood_inteligente_flutter/src/chapas/infraestrutura/adaptadores/jsonparaordem.adaptador.dart';

class JsonParaChapa {
  static ChapaEntidade deMap(Map<dynamic, dynamic> map) {
    return ChapaEntidade(
      titulo: map['titulo'],
      id: map['id'],
      numerodachapa: map['numerodachapa'] ?? 0,
      estado: EChapaEstado.values
          .firstWhere((element) => element.name == map['estado']),
      ordens: map.containsKey('ordens')
          ? (map['ordens'] as List)
              .map((e) => JsonParaOrders.fromMap(e))
              .toList()
          : [],
    );
  }
}
