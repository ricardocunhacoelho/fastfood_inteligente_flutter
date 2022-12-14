import 'package:fastfood_inteligente_flutter/src/mesas/dominio/objetosdevalor/comanda.objeto.dart';

class MesaEntidade {
  final int numero;
  final List<Comanda> comandas;
  MesaEntidade({
    required this.numero,
    required this.comandas,
  });
}

