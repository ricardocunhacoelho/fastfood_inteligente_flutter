import 'package:fastfood_inteligente_flutter/src/chapas/dominio/objetosdevalor/ordem.objeto.dart';
import 'package:fastfood_inteligente_flutter/src/mesas/dominio/objetosdevalor/cliente.objeto.dart';
import 'package:fastfood_inteligente_flutter/src/mesas/dominio/objetosdevalor/conta.objeto.dart';
import 'package:fastfood_inteligente_flutter/src/produtos/infraestrutura/adaptadores/json.to.produtoentity.dart';

class JsonParaConta {
  static Conta deMap(dynamic json) {
    return Conta(
      produtosPagos: json.containsKey('produtosPagos')
          ? (json['produtosPagos'] as List)
              .map(JsonToProdutoEntity.fromMap)
              .toList()
          : [],
      dinheiroAvulso: json['dinheiroAvulso'] ?? 0,
    );
  }
}
