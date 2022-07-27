import 'package:fastfood_inteligente_flutter/src/chapas/dominio/objetosdevalor/ordem.objeto.dart';
import 'package:fastfood_inteligente_flutter/src/produtos/infraestrutura/adaptadores/json.to.produtoentity.dart';

class JsonParaOrders {
  static Ordem fromMap(dynamic json) {
    return Ordem(
      produtos: json.containsKey('produtos')
          ? (json['produtos'] as List).map(JsonToProdutoEntity.fromMap).toList()
          : [],
      embalarParaViajem: json['embalarParaViajem'],
      observacao: json['observacao'],
      id: json['id'],
      posicao: json['posicao'],
      estado: EOrdermEstado.values.firstWhere(
        (element) => element.name == json['estado'],
      ),
      datahora: DateTime.parse(json['datahora']),
    );
  }
  // static Map<String, dynamic> toMap(Ordem order) {
  //   return {
  //     'id': order.id,
  //     'position': order.position,
  //     'status': order.status.name,
  //     'timestamp': order.timestamp.toIso8601String(),
  //   };
  // }
}
