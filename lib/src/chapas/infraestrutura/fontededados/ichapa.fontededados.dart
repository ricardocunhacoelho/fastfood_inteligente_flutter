import 'package:fastfood_inteligente_flutter/src/chapas/dominio/entidade/chapa.entidade.dart';
import 'package:fastfood_inteligente_flutter/src/chapas/dominio/objetosdevalor/ordem.objeto.dart';

abstract class IChapaFonteDeDados {
  Stream<List<Map>> buscarTodasChapas();

  Future<void> adicionarChapa(Map<String, dynamic> map);

  Future<void> deletarChapa(Map<String, dynamic> map);

  Future<void> atualizarValoresChapa(Map<String, dynamic> map);

  Future<void> atualizarOrdensChapa(
      List<Map<String, dynamic>> listaMapOrdens, String id);

  Stream<List<Map>> buscarOrdemBase();

  Future<void> atualizarOrdemBase(Map<String, dynamic> map);

  Future<void> resetarTodosPedidos();

  Future<void> atualizarEstadoPedido(
      Map<String, dynamic> mapChapaEntidade, String estado, int indexOrdem);

  Stream<Map> vigiarChapa(int numeroChapa);

  Future<void> removerOrdemChapa(String id, int indexOrdem);

  Future<void> adicionarSolicitacaoCancelamento(Map<String, dynamic> map);

  Stream<List<Map>> buscarTodasSolicitacoesCancelamentoPedido();

  Future<void> moverPedidoEntreChapas(Map<String, dynamic> ordem,
      Map<String, dynamic> chapaAtual, Map<String, dynamic> chapaDestino);

  Future<void> removerSolicitacaoCancelamentoPedido(
      Map<String, dynamic> mapSolicitacao);

  Future<void> pausarVoltarChapa(Map<String, dynamic> map);
}
