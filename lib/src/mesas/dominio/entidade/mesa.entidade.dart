import 'package:fastfood_inteligente_flutter/src/mesas/dominio/objetosdevalor/cliente.objeto.dart';
import 'package:fastfood_inteligente_flutter/src/mesas/dominio/objetosdevalor/conta.objeto.dart';

class MesaEntidade {
  final int numero;
  final List<Cliente> clientes;
  final String atendente;
  final Conta conta;
  MesaEntidade({
    required this.numero,
    required this.clientes,
    required this.atendente,
    required this.conta,
  });
}

