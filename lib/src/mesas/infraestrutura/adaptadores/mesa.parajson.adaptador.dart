import 'package:fastfood_inteligente_flutter/src/mesas/dominio/entidade/mesa.entidade.dart';
import 'package:fastfood_inteligente_flutter/src/mesas/infraestrutura/adaptadores/comanda.parajson.adaptador.dart';

class MesaParaJson {
  static Map<String, dynamic> paraMap(MesaEntidade mesaEntidade) {
    return ({
      'numero': mesaEntidade.numero,
      'comandas':
          mesaEntidade.comandas.map((e) => ComandaParaJson.paraMap(e)).toList(),
    });
  }
}
