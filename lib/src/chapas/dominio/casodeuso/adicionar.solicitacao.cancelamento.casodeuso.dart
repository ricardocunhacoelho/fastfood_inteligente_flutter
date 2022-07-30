import 'package:fastfood_inteligente_flutter/src/chapas/dominio/irepositorio/ichapa.repositorio.dart';
import 'package:fastfood_inteligente_flutter/src/chapas/dominio/objetosdevalor/solicitacoes/solicitacao.cancelamento.pedido.objeto.dart';

abstract class IAdicionarSolicitacaoCancelamento {
  Future<void> call(
      SolicitacaoCancelamentoPedidoObjeto solicitacaoCancelamentoPedidoObjeto);
}

class AdicionarSolicitacaoCancelamento
    implements IAdicionarSolicitacaoCancelamento {
  final IChapaRepositorio repositorio;

  AdicionarSolicitacaoCancelamento(this.repositorio);
  @override
  Future<void> call(
      SolicitacaoCancelamentoPedidoObjeto
          solicitacaoCancelamentoPedidoObjeto) async {
    await repositorio
        .adicionarSolicitacaoCancelamento(solicitacaoCancelamentoPedidoObjeto);
  }
}
