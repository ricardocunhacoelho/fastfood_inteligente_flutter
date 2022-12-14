import 'package:fastfood_inteligente_flutter/src/mesas/dominio/entidade/mesa.entidade.dart';
import 'package:fastfood_inteligente_flutter/src/mesas/dominio/objetosdevalor/comanda.objeto.dart';

class MesaModelo extends MesaEntidade {
  MesaModelo({
    required int numero,
    required List<Comanda> comandas,
  }) : super(
          numero: numero,
          comandas: comandas,
        );
  MesaModelo copyWith({
    int? numero,
    List<Comanda>? comandas,
  }) {
    return MesaModelo(
      numero: numero ?? this.numero,
      comandas: comandas ?? this.comandas,
    );
  }

  factory MesaModelo.empty() => MesaModelo(
      numero: 0,
      comandas: [],
      );

  factory MesaModelo.converterEntidadeParaModelo(MesaEntidade mesa) => MesaModelo(
      numero: mesa.numero,
      comandas: mesa.comandas,
      );

  static MesaEntidade modeloParaEntidade(MesaModelo mesa) {
    return MesaEntidade(
        numero: mesa.numero,
        comandas: mesa.comandas,
        );
  }
}
