import 'package:fastfood_inteligente_flutter/src/mesas/dominio/objetosdevalor/conta.objeto.dart';
import 'package:fastfood_inteligente_flutter/src/produtos/infraestrutura/adaptadores/produtoentidade.para.json.dart';

class ContaParaJson {
  static Map<String, dynamic> paraMap(Conta conta) {
    return ({
      'total': conta.total,
      'produtos':
          conta.produtos.map((e) => ProdutosEntidadeToJson.toMap(e)).toList(),
    });
  }
}
