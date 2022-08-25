import 'package:fastfood_inteligente_flutter/src/chapas/dominio/entidade/chapa.entidade.dart';

abstract class ConfiguracoesChapaEstados {}

class InicialConfiguracoesChapaEstados implements ConfiguracoesChapaEstados {}

class CarregandoConfiguracoesChapaEstados implements ConfiguracoesChapaEstados {
}

class CompletoConfiguracoesChapaEstados implements ConfiguracoesChapaEstados {
  final List<ChapaEntidade> lista;

  CompletoConfiguracoesChapaEstados(this.lista);
}

class ErroConfiguracoesChapaEstados implements ConfiguracoesChapaEstados {
  final String menssagem;

  ErroConfiguracoesChapaEstados(this.menssagem);
}

class VigiarChapaConfiguracoesChapaEstados
    implements ConfiguracoesChapaEstados {
  final ChapaEntidade chapa;

  VigiarChapaConfiguracoesChapaEstados(this.chapa);
}
