import 'package:fastfood_inteligente_flutter/src/chapas/dominio/entidade/chapa.entidade.dart';
import 'package:fastfood_inteligente_flutter/src/chapas/dominio/objetosdevalor/ordem.objeto.dart';
import 'package:fastfood_inteligente_flutter/src/chapas/dominio/objetosdevalor/solicitacoes/solicitacao.cancelamento.pedido.objeto.dart';
import 'package:fastfood_inteligente_flutter/src/configuracoes/modelo/configuracoes.chapa.modelo.dart';

class ChapasDeTrabalhoSolicitacoesModelo
    extends SolicitacaoCancelamentoPedidoObjeto {
  ChapasDeTrabalhoSolicitacoesModelo(
      {required String id,
      required String motivo,
      required int posicao,
      required DateTime datahora,
      required ChapaEntidade chapa,
      required ESolicitacaoCancelamentoEstado estado,
      required Ordem ordem,
      required int indexOrdem})
      : super(
          indexOrdem: indexOrdem,
          id: id,
          motivo: motivo,
          posicao: posicao,
          datahora: datahora,
          chapa: chapa,
          estado: estado,
          ordem: ordem,
        );
  ChapasDeTrabalhoSolicitacoesModelo copyWith({
    int? indexOrdem,
    String? id,
    String? motivo,
    int? posicao,
    DateTime? datahora,
    ChapaEntidade? chapa,
    ESolicitacaoCancelamentoEstado? estado,
    Ordem? ordem,
  }) {
    return ChapasDeTrabalhoSolicitacoesModelo(
      indexOrdem: indexOrdem ?? this.indexOrdem,
      id: id ?? this.id,
      motivo: motivo ?? this.motivo,
      posicao: posicao ?? this.posicao,
      datahora: datahora ?? this.datahora,
      chapa: chapa ?? this.chapa,
      estado: estado ?? this.estado,
      ordem: ordem ?? this.ordem,
    );
  }

  factory ChapasDeTrabalhoSolicitacoesModelo.empty() =>
      ChapasDeTrabalhoSolicitacoesModelo(
        indexOrdem: 1,
        id: '',
        motivo: '',
        posicao: 1,
        datahora: DateTime.now(),
        chapa: ConfiguracoesChapaModelo.empty(),
        estado: ESolicitacaoCancelamentoEstado.aguardando,
        ordem: Ordem(
          id: 'id',
          observacao: 'observacao',
          posicao: 1,
          embalarParaViajem: false,
          datahora: DateTime.now(),
          produtos: [],
          estado: EOrdermEstado.aguardando,
          nomeCliente: '',
          atendente: '',
          nomeChapeiro: '',
          numeroMesa: 0,
          valorTotalPedido: 0,
        ),
      );

  factory ChapasDeTrabalhoSolicitacoesModelo.converter(
          SolicitacaoCancelamentoPedidoObjeto
              solicitacaoCancelamentoPedidoObjeto) =>
      ChapasDeTrabalhoSolicitacoesModelo(
          indexOrdem: solicitacaoCancelamentoPedidoObjeto.indexOrdem,
          id: solicitacaoCancelamentoPedidoObjeto.id,
          motivo: solicitacaoCancelamentoPedidoObjeto.motivo,
          posicao: solicitacaoCancelamentoPedidoObjeto.posicao,
          datahora: solicitacaoCancelamentoPedidoObjeto.datahora,
          chapa: solicitacaoCancelamentoPedidoObjeto.chapa,
          estado: solicitacaoCancelamentoPedidoObjeto.estado,
          ordem: solicitacaoCancelamentoPedidoObjeto.ordem);
}
