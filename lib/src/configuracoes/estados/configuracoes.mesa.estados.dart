import 'package:fastfood_inteligente_flutter/src/mesas/dominio/entidade/mesa.entidade.dart';

abstract class ConfiguracoesMesaEstados {}

class InicialConfiguracoesMesaEstados
    implements ConfiguracoesMesaEstados {}

class CarregandoConfiguracoesMesaEstados
    implements ConfiguracoesMesaEstados {}

class CompletoConfiguracoesMesaEstados
    implements ConfiguracoesMesaEstados {
  final List<MesaEntidade> lista;

  CompletoConfiguracoesMesaEstados(this.lista);
}

class ErroConfiguracoesMesaEstados implements ConfiguracoesMesaEstados {
  final String menssagem;

  ErroConfiguracoesMesaEstados(this.menssagem);
}
