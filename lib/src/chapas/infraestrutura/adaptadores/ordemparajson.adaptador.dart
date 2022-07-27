import 'package:fastfood_inteligente_flutter/src/chapas/dominio/objetosdevalor/ordem.objeto.dart';
import 'package:fastfood_inteligente_flutter/src/produtos/infraestrutura/adaptadores/produtoentidade.para.json.dart';

class OrdemParaJson {
  static Map<String, dynamic> paraMap(Ordem ordem) {
    return ({
      'id': ordem.id,
      'observacao': ordem.observacao,
      'estado': ordem.estado.name,
      'posicao': ordem.posicao,
      'embalarParaViajem': ordem.embalarParaViajem,
      'datahora': ordem.datahora.toIso8601String(),
      'produtos':
          ordem.produtos.map((e) => ProdutosEntidadeToJson.toMap(e)).toList(),
    });
  }
}
