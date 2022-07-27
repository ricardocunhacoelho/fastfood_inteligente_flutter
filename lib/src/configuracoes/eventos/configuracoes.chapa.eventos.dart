import 'package:fastfood_inteligente_flutter/src/chapas/dominio/entidade/chapa.entidade.dart';

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
