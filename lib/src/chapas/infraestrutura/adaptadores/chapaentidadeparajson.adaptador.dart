import 'package:fastfood_inteligente_flutter/src/chapas/dominio/entidade/chapa.entidade.dart';
import 'package:fastfood_inteligente_flutter/src/chapas/infraestrutura/adaptadores/ordemparajson.adaptador.dart';

class ChapaEntidadeParaJson {
  static Map<String, dynamic> paraMap(ChapaEntidade chapaEntidade) {
    return ({
      'id': chapaEntidade.id,
      'estado': chapaEntidade.estado.name,
      'titulo': chapaEntidade.titulo,
      'numerodachapa': chapaEntidade.numerodachapa,
      'ordens':
          chapaEntidade.ordens.map((e) => OrdemParaJson.paraMap(e)).toList(),
    });
  }
}
