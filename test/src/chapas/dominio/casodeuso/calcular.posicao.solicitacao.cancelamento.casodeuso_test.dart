import 'package:fastfood_inteligente_flutter/src/chapas/dominio/casodeuso/calcular.posicao.solicitacao.cancelamento.casodeuso.dart';
import 'package:fastfood_inteligente_flutter/src/chapasdetrabalho/modelos/chapadetrabalho.solicitacoes.modelo.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('deve calcular a proxima posicao solicitacao cancelament', () {
    var todasSolicitacoesCancelamento = [
      ChapasDeTrabalhoSolicitacoesModelo.empty(),
    ];
    final ICalcularPosicaoCancelamento calculoPosicaoSolicitacaoUsecase =
        CalcularPosicaoCancelamento();
    var _calculoPosicaoSolicitacao =
        calculoPosicaoSolicitacaoUsecase.call(todasSolicitacoesCancelamento) +
            1;

    print(_calculoPosicaoSolicitacao);
  });
}
