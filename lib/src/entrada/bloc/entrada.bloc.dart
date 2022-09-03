import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:fastfood_inteligente_flutter/src/chapas/dominio/casodeuso/atualizar.ordens.chapa.casodeuso.dart';
import 'package:fastfood_inteligente_flutter/src/chapas/dominio/casodeuso/atualizarordembase.casodeuso.dart';
import 'package:fastfood_inteligente_flutter/src/chapas/dominio/casodeuso/buscar.chapaentidade.na.lista.casodeuso.dart';
import 'package:fastfood_inteligente_flutter/src/chapas/dominio/casodeuso/buscarordembase.casodeuso.dart';
import 'package:fastfood_inteligente_flutter/src/chapas/dominio/casodeuso/calcular.qual.chapa.deve.recebe.o.pedido.casodeuso.dart';
import 'package:fastfood_inteligente_flutter/src/chapas/dominio/casodeuso/gerarordem.casodeuso.dart';
import 'package:fastfood_inteligente_flutter/src/chapas/dominio/casodeuso/quantia.de.ordens.em.cada.chapa.casodeuso.dart';
import 'package:fastfood_inteligente_flutter/src/chapas/dominio/casodeuso/resetar.ordembase.casodeuso.dart';
import 'package:fastfood_inteligente_flutter/src/chapas/dominio/objetosdevalor/ordem.objeto.dart';
import 'package:fastfood_inteligente_flutter/src/entrada/estados/entrada.estados.dart';
import 'package:fastfood_inteligente_flutter/src/entrada/eventos/entrada.eventos.dart';
import 'package:fastfood_inteligente_flutter/src/produtos/dominio/casodeuso/adicionarquantidade.casodeuso.dart';
import 'package:fastfood_inteligente_flutter/src/produtos/dominio/casodeuso/resetar.produtos.receberam.incremento.quantidade.casodeuso.dart';
import 'package:fastfood_inteligente_flutter/src/produtos/dominio/casodeuso/subtrairquantidade.casodeuso.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EntradaBloc extends Bloc<EntradaEventos, EntradaEstados> {
  final IBuscarOrdemBase buscarOrdemBaseUsecase;
  final IAdicionarQuantidade adicionarQuantidadeUsecase;
  final ISubtrairQuantidade subtrairQuantidadeUsecase;
  final IAtualizarOrdemBase atualizarOrdemBaseUsecase;
  final IQuantiaDeOrdensEmCadaChapa quantiaDeOrdensEmCadaChapaUsecase;
  final ICalcularQualChapaDeveReceberOPedido
      calcularQualChapaDeveReceberOPedidoUsecase;
  final IGerarOrdem gerarOrdemUsecase;
  final IAtualizarOrdensChapa atualizarOrdensChapaUsecase;
  final IBuscarChapaEntidadeNaLista buscarChapaEntidadeNaListaUsecase;
  final IResetarProdutosReceberamIncrementoQuantidade
      resetarProdutosReceberamIncrementoQuantidadeUsecase;
  final IResetarOrdemBase resetarOrdemBaseUsecase;
  EntradaBloc(
      this.buscarOrdemBaseUsecase,
      this.adicionarQuantidadeUsecase,
      this.atualizarOrdemBaseUsecase,
      this.quantiaDeOrdensEmCadaChapaUsecase,
      this.calcularQualChapaDeveReceberOPedidoUsecase,
      this.gerarOrdemUsecase,
      this.atualizarOrdensChapaUsecase,
      this.buscarChapaEntidadeNaListaUsecase,
      this.resetarProdutosReceberamIncrementoQuantidadeUsecase,
      this.subtrairQuantidadeUsecase,
      this.resetarOrdemBaseUsecase)
      : super(InicialEntradaEstados()) {
    on<AdicionarQuantidadeEntradaEventos>(_adicionarQuantidadeEntradaEventos,
        transformer: sequential());
    on<SubtrairQuantidadeEntradaEventos>(_subtrairQuantidadeEntradaEventos,
        transformer: sequential());
    on<BuscarOrdemBaseEntradaEventos>(_buscarOrdemBaseEntradaEventos,
        transformer: restartable());
    on<AtualizarOrdemBaseEntradaEventos>(_atualizarOrdemBaseEntradaEventos,
        transformer: restartable());
    on<FinalizarImprimirPedidoEntradaEventos>(
        _finalizarImprimirPedidoEntradaEventos,
        transformer: sequential());
    on<ResetarProdutosReceberamIncrementoQuantidadeEntradaEventos>(
        _resetarProdutosReceberamIncrementoQuantidadeEntradaEventos,
        transformer: restartable());
    on<ResetarOrdemBaseEntradaEventos>(_resetarOrdemBaseEntradaEventos,
        transformer: restartable());
  }

  Future<void> _adicionarQuantidadeEntradaEventos(
      AdicionarQuantidadeEntradaEventos event,
      Emitter<EntradaEstados> emit) async {
    await adicionarQuantidadeUsecase.call(event.produto);
  }

  Future<void> _subtrairQuantidadeEntradaEventos(
      SubtrairQuantidadeEntradaEventos event,
      Emitter<EntradaEstados> emit) async {
    await subtrairQuantidadeUsecase.call(event.produto);
  }

  Future<void> _buscarOrdemBaseEntradaEventos(
      BuscarOrdemBaseEntradaEventos event, Emitter<EntradaEstados> emit) async {
    emit(CarregandoOrdemBaseEstados());
    await emit.forEach<List<Ordem>>(
      buscarOrdemBaseUsecase.call(),
      onData: (filas) => CompletoOrdemBaseEstados(filas),
      onError: (error, st) => ErroOrdemBaseEntradaEstados(error.toString()),
    );
  }

  Future<void> _atualizarOrdemBaseEntradaEventos(
      AtualizarOrdemBaseEntradaEventos event,
      Emitter<EntradaEstados> emit) async {
    await atualizarOrdemBaseUsecase.call(event.ordem);
  }

  Future<void> _finalizarImprimirPedidoEntradaEventos(
      FinalizarImprimirPedidoEntradaEventos event,
      Emitter<EntradaEstados> emit) async {
    final listaQuantidadeDeOrdensNasChapas =
        quantiaDeOrdensEmCadaChapaUsecase(event.listaChapas);
    final numeroDaChapaDeveReceberOPedido =
        calcularQualChapaDeveReceberOPedidoUsecase
            .call(listaQuantidadeDeOrdensNasChapas);
    final chapaEntidadeQueDeveReceberAOrdem = buscarChapaEntidadeNaListaUsecase
        .call(event.listaChapas, numeroDaChapaDeveReceberOPedido);
    final listaOrdensQueDevemSerAdicionadas = gerarOrdemUsecase.call(
        event.observacao,
        event.embalarParaViajem,
        event.produtos,
        chapaEntidadeQueDeveReceberAOrdem,
        event.listaChapas);
    await atualizarOrdensChapaUsecase.call(
        listaOrdensQueDevemSerAdicionadas, numeroDaChapaDeveReceberOPedido);
  }

  Future<void> _resetarProdutosReceberamIncrementoQuantidadeEntradaEventos(
      ResetarProdutosReceberamIncrementoQuantidadeEntradaEventos event,
      Emitter<EntradaEstados> emit) async {
    await resetarProdutosReceberamIncrementoQuantidadeUsecase.call();
  }

  Future<void> _resetarOrdemBaseEntradaEventos(
      ResetarOrdemBaseEntradaEventos event,
      Emitter<EntradaEstados> emit) async {
    await resetarOrdemBaseUsecase.call();
  }
}
