import 'package:fastfood_inteligente_flutter/src/mesas/dominio/entidade/mesa.entidade.dart';
import 'package:fastfood_inteligente_flutter/src/mesas/infraestrutura/adaptadores/cliente.parajson.adaptador.dart';
import 'package:fastfood_inteligente_flutter/src/mesas/infraestrutura/adaptadores/conta.parajson.adaptador.dart';

class MesaParaJson {
  static Map<String, dynamic> paraMap(MesaEntidade mesaEntidade) {
    return ({
      'numero': mesaEntidade.numero,
      'atendente': mesaEntidade.atendente,
      'clientes':
          mesaEntidade.clientes.map((e) => ClienteParaJson.paraMap(e)).toList(),
      'conta' : ContaParaJson.paraMap(mesaEntidade.conta),
    });
  }
}
