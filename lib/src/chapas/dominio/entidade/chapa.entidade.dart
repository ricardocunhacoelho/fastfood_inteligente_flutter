import 'package:fastfood_inteligente_flutter/src/chapas/dominio/objetosdevalor/ordem.objeto.dart';

class ChapaEntidade {
  final String titulo;
  final String id;
  final int numerodachapa;
  final EChapaEstado estado;
  final List<Ordem> ordens;
  ChapaEntidade({
    required this.titulo,
    required this.id,
    required this.numerodachapa,
    required this.estado,
    required this.ordens,
  });
}

enum EChapaEstado { funcionando, pausada, desligada }
