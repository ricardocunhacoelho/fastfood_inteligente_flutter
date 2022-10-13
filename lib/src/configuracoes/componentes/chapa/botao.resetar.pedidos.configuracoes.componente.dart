import 'package:fastfood_inteligente_flutter/src/configuracoes/bloc/configuracoes.chapa.bloc.dart';
import 'package:fastfood_inteligente_flutter/src/configuracoes/eventos/configuracoes.chapa.eventos.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Widget botaoResetarPedidos(BuildContext context) => Center(
      child: Container(
          color: Colors.black38,
          width: 200,
          height: 50,
          child: TextButton(
              onPressed: () {
                context
                    .read<ConfiguracoesChapaBloc>()
                    .add(ResetarTodosPedidosEventoConfiguracoesEventos());
              },
              child: const Text('RESETAR PEDIDOS'))),
    );
