import 'package:fastfood_inteligente_flutter/src/login/bloc/login.bloc.dart';
import 'package:fastfood_inteligente_flutter/src/login/estados/login.estados.dart';
import 'package:fastfood_inteligente_flutter/src/recepcao/bloc/entrada.bloc.dart';
import 'package:fastfood_inteligente_flutter/src/recepcao/eventos/entrada.eventos.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../chapasdetrabalho/bloc/chapadetrabalho.bloc.dart';
import '../../chapasdetrabalho/eventos/selecaochapa.eventos.dart';
import '../../configuracoes/bloc/configuracoes.chapa.bloc.dart';
import '../../configuracoes/bloc/configuracoes.produto.bloc.dart';
import '../../configuracoes/eventos/configuracoes.chapa.eventos.dart';
import '../../configuracoes/eventos/configuracoes.produto.eventos.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with CompleteStateMixin {
  @override
  void completeState() {
    context.read<EntradaBloc>().add(BuscarOrdemBaseEntradaEventos());
    context
        .read<ConfiguracoesProdutoBloc>()
        .add(BuscarTodosProdutosEventoConfiguracoesEventos());

    context
        .read<ConfiguracoesChapaBloc>()
        .add(BuscarTodasChapasEventoConfiguracoesEventos());

    context
        .read<ChapaDeTrabalhoBloc>()
        .add(BuscarTodasSolicitacoesCancelamentoPedidoChapaDeTrabalhoEventos());
  }

  @override
  Widget build(BuildContext context) {
    final loginBloc = context.watch<LoginBloc>();
    final loginEstados = loginBloc.state;

    return Scaffold(
      appBar: AppBar(
        title: const Text('HomePage'),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Container(
                  width: 200,
                  height: 40,
                  color: Colors.white,
                  child: TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/config');
                      },
                      child: const Text('Configurações app \'gerente\'')),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: Container(
                  width: 200,
                  height: 40,
                  color: Colors.white,
                  child: TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/chapeiro');
                      },
                      child: const Text('Chapas de trabalho')),
                ),
              ),
              Center(
                child: Container(
                  width: 200,
                  height: 40,
                  color: Colors.white,
                  child: TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/registraPedidos');
                      },
                      child: const Text('Entrada Pedidos')),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: Container(
                  width: 201,
                  height: 40,
                  color: Colors.white,
                  child: TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/avocaClientes');
                      },
                      child: const Text('Chamada de pedidos tela')),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: Container(
                  width: 201,
                  height: 40,
                  color: Colors.white,
                  child: TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/caixa');
                      },
                      child: const Text('Cadastrar novos Usuários')),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: Container(
                  width: 201,
                  height: 40,
                  color: Colors.white,
                  child: TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/gerentepage');
                      },
                      child: const Text('Construção')),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

mixin CompleteStateMixin<T extends StatefulWidget> on State<T> {
  void completeState();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<EntradaBloc>().add(BuscarOrdemBaseEntradaEventos());
      context
          .read<ConfiguracoesProdutoBloc>()
          .add(BuscarTodosProdutosEventoConfiguracoesEventos());

      context
          .read<ConfiguracoesChapaBloc>()
          .add(BuscarTodasChapasEventoConfiguracoesEventos());

      context.read<ChapaDeTrabalhoBloc>().add(
          BuscarTodasSolicitacoesCancelamentoPedidoChapaDeTrabalhoEventos());

      completeState();
    });
  }
}
