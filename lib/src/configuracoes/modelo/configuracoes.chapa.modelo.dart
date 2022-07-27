import 'package:fastfood_inteligente_flutter/src/chapas/dominio/entidade/chapa.entidade.dart';
import 'package:fastfood_inteligente_flutter/src/chapas/dominio/objetosdevalor/ordem.objeto.dart';

class ConfiguracoesChapaModelo extends ChapaEntidade {
  ConfiguracoesChapaModelo({
    required String titulo,
    required String id,
    required int numerodachapa,
    required EChapaEstado estado,
    required List<Ordem> ordens,
  }) : super(
          id: id,
          numerodachapa: numerodachapa,
          titulo: titulo,
          estado: estado,
          ordens: ordens,
        );
  ConfiguracoesChapaModelo copyWith(
      {String? id,
      List<Ordem>? ordens,
      String? titulo,
      EChapaEstado? estado,
      int? numerodachapa}) {
    return ConfiguracoesChapaModelo(
      id: id ?? this.id,
      titulo: titulo ?? this.titulo,
      estado: estado ?? this.estado,
      numerodachapa: numerodachapa ?? this.numerodachapa,
      ordens: ordens ?? this.ordens,
    );
  }

  factory ConfiguracoesChapaModelo.empty() => ConfiguracoesChapaModelo(
        id: '',
        estado: EChapaEstado.desligada,
        titulo: '',
        numerodachapa: 1,
        ordens: [],
      );

  factory ConfiguracoesChapaModelo.converter(ChapaEntidade chapa) =>
      ConfiguracoesChapaModelo(
        id: chapa.id,
        titulo: chapa.titulo,
        numerodachapa: chapa.numerodachapa,
        estado: chapa.estado,
        ordens: chapa.ordens,
      );
}
