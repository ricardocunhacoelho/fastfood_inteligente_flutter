import 'package:fastfood_inteligente_flutter/src/pedidos/novopedido/componentes/selecionarmesa.componente.dart';
import 'package:fastfood_inteligente_flutter/src/pedidos/novopedido/controle/pedidos.controle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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

  late final controlePedidos = PedidosControle(() {
    setState(() {});
    });
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
        body: PageView(
      physics: NeverScrollableScrollPhysics(),
      controller: controlePedidos.controller,
      onPageChanged: (index) {
        print('Page ${index + 1}');
      },
      children: [
        IniciarNovoPedido(clique: controlePedidos.adiantarPagina),
        SelecionarMesa(),
        Container(
          color: Colors.blue,
          child: TextButton(
            onPressed: (() {
              controlePedidos.controller.previousPage(
                  duration: Duration(seconds: 1), curve: Curves.easeInOut);
            }),
            child: Text(
              'Pagina3',
              style: TextStyle(fontSize: 35),
            ),
          ),
        ),
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
