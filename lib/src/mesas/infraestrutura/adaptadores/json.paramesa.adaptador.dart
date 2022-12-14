import 'package:fastfood_inteligente_flutter/src/mesas/dominio/entidade/mesa.entidade.dart';
import 'package:fastfood_inteligente_flutter/src/mesas/infraestrutura/adaptadores/json.paracomanda.adaptador.dart';

class JsonParaMesa {
  static MesaEntidade deMap(Map<dynamic, dynamic> map) {
    return MesaEntidade(
      numero: map['numero'] ?? 0,
      comandas: map.containsKey('comandas')
          ? (map['comanda'] as List)
              .map((e) => JsonParaComanda.deMap(e))
              .toList()
          : [],
    );
  }
}
