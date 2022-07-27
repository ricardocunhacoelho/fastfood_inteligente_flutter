import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:fastfood_inteligente_flutter/src/configuracoes/estados/configuracoes.produto.estados.dart';
import 'package:fastfood_inteligente_flutter/src/configuracoes/eventos/configuracoes.produto.eventos.dart';
import 'package:fastfood_inteligente_flutter/src/produtos/dominio/casodeuso/adicionar.produto.casodeuso.dart';
import 'package:fastfood_inteligente_flutter/src/produtos/dominio/casodeuso/buscartodosprodutos.casodeuso.dart';
import 'package:fastfood_inteligente_flutter/src/produtos/dominio/casodeuso/deletar.produto.casodeuso.dart';
import 'package:fastfood_inteligente_flutter/src/produtos/dominio/casodeuso/editar.produto.casodeuso.dart';
import 'package:fastfood_inteligente_flutter/src/produtos/dominio/entidade/produto.entidade.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ConfiguracoesProdutoBloc
    extends Bloc<ConfiguracoesProdutoEventos, ConfiguracoesProdutoEstados> {
  final IBuscarTodosProdutos buscarTodosProdutosUsecase;
  final IAdicionarProduto adicionarProdutoUsecase;
  final IDeletarProduto deletarProdutoUsecase;
  final IEditarProduto editarProdutoUsecase;
  ConfiguracoesProdutoBloc(
      this.buscarTodosProdutosUsecase,
      this.adicionarProdutoUsecase,
      this.deletarProdutoUsecase,
      this.editarProdutoUsecase)
      : super(InicialConfiguracoesProdutoEstados()) {
    on<BuscarTodosProdutosEventoConfiguracoesEventos>(
        _buscarTodosProdutosEventoConfiguracoesEventos,
        transformer: restartable());
    on<AdicionarProdutoConfiguracoesEventos>(
        _adicionarProdutoConfiguracoesEventos,
        transformer: restartable());
    on<DeletarProdutoConfiguracoesEventos>(_deletarProdutoConfiguracoesEventos,
        transformer: sequential());
    on<EditarProdutoConfiguracoesEventos>(_editarProdutoConfiguracoesEventos,
        transformer: sequential());
  }
  Future<void> _buscarTodosProdutosEventoConfiguracoesEventos(
      BuscarTodosProdutosEventoConfiguracoesEventos event,
      Emitter<ConfiguracoesProdutoEstados> emit) async {
    emit(CarregandoConfiguracoesProdutoEstados());
    await emit.forEach<List<ProdutoEntidade>>(
      buscarTodosProdutosUsecase.call(),
      onData: (filas) => CompletoConfiguracoesProdutoEstados(filas),
      onError: (error, st) => ErroConfiguracoesProdutoEstados(error.toString()),
    );
  }

  Future<void> _adicionarProdutoConfiguracoesEventos(
      AdicionarProdutoConfiguracoesEventos event,
      Emitter<ConfiguracoesProdutoEstados> emit) async {
    await adicionarProdutoUsecase.call(event.produto);
  }

  Future<void> _deletarProdutoConfiguracoesEventos(
      DeletarProdutoConfiguracoesEventos event,
      Emitter<ConfiguracoesProdutoEstados> emit) async {
    await deletarProdutoUsecase.call(event.produto);
  }

  Future<void> _editarProdutoConfiguracoesEventos(
      EditarProdutoConfiguracoesEventos event,
      Emitter<ConfiguracoesProdutoEstados> emit) async {
    await editarProdutoUsecase.call(event.produto);
  }
}
