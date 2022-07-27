import 'package:fastfood_inteligente_flutter/src/produtos/dominio/casodeuso/buscartodosdocumentos.produto.casodeuso.dart';
import 'package:fastfood_inteligente_flutter/src/produtos/infraestrutura/adaptadores/json.to.produtoentity.dart';

abstract class ICalcularPrecoPedido {
  Future<double> call();
}

class CalcularPrecoPedido implements ICalcularPrecoPedido {
  final IBuscarTodosDocumentosProdutos documentoProdutos;
  late List<double> todosOsValoresSomar;
  var valorInicial = 0.0;

  CalcularPrecoPedido(this.documentoProdutos);
  @override
  Future<double> call() async {
    final produtosDoc = await documentoProdutos.call();
    var produtos = produtosDoc.map((e) => e.data()).toList();
    var produtosEntidade =
        produtos.map((e) => JsonToProdutoEntity.fromMap(e)).toList();
    produtosEntidade.forEach((element) {
      todosOsValoresSomar.add((element.preco * element.quantidade));
    });
    return todosOsValoresSomar.fold(valorInicial,
        (valorAnterior, element) async => await valorAnterior + element);
  }
}
