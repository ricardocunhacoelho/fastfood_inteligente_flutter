import 'package:fastfood_inteligente_flutter/src/login/bloc/login.bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final loginModulo = [
  BlocProvider<LoginBloc>(
      create: (context) => LoginBloc(
         context.read(), context.read())),
];
