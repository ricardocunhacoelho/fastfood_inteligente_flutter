import 'package:fastfood_inteligente_flutter/src/chapas/dominio/entidade/chapa.entidade.dart';
import 'package:fastfood_inteligente_flutter/src/chapas/dominio/objetosdevalor/ordem.objeto.dart';
import 'package:fastfood_inteligente_flutter/src/produtos/dominio/entidade/produto.entidade.dart';

abstract class IGerarOrdem {
  List<Ordem> call(
      String observacao,
      bool embalarParaViajem,
      List<ProdutoEntidade> produtos,
      ChapaEntidade chapaEntidade,
      List<ChapaEntidade> listaChapas);
}

class GerarOrdem implements IGerarOrdem {
  var initialValue = 0;
  @override
  List<Ordem> call(
      String observacao,
      bool embalarParaViajem,
      List<ProdutoEntidade> produtos,
      ChapaEntidade chapaEntidade,
      List<ChapaEntidade> listaChapas) {
    var listaler = listaChapas;
    var listaAdd = [];
    listaler.forEach((element) {
      listaAdd.add(element.ordens.length);
    });

    var sumAllElements = listaAdd.fold(initialValue,
        (dynamic accumulated, dynamic element) => accumulated + element);

    final totalOrdensTodasChapas = sumAllElements;
    final totalOrdensChapaEntidade = chapaEntidade.ordens.length;
    final List<Ordem> ordens = [...chapaEntidade.ordens];
    final Ordem ordem = Ordem(
        produtos: produtos,
        embalarParaViajem: embalarParaViajem,
        observacao: observacao,
        id: _generateId(totalOrdensTodasChapas + 1),
        estado: EOrdermEstado.aguardando,
        posicao: totalOrdensTodasChapas + 1,
        datahora: DateTime.now());
    ordens.add(ordem);
    return ordens;
  }

  String _generateId(int id) {
    return id.toString().padLeft(3, '0');
  }
}
