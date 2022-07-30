import 'package:fastfood_inteligente_flutter/src/chapas/dominio/entidade/chapa.entidade.dart';
import 'package:fastfood_inteligente_flutter/src/chapas/dominio/irepositorio/ichapa.repositorio.dart';
import 'package:fastfood_inteligente_flutter/src/chapas/dominio/objetosdevalor/ordem.objeto.dart';
import 'package:fastfood_inteligente_flutter/src/chapas/dominio/objetosdevalor/solicitacoes/solicitacao.cancelamento.pedido.objeto.dart';
import 'package:fastfood_inteligente_flutter/src/chapas/infraestrutura/adaptadores/chapaentidadeparajson.adaptador.dart';
import 'package:fastfood_inteligente_flutter/src/chapas/infraestrutura/adaptadores/jsonparachapaentidade.adaptador.dart';
import 'package:fastfood_inteligente_flutter/src/chapas/infraestrutura/adaptadores/jsonparaordem.adaptador.dart';
import 'package:fastfood_inteligente_flutter/src/chapas/infraestrutura/adaptadores/ordemparajson.adaptador.dart';
import 'package:fastfood_inteligente_flutter/src/chapas/infraestrutura/adaptadores/solicitacaocancelamento.parajson.adaptador.dart';
import 'package:fastfood_inteligente_flutter/src/chapas/infraestrutura/fontededados/ichapa.fontededados.dart';

class ChapaRepositorio implements IChapaRepositorio {
  final IChapaFonteDeDados fontededados;

  ChapaRepositorio(this.fontededados);
  @override
  Stream<List<ChapaEntidade>> buscarTodasChapas() {
    final streammap = fontededados.buscarTodasChapas();
    return streammap.map(_convert);
  }

  List<ChapaEntidade> _convert(List<Map<dynamic, dynamic>> list) {
    return list.map(JsonParaChapa.deMap).toList();
  }

  @override
  Future<void> adicionarChapa(ChapaEntidade chapa) async {
    final map = ChapaEntidadeParaJson.paraMap(chapa);
    await fontededados.adicionarChapa(map);
  }

  @override
  Future<void> deletarChapa(ChapaEntidade chapa) async {
    final map = ChapaEntidadeParaJson.paraMap(chapa);
    await fontededados.deletarChapa(map);
  }

  @override
  Future<void> atualizarValoresChapa(ChapaEntidade chapa) async {
    final map = ChapaEntidadeParaJson.paraMap(chapa);
    await fontededados.atualizarValoresChapa(map);
  }

  @override
  Future<void> atualizarOrdensChapa(
      List<Ordem> ordens, int numeroDaChapaDeveReceberPedido) async {
    final listaMapOrdens = ordens.map((e) => OrdemParaJson.paraMap(e)).toList();
    await fontededados.atualizarOrdensChapa(
        listaMapOrdens, 'chapa${numeroDaChapaDeveReceberPedido}');
  }

  @override
  Stream<List<Ordem>> buscarOrdemBase() {
    final streammap = fontededados.buscarOrdemBase();
    return streammap.map(_convertOrdem);
  }

  List<Ordem> _convertOrdem(List<Map<dynamic, dynamic>> list) {
    return list.map(JsonParaOrders.fromMap).toList();
  }

  @override
  Future<void> atualizarOrdemBase(Ordem ordem) async {
    final map = OrdemParaJson.paraMap(ordem);
    await fontededados.atualizarOrdemBase(map);
  }

  @override
  Future<void> resetarTodosPedidos() async {
    await fontededados.resetarTodosPedidos();
  }

  @override
  Future<void> atualizarEstadoPedido(
      String estado, int indexOrdem, ChapaEntidade chapaEntidade) async {
    final mapChapaEntidade = ChapaEntidadeParaJson.paraMap(chapaEntidade);
    await fontededados.atualizarEstadoPedido(
        mapChapaEntidade, estado, indexOrdem);
  }

  @override
  Stream<ChapaEntidade> vigiarChapa(int numeroChapa) {
    final streammap = fontededados.vigiarChapa(numeroChapa);
    return streammap.map(_convertChapa);
  }

  ChapaEntidade _convertChapa(Map<dynamic, dynamic> map) {
    return JsonParaChapa.deMap(map);
  }

  @override
  Future<void> removerOrdemChapa(int numeroDaChapa, int indexOrdem) async {
    await fontededados.removerOrdemChapa('chapa${numeroDaChapa}', indexOrdem);
  }

  @override
  Future<void> adicionarSolicitacaoCancelamento(
      SolicitacaoCancelamentoPedidoObjeto
          solicitacaoCancelamentoPedidoObjeto) async {
    final map = SolicitacaoCancelamentoPedidoObjetoParaJson.paraMap(
        solicitacaoCancelamentoPedidoObjeto);
    await fontededados.adicionarSolicitacaoCancelamento(map);
  }
}
