import 'package:fastfood_inteligente_flutter/src/chapas/dominio/objetosdevalor/solicitacoes/solicitacao.cancelamento.pedido.objeto.dart';
import 'package:fastfood_inteligente_flutter/src/chapas/infraestrutura/adaptadores/chapaentidadeparajson.adaptador.dart';
import 'package:fastfood_inteligente_flutter/src/chapas/infraestrutura/adaptadores/ordemparajson.adaptador.dart';

class SolicitacaoCancelamentoPedidoObjetoParaJson {
  static Map<String, dynamic> paraMap(
      SolicitacaoCancelamentoPedidoObjeto solicitacaoCancelamentoPedidoObjeto) {
    return ({
      'id': solicitacaoCancelamentoPedidoObjeto.id,
      'motivo': solicitacaoCancelamentoPedidoObjeto.motivo,
      'estado': solicitacaoCancelamentoPedidoObjeto.estado.name,
      'posicao': solicitacaoCancelamentoPedidoObjeto.posicao,
      'datahora':
          solicitacaoCancelamentoPedidoObjeto.datahora.toIso8601String(),
      'chapa': ChapaEntidadeParaJson.paraMap(
          solicitacaoCancelamentoPedidoObjeto.chapa),
      'ordem': OrdemParaJson.paraMap(solicitacaoCancelamentoPedidoObjeto.ordem),
      'indexOrdem': solicitacaoCancelamentoPedidoObjeto.indexOrdem
    });
  }
}
