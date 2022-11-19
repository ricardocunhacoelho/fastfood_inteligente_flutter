import 'package:fastfood_inteligente_flutter/src/mesas/dominio/entidade/mesa.entidade.dart';
import 'package:fastfood_inteligente_flutter/src/mesas/infraestrutura/adaptadores/json.paracliente.adaptador.dart';
import 'package:fastfood_inteligente_flutter/src/mesas/infraestrutura/adaptadores/json.paraconta.adaptador.dart';

class JsonParaMesa {
  static MesaEntidade deMap(Map<dynamic, dynamic> map) {
    return MesaEntidade(
      numero: map['numero'] ?? 0,
      clientes: map.containsKey('clientes')
          ? (map['clientes'] as List)
              .map((e) => JsonParaCliente.deMap(e))
              .toList()
          : [],
      atendente: map['atendente'] ?? '',
      conta: JsonParaConta.deMap(map['conta']),
    );
  }
}
