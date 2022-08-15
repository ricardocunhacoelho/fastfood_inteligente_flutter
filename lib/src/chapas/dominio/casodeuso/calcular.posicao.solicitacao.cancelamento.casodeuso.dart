import 'package:fastfood_inteligente_flutter/src/chapas/dominio/objetosdevalor/solicitacoes/solicitacao.cancelamento.pedido.objeto.dart';

abstract class ICalcularPosicaoCancelamento {
  int call(List<SolicitacaoCancelamentoPedidoObjeto> solicitacoes);
}

class CalcularPosicaoCancelamento implements ICalcularPosicaoCancelamento {
  final listaTodasAsPosicoesDasSolicitacoes = [];
  int valor = 0;
  @override
  int call(List<SolicitacaoCancelamentoPedidoObjeto> solicitacoes) {
    if (solicitacoes.length != 0) {
      solicitacoes.forEach((element) {
        listaTodasAsPosicoesDasSolicitacoes.add(element.posicao);
        listaTodasAsPosicoesDasSolicitacoes.sort();
        valor = listaTodasAsPosicoesDasSolicitacoes.last;
      });
    } else {
      valor = 0;
    }
    return valor;
  }
}
