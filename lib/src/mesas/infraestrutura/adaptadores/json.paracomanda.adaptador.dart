import 'package:fastfood_inteligente_flutter/src/chapas/infraestrutura/adaptadores/jsonparaordem.adaptador.dart';
import 'package:fastfood_inteligente_flutter/src/mesas/dominio/objetosdevalor/comanda.objeto.dart';
import 'package:fastfood_inteligente_flutter/src/mesas/infraestrutura/adaptadores/json.paraconta.adaptador.dart';

class JsonParaComanda {
  static Comanda deMap(dynamic json) {
    return Comanda(
      nomeCliente: json['nomeCliente'] ?? '',
      numeroMesa: json['numeroMesa'],
      pedidos: json.containsKey('pedidos')
          ? (json['pedidos'] as List).map((e) => JsonParaOrdem.fromMap(e))
              .toList()
          : [],
      contaPg: JsonParaConta.deMap(json['contaPg']),
    );
  }
}