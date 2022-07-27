import 'package:fastfood_inteligente_flutter/src/configuracoes/bloc/configuracoes.produto.bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final configuracoeProdutoModulos = [
  BlocProvider<ConfiguracoesProdutoBloc>(
      create: (context) => ConfiguracoesProdutoBloc(
          context.read(), context.read(), context.read(), context.read())),
];
