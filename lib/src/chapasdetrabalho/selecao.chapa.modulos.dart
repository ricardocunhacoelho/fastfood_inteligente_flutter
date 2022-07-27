import 'package:fastfood_inteligente_flutter/src/chapasdetrabalho/bloc/chapadetrabalho.bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final ChapaDeTrabalhoModulos = [
  BlocProvider<ChapaDeTrabalhoBloc>(
      create: (context) =>
          ChapaDeTrabalhoBloc(context.read(), context.read(), context.read())),
];
