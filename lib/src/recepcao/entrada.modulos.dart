import 'package:fastfood_inteligente_flutter/src/recepcao/bloc/entrada.bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final entradaModulos = [
  BlocProvider<EntradaBloc>(
      create: (context) => EntradaBloc(
          context.read(),
          context.read(),
          context.read(),
          context.read(),
          context.read(),
          context.read(),
          context.read(),
          context.read(),
          context.read(),
          context.read(),
          context.read())),
];
