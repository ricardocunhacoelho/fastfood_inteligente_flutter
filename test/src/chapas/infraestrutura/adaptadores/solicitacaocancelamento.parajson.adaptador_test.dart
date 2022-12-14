import 'package:fastfood_inteligente_flutter/src/chapas/dominio/entidade/chapa.entidade.dart';
import 'package:fastfood_inteligente_flutter/src/chapas/dominio/objetosdevalor/ordem.objeto.dart';
import 'package:fastfood_inteligente_flutter/src/chapas/dominio/objetosdevalor/solicitacoes/solicitacao.cancelamento.pedido.objeto.dart';
import 'package:fastfood_inteligente_flutter/src/chapas/infraestrutura/adaptadores/solicitacaocancelamento.parajson.adaptador.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('deve retornar um map a partir de uma solicitação', () {
    //ordem
    final ordem = Ordem(
      id: 'id',
      observacao: 'observacao',
      posicao: 2,
      embalarParaViajem: true,
      datahora: DateTime.now(),
      produtos: [],
      estado: EOrdermEstado.aguardando,
      nomeCliente: '',
      atendente: '',
      nomeChapeiro: '',
      numeroMesa: 0,
      valorTotalPedido: 0,
    );
    //chapa
    final chapa = ChapaEntidade(
        titulo: 'titulo',
        id: 'id',
        numerodachapa: 1,
        estado: EChapaEstado.desligada,
        ordens: []);
    //solicitacaoobjeto
    final solicitacaoCancelamentoPedidoObjeto =
        SolicitacaoCancelamentoPedidoObjeto(
            indexOrdem: 1,
            id: 'id',
            motivo: 'motivo',
            posicao: 1,
            datahora: DateTime.now(),
            chapa: chapa,
            estado: ESolicitacaoCancelamentoEstado.aguardando,
            ordem: ordem);

    final adapter = SolicitacaoCancelamentoPedidoObjetoParaJson.paraMap(
        solicitacaoCancelamentoPedidoObjeto);

    print(adapter);
  });
}
