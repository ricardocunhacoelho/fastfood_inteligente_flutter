import 'package:fastfood_inteligente_flutter/src/chapas/dominio/objetosdevalor/ordem.objeto.dart';
import 'package:fastfood_inteligente_flutter/src/produtos/infraestrutura/adaptadores/json.to.produtoentity.dart';

class JsonParaOrdem {
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
      nomeCliente: json['nomeCliente'],
      atendente: json['atendente'],
      nomeChapeiro: json['nomeChapeiro'],
      numeroMesa: json['numeroMesa'],
      valorTotalPedido: json['valorTotalPedido'],
    );
  }
}
