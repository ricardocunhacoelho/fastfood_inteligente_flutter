import 'package:fastfood_inteligente_flutter/src/configuracoes/bloc/configuracoes.mesa.bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final configuracoeMesaModulos = [
  BlocProvider<ConfiguracoesMesaBloc>(
      create: (context) => ConfiguracoesMesaBloc(
          context.read(), context.read(), context.read())),
];
