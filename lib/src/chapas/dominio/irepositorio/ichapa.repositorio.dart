import 'package:fastfood_inteligente_flutter/src/chapas/dominio/entidade/chapa.entidade.dart';
import 'package:fastfood_inteligente_flutter/src/chapas/dominio/objetosdevalor/ordem.objeto.dart';
import 'package:fastfood_inteligente_flutter/src/chapas/dominio/objetosdevalor/solicitacoes/solicitacao.cancelamento.pedido.objeto.dart';

abstract class IChapaRepositorio {
  Stream<List<ChapaEntidade>> buscarTodasChapas();

  Future<void> adicionarChapa(ChapaEntidade chapa);

  Future<void> deletarChapa(ChapaEntidade chapa);

  Future<void> atualizarValoresChapa(ChapaEntidade chapa);

  Future<void> atualizarOrdensChapa(
      List<Ordem> ordens, int numeroDaChapaDeveReceberPedido);

  Stream<List<Ordem>> buscarOrdemBase();

  Future<void> atualizarOrdemBase(Ordem ordem);

  Future<void> resetarTodosPedidos();

  Future<void> atualizarEstadoPedido(
      String estado, int indexOrdem, ChapaEntidade chapaEntidade);

  Stream<ChapaEntidade> vigiarChapa(int numeroChapa);

  removerOrdemChapa(int numeroDaChapa, int indexOrdem) {}

  Future<void> adicionarSolicitacaoCancelamento(
      SolicitacaoCancelamentoPedidoObjeto solicitacaoCancelamentoPedidoObjeto);
}
