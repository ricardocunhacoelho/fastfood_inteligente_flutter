import 'package:fastfood_inteligente_flutter/src/chapas/dominio/entidade/chapa.entidade.dart';
import 'package:fastfood_inteligente_flutter/src/chapas/dominio/objetosdevalor/ordem.objeto.dart';
import 'package:fastfood_inteligente_flutter/src/chapas/dominio/objetosdevalor/solicitacoes/solicitacao.cancelamento.pedido.objeto.dart';

abstract class ConfiguracoesChapaEventos {}

class BuscarTodasChapasEventoConfiguracoesEventos
    implements ConfiguracoesChapaEventos {}

class AdicionarChapaConfiguracoesEventos implements ConfiguracoesChapaEventos {
  final ChapaEntidade chapa;

  AdicionarChapaConfiguracoesEventos(this.chapa);
}

class DeletarChapaConfiguracoesEventos implements ConfiguracoesChapaEventos {
  final ChapaEntidade chapa;

  DeletarChapaConfiguracoesEventos(this.chapa);
}

class AtualizarValoresChapaConfiguracoesEventos
    implements ConfiguracoesChapaEventos {
  final ChapaEntidade chapa;

  AtualizarValoresChapaConfiguracoesEventos(this.chapa);
}

class ResetarTodosPedidosEventoConfiguracoesEventos
    implements ConfiguracoesChapaEventos {}

class MoverPedidoEntreChapasEventoConfiguracoesEventos
    implements ConfiguracoesChapaEventos {
  final Ordem ordem;
  final ChapaEntidade chapaAtual;
  final ChapaEntidade chapaDestino;

  MoverPedidoEntreChapasEventoConfiguracoesEventos(
      this.ordem, this.chapaAtual, this.chapaDestino);
}

class VigiarChapaEventoConfiguracoesEventos
    implements ConfiguracoesChapaEventos {
  final int numerodachapa;

  VigiarChapaEventoConfiguracoesEventos(this.numerodachapa);
}

class RemoverSolicitacaoCancelamentoPedidoEventoConfiguracoesEventos
    implements ConfiguracoesChapaEventos {
  final SolicitacaoCancelamentoPedidoObjeto solicitacao;

  RemoverSolicitacaoCancelamentoPedidoEventoConfiguracoesEventos(
      this.solicitacao);
}
