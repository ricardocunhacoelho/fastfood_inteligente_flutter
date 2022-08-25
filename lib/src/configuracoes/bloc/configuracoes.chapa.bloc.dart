import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:fastfood_inteligente_flutter/src/chapas/dominio/casodeuso/adicionarchapa.casodeuso.dart';
import 'package:fastfood_inteligente_flutter/src/chapas/dominio/casodeuso/atualizarvaloreschapa.casodeuso.dart';
import 'package:fastfood_inteligente_flutter/src/chapas/dominio/casodeuso/buscartodaschapas.casodeuso.dart';
import 'package:fastfood_inteligente_flutter/src/chapas/dominio/casodeuso/deletarchapa.casodeuso.dart';
import 'package:fastfood_inteligente_flutter/src/chapas/dominio/casodeuso/mover.pedido.entre.chapas.casodeuso.dart';
import 'package:fastfood_inteligente_flutter/src/chapas/dominio/casodeuso/remover.solicitacao.cancelamento.pedido.usecase.dart';
import 'package:fastfood_inteligente_flutter/src/chapas/dominio/casodeuso/resetar.todos.pedidos.casodeuso.dart';
import 'package:fastfood_inteligente_flutter/src/chapas/dominio/casodeuso/vigiar.chapa.casodeuso.dart';
import 'package:fastfood_inteligente_flutter/src/chapas/dominio/entidade/chapa.entidade.dart';
import 'package:fastfood_inteligente_flutter/src/configuracoes/estados/configuracoes.chapa.estados.dart';
import 'package:fastfood_inteligente_flutter/src/configuracoes/eventos/configuracoes.chapa.eventos.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ConfiguracoesChapaBloc
    extends Bloc<ConfiguracoesChapaEventos, ConfiguracoesChapaEstados> {
  final IBuscarTodasChapas buscarTodasChapasUsecase;
  final IAtualizarValoresChapa atualizarValoresChapaUseCase;
  final IDeletarChapa deletarChapaUseCase;
  final IAdicionarChapa adicionarChapaUseCase;
  final IResetarTodosPedidos resetarTodosPedidosUsecase;
  final IMoverPedidoEntreChapas moverPedidoEntreChapasUsecase;
  final IVigiarChapa vigiarChapaUsecase;
  final IRemoverSolicitacaoCancelamentoPedido
      removerSolicitacaoCancelamentoPedidoUsecase;
  ConfiguracoesChapaBloc(
      this.buscarTodasChapasUsecase,
      this.atualizarValoresChapaUseCase,
      this.deletarChapaUseCase,
      this.adicionarChapaUseCase,
      this.resetarTodosPedidosUsecase,
      this.moverPedidoEntreChapasUsecase,
      this.vigiarChapaUsecase,
      this.removerSolicitacaoCancelamentoPedidoUsecase)
      : super(InicialConfiguracoesChapaEstados()) {
    on<BuscarTodasChapasEventoConfiguracoesEventos>(
        _buscarTodasChapasEventoConfiguracoesEventos,
        transformer: restartable());
    on<AtualizarValoresChapaConfiguracoesEventos>(
        _atualizarValoresChapaConfiguracoesEventos,
        transformer: sequential());
    on<DeletarChapaConfiguracoesEventos>(_deletarChapaConfiguracoesEventos,
        transformer: sequential());
    on<AdicionarChapaConfiguracoesEventos>(_adicionarChapaConfiguracoesEventos,
        transformer: sequential());
    on<ResetarTodosPedidosEventoConfiguracoesEventos>(
        _resetarTodosPedidosEventoConfiguracoesEventos,
        transformer: restartable());
    on<MoverPedidoEntreChapasEventoConfiguracoesEventos>(
        _moverPedidoEntreChapasEventoConfiguracoesEventos,
        transformer: sequential());
    on<VigiarChapaEventoConfiguracoesEventos>(
        _vigiarChapaEventoConfiguracoesEventos,
        transformer: restartable());
    on<RemoverSolicitacaoCancelamentoPedidoEventoConfiguracoesEventos>(
        _removerSolicitacaoCancelamentoPedidoEventoConfiguracoesEventos,
        transformer: sequential());
  }
  Future<void> _buscarTodasChapasEventoConfiguracoesEventos(
      BuscarTodasChapasEventoConfiguracoesEventos event,
      Emitter<ConfiguracoesChapaEstados> emit) async {
    emit(CarregandoConfiguracoesChapaEstados());
    await emit.forEach<List<ChapaEntidade>>(
      buscarTodasChapasUsecase.call(),
      onData: (chapas) => CompletoConfiguracoesChapaEstados(chapas),
      onError: (error, st) => ErroConfiguracoesChapaEstados(error.toString()),
    );
  }

  Future<void> _atualizarValoresChapaConfiguracoesEventos(
      AtualizarValoresChapaConfiguracoesEventos event,
      Emitter<ConfiguracoesChapaEstados> emit) async {
    await atualizarValoresChapaUseCase.call(event.chapa);
  }

  Future<void> _deletarChapaConfiguracoesEventos(
      DeletarChapaConfiguracoesEventos event,
      Emitter<ConfiguracoesChapaEstados> emit) async {
    await deletarChapaUseCase.call(event.chapa);
  }

  Future<void> _adicionarChapaConfiguracoesEventos(
      AdicionarChapaConfiguracoesEventos event,
      Emitter<ConfiguracoesChapaEstados> emit) async {
    await adicionarChapaUseCase.call(event.chapa);
  }

  Future<void> _resetarTodosPedidosEventoConfiguracoesEventos(
      ResetarTodosPedidosEventoConfiguracoesEventos event,
      Emitter<ConfiguracoesChapaEstados> emit) async {
    await resetarTodosPedidosUsecase.call();
  }

  Future<void> _moverPedidoEntreChapasEventoConfiguracoesEventos(
      MoverPedidoEntreChapasEventoConfiguracoesEventos event,
      Emitter<ConfiguracoesChapaEstados> emit) async {
    await moverPedidoEntreChapasUsecase.call(
        event.ordem, event.chapaAtual, event.chapaDestino);
  }

  Future<void> _vigiarChapaEventoConfiguracoesEventos(
      VigiarChapaEventoConfiguracoesEventos event,
      Emitter<ConfiguracoesChapaEstados> emit) async {
    emit(CarregandoConfiguracoesChapaEstados());
    await emit.forEach<ChapaEntidade>(
      vigiarChapaUsecase(event.numerodachapa),
      onData: (chapa) => VigiarChapaConfiguracoesChapaEstados(chapa),
      onError: (error, st) => ErroConfiguracoesChapaEstados(error.toString()),
    );
  }

  Future<void> _removerSolicitacaoCancelamentoPedidoEventoConfiguracoesEventos(
      RemoverSolicitacaoCancelamentoPedidoEventoConfiguracoesEventos event,
      Emitter<ConfiguracoesChapaEstados> emit) async {
    await removerSolicitacaoCancelamentoPedidoUsecase.call(event.solicitacao);
  }
}
