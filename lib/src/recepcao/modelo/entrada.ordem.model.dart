import 'package:fastfood_inteligente_flutter/src/chapas/dominio/objetosdevalor/ordem.objeto.dart';
import 'package:fastfood_inteligente_flutter/src/produtos/dominio/entidade/produto.entidade.dart';

class EntradaOrdemModelo extends Ordem {
  EntradaOrdemModelo({
    required String id,
    required String observacao,
    required int posicao,
    required bool embalarParaViajem,
    required DateTime datahora,
    required List<ProdutoEntidade> produtos,
    required EOrdermEstado estado,
    required String nomeCliente,
    required String atendente,
    required String nomeChapeiro,
    required int numeroMesa,
    required double valorTotalPedido,
  }) : super(
          id: id,
          observacao: observacao,
          posicao: posicao,
          embalarParaViajem: embalarParaViajem,
          datahora: datahora,
          produtos: produtos,
          estado: estado,
          nomeCliente: nomeCliente,
          atendente: atendente,
          nomeChapeiro: nomeChapeiro,
          numeroMesa: numeroMesa,
          valorTotalPedido: valorTotalPedido,
        );
  EntradaOrdemModelo copyWith({
    String? id,
    EOrdermEstado? estado,
    String? observacao,
    bool? embalarParaViajem,
    List<ProdutoEntidade>? produtos,
    DateTime? datahora,
    int? posicao,
    String? nomeCliente,
    String? atendente,
    String? nomeChapeiro,
    int? numeroMesa,
    double? valorTotalPedido,
  }) {
    return EntradaOrdemModelo(
      id: id ?? this.id,
      estado: estado ?? this.estado,
      observacao: observacao ?? this.observacao,
      embalarParaViajem: embalarParaViajem ?? this.embalarParaViajem,
      produtos: produtos ?? this.produtos,
      datahora: datahora ?? this.datahora,
      posicao: posicao ?? this.posicao,
      nomeCliente: nomeCliente ?? this.nomeCliente,
      atendente: atendente ?? this.atendente,
      nomeChapeiro: nomeChapeiro ?? this.nomeChapeiro,
      numeroMesa: numeroMesa ?? this.numeroMesa,
      valorTotalPedido: valorTotalPedido ?? this.valorTotalPedido,
    );
  }

  factory EntradaOrdemModelo.empty() => EntradaOrdemModelo(
        id: 'ordem1',
        estado: EOrdermEstado.aguardando,
        observacao: '',
        embalarParaViajem: false,
        produtos: [],
        datahora: DateTime.now(),
        posicao: 1,
        nomeCliente: '',
        atendente: '',
        nomeChapeiro: '',
        numeroMesa: 0,
        valorTotalPedido: 0,
      );

  factory EntradaOrdemModelo.converter(Ordem ordem) => EntradaOrdemModelo(
        id: ordem.id,
        estado: ordem.estado,
        observacao: ordem.observacao,
        embalarParaViajem: ordem.embalarParaViajem,
        produtos: ordem.produtos,
        datahora: ordem.datahora,
        posicao: ordem.posicao,
        nomeCliente: ordem.nomeCliente,
        atendente: ordem.atendente,
        nomeChapeiro: ordem.nomeChapeiro,
        numeroMesa: ordem.numeroMesa,
        valorTotalPedido: ordem.valorTotalPedido,
      );
}
