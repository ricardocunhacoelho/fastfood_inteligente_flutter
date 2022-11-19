import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:fastfood_inteligente_flutter/src/configuracoes/estados/configuracoes.mesa.estados.dart';
import 'package:fastfood_inteligente_flutter/src/configuracoes/eventos/configuracoes.mesa.eventos.dart';
import 'package:fastfood_inteligente_flutter/src/mesas/dominio/casodeuso/adicionarmesa.casodeuso.dart';
import 'package:fastfood_inteligente_flutter/src/mesas/dominio/casodeuso/buscar.todas.mesas.casodeuso.dart';
import 'package:fastfood_inteligente_flutter/src/mesas/dominio/casodeuso/removermesa.casodeuso.dart';
import 'package:fastfood_inteligente_flutter/src/mesas/dominio/entidade/mesa.entidade.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ConfiguracoesMesaBloc
    extends Bloc<ConfiguracoesMesaEventos, ConfiguracoesMesaEstados> {
  final IBuscarTodasMesas buscarTodasMesasUsecase;
  final IAdicionarMesa adicionarMesaUsecase;
  final IRemoverMesa removerMesaUsecase;

  ConfiguracoesMesaBloc(
    this.buscarTodasMesasUsecase,
    this.adicionarMesaUsecase,
    this.removerMesaUsecase,
  ) : super(InicialConfiguracoesMesaEstados()) {
    on<BuscarTodasMesasConfiguracoesEventos>(
        _buscarTodasMesasConfiguracoesEventos,
        transformer: restartable());
    on<AdicionarMesaConfiguracoesEventos>(_adicionarMesaConfiguracoesEventos,
        transformer: sequential());
    on<RemoverMesaConfiguracoesEventos>(_removerMesaConfiguracoesEventos,
        transformer: sequential());
  }
  Future<void> _buscarTodasMesasConfiguracoesEventos(
      BuscarTodasMesasConfiguracoesEventos event,
      Emitter<ConfiguracoesMesaEstados> emit) async {
    emit(CarregandoConfiguracoesMesaEstados());
    await emit.forEach<List<MesaEntidade>>(
      buscarTodasMesasUsecase.call(),
      onData: (filas) => CompletoConfiguracoesMesaEstados(filas),
      onError: (error, st) => ErroConfiguracoesMesaEstados(error.toString()),
    );
  }

  Future<void> _adicionarMesaConfiguracoesEventos(
      AdicionarMesaConfiguracoesEventos event,
      Emitter<ConfiguracoesMesaEstados> emit) async {
    await adicionarMesaUsecase.call(event.mesa);
  }

  Future<void> _removerMesaConfiguracoesEventos(
      RemoverMesaConfiguracoesEventos event,
      Emitter<ConfiguracoesMesaEstados> emit) async {
    await removerMesaUsecase.call(event.mesa);
  }
}
