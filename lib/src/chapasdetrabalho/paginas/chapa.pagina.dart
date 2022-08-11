import 'package:fastfood_inteligente_flutter/src/chapas/dominio/entidade/chapa.entidade.dart';
import 'package:fastfood_inteligente_flutter/src/chapas/dominio/objetosdevalor/ordem.objeto.dart';
import 'package:fastfood_inteligente_flutter/src/chapasdetrabalho/bloc/chapadetrabalho.bloc.dart';
import 'package:fastfood_inteligente_flutter/src/chapasdetrabalho/estados/selecaochapa.estados.dart';
import 'package:fastfood_inteligente_flutter/src/chapasdetrabalho/eventos/selecaochapa.eventos.dart';
import 'package:fastfood_inteligente_flutter/src/chapasdetrabalho/paginas/componentes/listapedidos.componente.dart';
import 'package:fastfood_inteligente_flutter/src/configuracoes/bloc/configuracoes.chapa.bloc.dart';
import 'package:fastfood_inteligente_flutter/src/configuracoes/bloc/configuracoes.produto.bloc.dart';
import 'package:fastfood_inteligente_flutter/src/configuracoes/componentes/chapa/adicionar.chapa.dialog.componente.dart';
import 'package:fastfood_inteligente_flutter/src/configuracoes/componentes/chapa/deletar.chapa.dialog.componente.dart';
import 'package:fastfood_inteligente_flutter/src/configuracoes/componentes/chapa/editar.chapa.dialog.componente.dart';
import 'package:fastfood_inteligente_flutter/src/configuracoes/componentes/chapa/ligadeslig.chapa.botao.componente.dart';
import 'package:fastfood_inteligente_flutter/src/configuracoes/componentes/produto/adicionar.produto.dialog.componente.dart';
import 'package:fastfood_inteligente_flutter/src/configuracoes/componentes/produto/deletar.produto.dialog.componente.dart';
import 'package:fastfood_inteligente_flutter/src/configuracoes/componentes/produto/editar.produto.dialog.componente.dart';
import 'package:fastfood_inteligente_flutter/src/configuracoes/estados/configuracoes.chapa.estados.dart';
import 'package:fastfood_inteligente_flutter/src/configuracoes/estados/configuracoes.produto.estados.dart';
import 'package:fastfood_inteligente_flutter/src/configuracoes/eventos/configuracoes.chapa.eventos.dart';
import 'package:fastfood_inteligente_flutter/src/configuracoes/eventos/configuracoes.produto.eventos.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Argumentos {
  int numeroDaChapa = 0;

  Argumentos(this.numeroDaChapa);
}

class ChapaPagina extends StatefulWidget {
  static const routeName = 'ChapaPagina';
  const ChapaPagina({Key? key}) : super(key: key);

  @override
  State<ChapaPagina> createState() => _ChapaPaginaState();
}

class _ChapaPaginaState extends State<ChapaPagina> with CompleteStateMixin {
  @override
  void completeState() {
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

  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    final argumentos = ModalRoute.of(context)!.settings.arguments as Argumentos;
    final produtobloc = context.watch<ConfiguracoesProdutoBloc>();
    final produtostate = produtobloc.state;
    final chapabloc = context.watch<ConfiguracoesChapaBloc>();
    final chapastate = chapabloc.state;
    final chapaTrabalhoBloc = context.watch<ChapaDeTrabalhoBloc>();
    final chapaTrabalhoEstado = chapaTrabalhoBloc.state;
    int numeroDaChapa = argumentos.numeroDaChapa;
    String titulo = 'Carregando...';
    var chapa = ChapaEntidade(
        estado: EChapaEstado.desligada,
        id: '',
        numerodachapa: 0,
        ordens: [],
        titulo: '');
    if (chapastate is CompletoConfiguracoesChapaEstados) {
      chapastate.lista.forEach((element) {
        if (element.numerodachapa == numeroDaChapa) {
          chapa = element;
        }
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Text('Chapa:'),
              SizedBox(
                height: 10,
              ),
              Text('${chapa.titulo}')
            ],
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                Text('Pausar :'),
                SizedBox(width: 10),
                IconButton(
                    onPressed: () {}, icon: Icon(Icons.lock_clock_sharp)),
              ],
            ),
          ),
        ],
        toolbarHeight: 120,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (chapastate is CarregandoConfiguracoesChapaEstados)
                const Center(child: CircularProgressIndicator()),
              if (chapastate is CompletoConfiguracoesChapaEstados)
                const SizedBox(height: 30),
              const Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  'ATENDENDO',
                  style: TextStyle(
                    fontSize: 17,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              if (chapastate is CarregandoConfiguracoesChapaEstados)
                const CircularProgressIndicator(),
              if (chapastate is CompletoConfiguracoesChapaEstados)
                ListaPedidosComponente(numeroDaChapa, EOrdermEstado.atendendo),
              const SizedBox(height: 30),
              const Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  'AGUARDANDO',
                  style: TextStyle(
                    fontSize: 17,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              if (chapastate is CarregandoConfiguracoesChapaEstados)
                const CircularProgressIndicator(),
              if (chapastate is CompletoConfiguracoesChapaEstados)
                ListaPedidosComponente(numeroDaChapa, EOrdermEstado.aguardando),
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
    WidgetsBinding.instance?.addPostFrameCallback((_) {
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
