import 'package:fastfood_inteligente_flutter/src/configuracoes/estados/configuracoes.produto.estados.dart';
import 'package:fastfood_inteligente_flutter/src/produtos/dominio/entidade/produto.entidade.dart';

abstract class IChecarSeFoiAdicionadoProduto {
  double call(ConfiguracoesProdutoEstados produtostate);
}

class ChecarSeFoiAdicionadoProduto implements IChecarSeFoiAdicionadoProduto {
  List<ProdutoEntidade> lista = [];
  double precototal = 0.0;
  var initialValue = 0.0;
  @override
  double call(ConfiguracoesProdutoEstados produtostate) {
    if (produtostate is CarregandoConfiguracoesProdutoEstados) return 0.0;
    if (produtostate is CompletoConfiguracoesProdutoEstados)
      lista = produtostate.lista;
    var listafinal = new List<double>.generate(lista.length, (i) => i + 1);
    var i = 0;
    lista.forEach((element) {
      if (i < lista.length)
        listafinal[i] = ((element.preco * element.quantidade));
      i++;
    });
    double? sumAllElements = listafinal.fold(
        initialValue, (accumulated, element) => accumulated! + element);
    return sumAllElements!;
  }
}
