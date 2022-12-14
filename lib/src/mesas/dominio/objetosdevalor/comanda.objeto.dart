import 'package:fastfood_inteligente_flutter/src/chapas/dominio/objetosdevalor/ordem.objeto.dart';
import 'package:fastfood_inteligente_flutter/src/mesas/dominio/objetosdevalor/conta.objeto.dart';

class Comanda {
  final String nomeCliente;
  final int numeroMesa;
  final List<Ordem> pedidos;
  final Conta contaPg;
  Comanda({
    required this.nomeCliente,
    required this.numeroMesa,
    required this.pedidos,
    required this.contaPg,
  });
}