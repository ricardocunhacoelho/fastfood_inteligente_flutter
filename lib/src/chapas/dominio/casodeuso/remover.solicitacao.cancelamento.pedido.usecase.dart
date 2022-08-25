import 'package:fastfood_inteligente_flutter/src/chapas/dominio/irepositorio/ichapa.repositorio.dart';
import 'package:fastfood_inteligente_flutter/src/chapas/dominio/objetosdevalor/solicitacoes/solicitacao.cancelamento.pedido.objeto.dart';

abstract class IRemoverSolicitacaoCancelamentoPedido {
  Future<void> call(SolicitacaoCancelamentoPedidoObjeto solicitacao);
}

class RemoverSolicitacaoCancelamentoPedido
    implements IRemoverSolicitacaoCancelamentoPedido {
  final IChapaRepositorio repositorio;

  RemoverSolicitacaoCancelamentoPedido(this.repositorio);
  @override
  Future<void> call(SolicitacaoCancelamentoPedidoObjeto solicitacao) async {
    await repositorio.removerSolicitacaoCancelamentoPedido(solicitacao);
  }
}
