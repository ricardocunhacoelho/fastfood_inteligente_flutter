import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:fastfood_inteligente_flutter/src/chapas/dominio/casodeuso/atualizar.estado.pedido.casodeuso.dart';
import 'package:fastfood_inteligente_flutter/src/chapas/dominio/casodeuso/remover.ordem.chapa.dart';
import 'package:fastfood_inteligente_flutter/src/chapas/dominio/casodeuso/vigiar.chapa.casodeuso.dart';
import 'package:fastfood_inteligente_flutter/src/chapas/dominio/entidade/chapa.entidade.dart';
import 'package:fastfood_inteligente_flutter/src/chapasdetrabalho/estados/selecaochapa.estados.dart';
import 'package:fastfood_inteligente_flutter/src/chapasdetrabalho/eventos/selecaochapa.eventos.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChapaDeTrabalhoBloc
    extends Bloc<ChapaDeTrabalhoEventos, ChapaDeTrabalhoEstados> {
  final IAtualizarEstadoPedido atualizarEstadoPedidoUsecase;
  final IVigiarChapa vigiarChapaUsecase;
  final IRemoverOrdemChapa removerOrdemChapaUsecase;
  ChapaDeTrabalhoBloc(this.atualizarEstadoPedidoUsecase,
      this.vigiarChapaUsecase, this.removerOrdemChapaUsecase)
      : super(InicialChapaDeTrabalhoEstados()) {
    on<AtualizarEstadoPedidoChapaDeTrabalhoEventos>(
        _atualizarEstadoPedidoChapaDeTrabalhoEventos,
        transformer: sequential());
    on<BuscarChapaDeTrabalhoEventos>(_buscarChapaDeTrabalhoEventos,
        transformer: sequential());
    on<RemoverPedidoChapaDeTrabalhoEventos>(
        _removerPedidoChapaDeTrabalhoEventos,
        transformer: sequential());
  }

  Future<void> _atualizarEstadoPedidoChapaDeTrabalhoEventos(
      AtualizarEstadoPedidoChapaDeTrabalhoEventos event,
      Emitter<ChapaDeTrabalhoEstados> emit) async {
    await atualizarEstadoPedidoUsecase.call(
        event.estado, event.indexOrdem, event.chapaEntidade);
  }

  Future<void> _buscarChapaDeTrabalhoEventos(BuscarChapaDeTrabalhoEventos event,
      Emitter<ChapaDeTrabalhoEstados> emit) async {
    emit(CarregandoChapaDeTrabalhoEstados());
    await emit.forEach<ChapaEntidade>(
      vigiarChapaUsecase.call(event.numeroChapa),
      onData: (chapa) => CompletoChapaDeTrabalhoEstados(chapa),
      onError: (error, st) => ErroChapaDeTrabalhoEstados(error.toString()),
    );
  }

  Future<void> _removerPedidoChapaDeTrabalhoEventos(
      RemoverPedidoChapaDeTrabalhoEventos event,
      Emitter<ChapaDeTrabalhoEstados> emit) async {
    await removerOrdemChapaUsecase.call(
      event.numeroDaChapa,
      event.indexOrdem,
    );
  }
}
