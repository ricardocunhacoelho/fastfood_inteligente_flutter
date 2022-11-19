import 'package:fastfood_inteligente_flutter/src/mesas/dominio/entidade/mesa.entidade.dart';

abstract class ConfiguracoesMesaEventos {}

class BuscarTodasMesasConfiguracoesEventos
    implements ConfiguracoesMesaEventos {}

class AdicionarMesaConfiguracoesEventos
    implements ConfiguracoesMesaEventos {
  final MesaEntidade mesa;

  AdicionarMesaConfiguracoesEventos(this.mesa);
}

class RemoverMesaConfiguracoesEventos
    implements ConfiguracoesMesaEventos {
  final MesaEntidade mesa;

  RemoverMesaConfiguracoesEventos(this.mesa);
}
