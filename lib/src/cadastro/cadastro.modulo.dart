import 'package:fastfood_inteligente_flutter/src/cadastro/bloc/cadastro.bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final cadastroModulo = [
  BlocProvider<CadastroBloc>(
      create: (context) => CadastroBloc(
         context.read())),
];
