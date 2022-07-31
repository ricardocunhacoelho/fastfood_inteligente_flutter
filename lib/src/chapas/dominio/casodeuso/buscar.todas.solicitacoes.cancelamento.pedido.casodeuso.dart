import 'package:fastfood_inteligente_flutter/src/chapas/dominio/irepositorio/ichapa.repositorio.dart';
import 'package:fastfood_inteligente_flutter/src/chapas/dominio/objetosdevalor/solicitacoes/solicitacao.cancelamento.pedido.objeto.dart';

abstract class IBuscarTodasSolicitacoesCancelamentoPedido {
  Stream<List<SolicitacaoCancelamentoPedidoObjeto>> call();
}

class BuscarTodasSolicitacoesCancelamentoPedido
    implements IBuscarTodasSolicitacoesCancelamentoPedido {
  final IChapaRepositorio repositorio;

  BuscarTodasSolicitacoesCancelamentoPedido(this.repositorio);
  @override
  Stream<List<SolicitacaoCancelamentoPedidoObjeto>> call() {
    return repositorio.buscarTodasSolicitacoesCancelamentoPedido();
  }
}
