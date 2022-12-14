import 'package:fastfood_inteligente_flutter/src/mesas/dominio/objetosdevalor/conta.objeto.dart';
import 'package:fastfood_inteligente_flutter/src/produtos/infraestrutura/adaptadores/json.to.produtoentity.dart';

class JsonParaConta {
  static Conta deMap(dynamic json) {
    return Conta(
      produtos: json.containsKey('produtos')
          ? (json['produtos'] as List)
              .map(JsonToProdutoEntity.fromMap)
              .toList()
          : [],
      total: json['total'] ?? 0,
    );
  }
}
