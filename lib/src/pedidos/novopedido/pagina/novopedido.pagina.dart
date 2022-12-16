import 'package:fastfood_inteligente_flutter/src/pedidos/novopedido/componentes/selecionarcomanda.componente.dart';
import 'package:fastfood_inteligente_flutter/src/pedidos/novopedido/componentes/selecionarmesa.componente.dart';
import 'package:fastfood_inteligente_flutter/src/pedidos/novopedido/controle/pedidos.controle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../configuracoes/bloc/configuracoes.mesa.bloc.dart';
import '../../../configuracoes/estados/configuracoes.mesa.estados.dart';
import '../../../configuracoes/eventos/configuracoes.mesa.eventos.dart';
import '../componentes/iniciarnovopedido.componente.dart';
import '../componentes/item.mesa.componente.dart';

class NovoPedidoPagina extends StatefulWidget {
  const NovoPedidoPagina({Key? key}) : super(key: key);

  @override
  State<NovoPedidoPagina> createState() => _NovoPedidoPaginaState();
}

class _NovoPedidoPaginaState extends State<NovoPedidoPagina>
    with CompleteStateMixin {
  @override
  void completeState() {
    context
        .read<ConfiguracoesMesaBloc>()
        .add(BuscarTodasMesasConfiguracoesEventos());
  }

  final controlePedidos = PedidosControle();
  @override
  void dispose() {
    controlePedidos.controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mesabloc = context.watch<ConfiguracoesMesaBloc>();
    final mesastate = mesabloc.state;

    return Scaffold(
        body: Column(
      children: [
        Expanded(
          child: PageView(
            physics: NeverScrollableScrollPhysics(),
            controller: controlePedidos.controller,
            onPageChanged: (index) {
              print('Page ${index + 1}');
            },
            children: [
              IniciarNovoPedido(clique: controlePedidos.adiantarPagina),
              SelecionarMesa(clique: controlePedidos.adiantarPagina),
              SelecionarComanda(clique: controlePedidos.adiantarPagina),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(35),
          child: SmoothPageIndicator(
              controller: controlePedidos.controller, // PageController
              count: 3,
              effect: const ExpandingDotsEffect(
                  spacing: 8,
                  dotWidth: 20.0,
                  dotHeight: 20,
                  dotColor: Colors.grey,
                  activeDotColor: Colors.orangeAccent), // your preferred effect
              onDotClicked: (index) {}),
        )
      ],
    ));
  }
}

mixin CompleteStateMixin<T extends StatefulWidget> on State<T> {
  void completeState();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context
          .read<ConfiguracoesMesaBloc>()
          .add(BuscarTodasMesasConfiguracoesEventos());

      completeState();
    });
  }
}
