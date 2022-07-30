import 'package:fastfood_inteligente_flutter/src/chapas/dominio/entidade/chapa.entidade.dart';
import 'package:fastfood_inteligente_flutter/src/chapas/dominio/objetosdevalor/ordem.objeto.dart';

class SolicitacaoCancelamentoPedidoObjeto {
  final String id;
  final String motivo;
  final int posicao;
  final DateTime datahora;
  final ChapaEntidade chapa;
  final ESolicitacaoCancelamentoEstado estado;
  final Ordem ordem;
  SolicitacaoCancelamentoPedidoObjeto({
    required this.id,
    required this.motivo,
    required this.posicao,
    required this.datahora,
    required this.chapa,
    required this.estado,
    required this.ordem,
  });
}

enum ESolicitacaoCancelamentoEstado { aguardando, aceita, negada }
