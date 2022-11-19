import 'package:fastfood_inteligente_flutter/src/chapas/dominio/objetosdevalor/ordem.objeto.dart';
import 'package:fastfood_inteligente_flutter/src/mesas/dominio/objetosdevalor/cliente.objeto.dart';
import 'package:fastfood_inteligente_flutter/src/produtos/infraestrutura/adaptadores/produtoentidade.para.json.dart';

class ClienteParaJson {
  static Map<String, dynamic> paraMap(Cliente cliente) {
    return ({
      'nome': cliente.nome,
      'consumido':
          cliente.consumido.map((e) => ProdutosEntidadeToJson.toMap(e)).toList(),
    });
  }
}
