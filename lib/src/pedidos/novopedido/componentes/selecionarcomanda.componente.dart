import 'package:fastfood_inteligente_flutter/src/pedidos/novopedido/componentes/item.mesa.componente.dart';
import 'package:fastfood_inteligente_flutter/src/pedidos/novopedido/controle/pedidos.controle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../configuracoes/bloc/configuracoes.mesa.bloc.dart';
import '../../../configuracoes/estados/configuracoes.mesa.estados.dart';

class SelecionarComanda extends StatefulWidget {
  const SelecionarComanda({Key? key, this.clique}) : super(key: key);

  final VoidCallback? clique;

  @override
  State<SelecionarComanda> createState() => _SelecionarComandaState();
}

class _SelecionarComandaState extends State<SelecionarComanda> {
  final controlePedidos = PedidosControle();
  @override
  Widget build(BuildContext context) {
    final mesabloc = context.watch<ConfiguracoesMesaBloc>();
    final mesastate = mesabloc.state;
    return Container(
      padding: const EdgeInsets.only(left: 30, right: 30, top: 75, bottom: 70),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const Text(
            'Para iniciarmos seu atendimento, por favor nos diga o número da sua mesa',
            style: TextStyle(
              fontSize: 25,
            ),
          ),
          if (mesastate is CompletoConfiguracoesMesaEstados)
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Scrollbar(
                  thumbVisibility: true,
                  trackVisibility: true,
                  thickness: 5,
                  radius: const Radius.circular(15),
                  child: GridView.builder(
                      itemCount: mesastate.lista.length,
                      gridDelegate:
                          const SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 130,
                        crossAxisSpacing: 10.0,
                        mainAxisSpacing: 10.0,
                        childAspectRatio: 2.3,
                      ),
                      itemBuilder: (context, index) => ItemMesa(
                            numero: index + 1,
                            cor: index + 1 == controlePedidos.mesaSelecionada
                                ? Colors.orangeAccent
                                : Colors.white,
                            clique: () {
                              controlePedidos.checarOpcao(index);
                              setState(() {});
                            },
                            selecionado:
                                index + 1 == controlePedidos.mesaSelecionada,
                          )),
                ),
              ),
            ),
          const SizedBox(
            height: 15,
          ),
          Container(
            decoration: BoxDecoration(
              color: controlePedidos.mesaSelecionada == 0
                  ? Colors.black54
                  : Colors.orangeAccent,
              borderRadius: const BorderRadius.all(
                Radius.circular(
                  20,
                ),
              ),
            ),
            width: 300,
            height: 63,
            child: Center(
              child: TextButton(
                onPressed: controlePedidos.mesaSelecionada == 0
                    ? null
                    : widget.clique,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: AnimatedDefaultTextStyle(
                        duration: Duration(milliseconds: 700),
                        style: TextStyle(
                            fontSize:
                                controlePedidos.mesaSelecionada > 0 ? 27 : 30,
                            color: Colors.white,
                            fontFamily: 'Poppins-Black'),
                        child: Text(
                          'Continuar',
                        ),
                      ),
                    ),
                    if (controlePedidos.mesaSelecionada > 0)
                      SizedBox(
                        width: 8,
                      ),
                    if (controlePedidos.mesaSelecionada > 0)
                      Container(
                        alignment: Alignment.centerLeft,
                        width: 80,
                        child: AnimatedDefaultTextStyle(
                          textAlign: TextAlign.start,
                          duration: Duration(milliseconds: 700),
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                          child: Text(
                            'mesa:${controlePedidos.mesaSelecionada}',
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
