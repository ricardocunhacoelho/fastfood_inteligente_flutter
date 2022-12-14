import 'package:fastfood_inteligente_flutter/src/chapas/dominio/objetosdevalor/solicitacoes/solicitacao.cancelamento.pedido.objeto.dart';
import 'package:fastfood_inteligente_flutter/src/chapas/infraestrutura/adaptadores/jsonparachapaentidade.adaptador.dart';
import 'package:fastfood_inteligente_flutter/src/chapas/infraestrutura/adaptadores/jsonparaordem.adaptador.dart';

class JsonParaSolicitacaoCancelamentoPedidoObjeto {
  static SolicitacaoCancelamentoPedidoObjeto deMap(Map<dynamic, dynamic> map) {
    return SolicitacaoCancelamentoPedidoObjeto(
        indexOrdem: map['indexOrdem'],
        id: map['id'],
        posicao: map['posicao'] ?? 0,
        estado: ESolicitacaoCancelamentoEstado.values
            .firstWhere((element) => element.name == map['estado']),
        ordem: JsonParaOrdem.fromMap(map['ordem']),
        chapa: JsonParaChapa.deMap(map['chapa']),
        motivo: map['motivo'],
        datahora: DateTime.parse(map['datahora']));
  }
}
