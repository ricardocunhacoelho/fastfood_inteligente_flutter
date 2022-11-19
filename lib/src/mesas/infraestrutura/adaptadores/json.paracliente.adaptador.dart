import 'package:fastfood_inteligente_flutter/src/chapas/dominio/objetosdevalor/ordem.objeto.dart';
import 'package:fastfood_inteligente_flutter/src/mesas/dominio/objetosdevalor/cliente.objeto.dart';
import 'package:fastfood_inteligente_flutter/src/produtos/infraestrutura/adaptadores/json.to.produtoentity.dart';

class JsonParaCliente {
  static Cliente deMap(dynamic json) {
    return Cliente(
      nome: json['nome'] ?? '',
      consumido: json.containsKey('consumido')
          ? (json['consumido'] as List).map(JsonToProdutoEntity.fromMap).toList()
          : [],
    );
  }
}
