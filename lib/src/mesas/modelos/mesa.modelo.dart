import 'package:fastfood_inteligente_flutter/src/mesas/dominio/entidade/mesa.entidade.dart';
import 'package:fastfood_inteligente_flutter/src/mesas/dominio/objetosdevalor/cliente.objeto.dart';
import 'package:fastfood_inteligente_flutter/src/mesas/dominio/objetosdevalor/conta.objeto.dart';

class MesaModelo extends MesaEntidade {
  MesaModelo({
    required int numero,
    required List<Cliente> clientes,
    required String atendente,
    required Conta conta,
  }) : super(
          numero: numero,
          clientes: clientes,
          atendente: atendente,
          conta: conta,
        );
  MesaModelo copyWith({
    int? numero,
    List<Cliente>? clientes,
    String? atendente,
    Conta? conta,
  }) {
    return MesaModelo(
      numero: numero ?? this.numero,
      clientes: clientes ?? this.clientes,
      atendente: atendente ?? this.atendente,
      conta: conta ?? this.conta,
    );
  }

  factory MesaModelo.empty() => MesaModelo(
      numero: 0,
      clientes: [],
      atendente: '',
      conta: Conta(produtosPagos: [], dinheiroAvulso: 0),
      );

  factory MesaModelo.converterEntidadeParaModelo(MesaEntidade mesa) => MesaModelo(
      numero: mesa.numero,
      clientes: mesa.clientes,
      atendente: mesa.atendente,
      conta: mesa.conta,
      );

  static MesaEntidade modeloParaEntidade(MesaModelo mesa) {
    return MesaEntidade(
        numero: mesa.numero,
        clientes: mesa.clientes,
        atendente: mesa.atendente,
        conta: mesa.conta,
        );
  }
}
