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
  }) : super(
            id: id,
            observacao: observacao,
            posicao: posicao,
            embalarParaViajem: embalarParaViajem,
            datahora: datahora,
            produtos: produtos,
            estado: estado);
  EntradaOrdemModelo copyWith(
      {String? id,
      EOrdermEstado? estado,
      String? observacao,
      bool? embalarParaViajem,
      List<ProdutoEntidade>? produtos,
      DateTime? datahora,
      int? posicao}) {
    return EntradaOrdemModelo(
      id: id ?? this.id,
      estado: estado ?? this.estado,
      observacao: observacao ?? this.observacao,
      embalarParaViajem: embalarParaViajem ?? this.embalarParaViajem,
      produtos: produtos ?? this.produtos,
      datahora: datahora ?? this.datahora,
      posicao: posicao ?? this.posicao,
    );
  }

  factory EntradaOrdemModelo.empty() => EntradaOrdemModelo(
      id: 'ordem1',
      estado: EOrdermEstado.aguardando,
      observacao: '',
      embalarParaViajem: false,
      produtos: [],
      datahora: DateTime.now(),
      posicao: 1);

  factory EntradaOrdemModelo.converter(Ordem ordem) => EntradaOrdemModelo(
      id: ordem.id,
      estado: ordem.estado,
      observacao: ordem.observacao,
      embalarParaViajem: ordem.embalarParaViajem,
      produtos: ordem.produtos,
      datahora: ordem.datahora,
      posicao: ordem.posicao);
}
