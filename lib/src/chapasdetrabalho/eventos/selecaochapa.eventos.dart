import 'package:fastfood_inteligente_flutter/src/chapas/dominio/entidade/chapa.entidade.dart';
import 'package:fastfood_inteligente_flutter/src/chapas/dominio/objetosdevalor/solicitacoes/solicitacao.cancelamento.pedido.objeto.dart';

abstract class ChapaDeTrabalhoEventos {}

class BuscarChapaDeTrabalhoEventos implements ChapaDeTrabalhoEventos {
  final int numeroChapa;
  BuscarChapaDeTrabalhoEventos(this.numeroChapa);
}

class AtualizarEstadoPedidoChapaDeTrabalhoEventos
    implements ChapaDeTrabalhoEventos {
  final String estado;
  final int indexOrdem;
  final ChapaEntidade chapaEntidade;

  AtualizarEstadoPedidoChapaDeTrabalhoEventos(
      this.estado, this.indexOrdem, this.chapaEntidade);
}

class RemoverPedidoChapaDeTrabalhoEventos implements ChapaDeTrabalhoEventos {
  final int numeroDaChapa;
  final int indexOrdem;

  RemoverPedidoChapaDeTrabalhoEventos(this.numeroDaChapa, this.indexOrdem);
}

class RequisitarDeletarPedidoChapaDeTrabalhoEventos
    implements ChapaDeTrabalhoEventos {
  final SolicitacaoCancelamentoPedidoObjeto solicitacaoCancelamentoPedidoObjeto;

  RequisitarDeletarPedidoChapaDeTrabalhoEventos(
      this.solicitacaoCancelamentoPedidoObjeto);
}

class BuscarTodasSolicitacoesCancelamentoPedidoChapaDeTrabalhoEventos
    implements ChapaDeTrabalhoEventos {}
