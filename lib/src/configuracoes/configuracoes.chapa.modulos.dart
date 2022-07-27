import 'package:fastfood_inteligente_flutter/src/configuracoes/bloc/configuracoes.chapa.bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final configuracoesChapaModulos = [
  BlocProvider<ConfiguracoesChapaBloc>(
      create: (context) => ConfiguracoesChapaBloc(
            context.read(),
            context.read(),
            context.read(),
            context.read(),
            context.read(),
          )),
];
