import 'package:fastfood_inteligente_flutter/src/chapas/infraestrutura/adaptadores/ordemparajson.adaptador.dart';
import 'package:fastfood_inteligente_flutter/src/mesas/dominio/objetosdevalor/comanda.objeto.dart';
import 'package:fastfood_inteligente_flutter/src/mesas/infraestrutura/adaptadores/conta.parajson.adaptador.dart';

class ComandaParaJson {
  static Map<String, dynamic> paraMap(Comanda comanda) {
    return ({
      'nomeCliente': comanda.nomeCliente,
      'numeroMesa': comanda.numeroMesa,
      'pedidos': comanda.pedidos.map((e) => OrdemParaJson.paraMap(e)).toList(),
      'contaPg': ContaParaJson.paraMap(comanda.contaPg),
    });
  }
}
