import 'package:fastfood_inteligente_flutter/src/chapas/dominio/objetosdevalor/ordem.objeto.dart';
import 'package:fastfood_inteligente_flutter/src/produtos/dominio/entidade/produto.entidade.dart';
import 'package:fastfood_inteligente_flutter/src/produtos/modelos/produto.modelo.dart';

class RecepcaoControle {
  bool? valueByKey(String id, List<ProdutoEntidade> produtos) {
    for (final entry in produtos) {
      if (entry.id.contains(id)) return true;
    }
  }

  void deletValue(
      String id, List<dynamic> toRemove, List<ProdutoEntidade> produtos) {
    if (valueByKey(id, produtos) == true) {
      for (final entry in produtos) {
        if (entry.id.contains(id)) toRemove.add(entry);
      }
      produtos.removeWhere((e) => toRemove.contains(e));
    }
  }

  void changeValue(List<dynamic> toChange, String id, int quantidade,
      List<ProdutoModelo> listProdutsModel) {
    if (valueByKey(id, listProdutsModel) == true) {
      for (final entry in listProdutsModel) {
        if (entry.id.contains(id)) toChange.add(entry);
      }
      var indice = listProdutsModel.indexWhere((e) => toChange.contains(e));
      listProdutsModel[indice] =
          listProdutsModel[indice].copyWith(quantidade: quantidade);
    }
  }

  int indexOfValue(
      List<dynamic> toChange, String id, List<ProdutoModelo> listProdutsModel) {
    for (final entry in listProdutsModel) {
      if (entry.id.contains(id)) toChange.add(entry);
    }
    return listProdutsModel.indexWhere((e) => toChange.contains(e));
  }

  double? sumValues(
      List<ProdutoEntidade> listProdutoEntidade, List<double> valores) {
    double initialValue = 0;
    for (final entry in listProdutoEntidade) {
      valores.add(entry.preco * entry.quantidade);
    }
    return valores.fold(
        initialValue, (accumulated, element) => accumulated! + element);
  }

  Ordem criarOrdem(List<ProdutoEntidade> listProdutoEntidade) {
    return Ordem(
      produtos: listProdutoEntidade,
      embalarParaViajem: false,
      estado: EOrdermEstado.aguardando,
      id: 'ordem1',
      datahora: DateTime.now(),
      observacao: '',
      posicao: 1,
      nomeCliente: '',
      atendente: '',
      nomeChapeiro: '',
      numeroMesa: 0,
      valorTotalPedido: 0,
    );
  }
}
