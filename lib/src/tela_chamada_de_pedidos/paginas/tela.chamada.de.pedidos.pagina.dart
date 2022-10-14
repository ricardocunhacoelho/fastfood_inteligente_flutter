import 'package:fastfood_inteligente_flutter/src/chapas/dominio/objetosdevalor/ordem.objeto.dart';
import 'package:fastfood_inteligente_flutter/src/configuracoes/bloc/configuracoes.chapa.bloc.dart';
import 'package:fastfood_inteligente_flutter/src/configuracoes/estados/configuracoes.chapa.estados.dart';
import 'package:fastfood_inteligente_flutter/src/configuracoes/eventos/configuracoes.chapa.eventos.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TelaChamadaDePedidosPage extends StatefulWidget {
  const TelaChamadaDePedidosPage({Key? key}) : super(key: key);

  @override
  State<TelaChamadaDePedidosPage> createState() =>
      _TelaChamadaDePedidosPageState();
}

class _TelaChamadaDePedidosPageState extends State<TelaChamadaDePedidosPage> {
  var listaOrdensAtendendo = [];
  var listaOrdensAguardando = [];
  var listaOrdensFeito = [];
  List todasChapas = [];
  bool clicado = false;
  double tamanhoSendoFeito = 150;
  double tamanho = 150;
  double tamanhobox = 200;
  double tamanhoboxyellow = 0;
  double tamanhopadding = 40;
  double tamanhoLetraPedidosAguardando = 10;
  @override
  Widget build(BuildContext context) {
    final chapabloc = context.watch<ConfiguracoesChapaBloc>();
    final chapastate = chapabloc.state;
    if (chapastate is CompletoConfiguracoesChapaEstados) {
      todasChapas = chapastate.lista;
      todasChapas.forEach((element) {
        element.ordens.forEach((element) {
          if (element.estado == EOrdermEstado.atendendo &&
              !listaOrdensAtendendo.contains(element.id)) {
            listaOrdensAtendendo.add(element.id);
          }
          if (element.estado == EOrdermEstado.aguardando ||
              element.estado == EOrdermEstado.feito &&
                  listaOrdensAtendendo.contains(element.id)) {
            listaOrdensAtendendo.remove(element.id);
          }
          if (element.estado == EOrdermEstado.aguardando &&
              !listaOrdensAguardando.contains(element.id)) {
            listaOrdensAguardando.add(element.id);
          }
          if (element.estado == EOrdermEstado.atendendo ||
              element.estado == EOrdermEstado.feito &&
                  listaOrdensAguardando.contains(element.id)) {
            listaOrdensAguardando.remove(element.id);
          }
          if (element.estado == EOrdermEstado.feito &&
              !listaOrdensFeito.contains(element.id)) {
            listaOrdensFeito.add(element.id);
          }
          if (element.estado == EOrdermEstado.atendendo ||
              element.estado == EOrdermEstado.aguardando &&
                  listaOrdensFeito.contains(element.id)) {
            listaOrdensFeito.remove(element.id);
          }
        });
      });
    }
    if (listaOrdensFeito.isNotEmpty) {
      tamanhoboxyellow = 200;
      tamanhoLetraPedidosAguardando = 13;
      tamanho = 75;
      tamanhopadding = 15;
      print('valor de tamanho é ${tamanho}');
    } else if (listaOrdensFeito.isEmpty) {
      tamanhoboxyellow = 0;
      tamanhoLetraPedidosAguardando = 10;
      tamanho = 150;
      tamanhopadding = 40;
    }

    if (listaOrdensAtendendo.isNotEmpty) {
      tamanhoboxyellow = 200;
      tamanhoLetraPedidosAguardando = 13;
      tamanhoSendoFeito = 75;
      tamanhopadding = 15;
      print('valor de tamanho é ${tamanho}');
    } else if (listaOrdensAtendendo.isEmpty) {
      tamanhoboxyellow = 0;
      tamanhoLetraPedidosAguardando = 10;
      tamanho = 150;
      tamanhopadding = 40;
      tamanhoSendoFeito = 0;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Pedidos'),
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        AnimatedContainer(
          duration: Duration(seconds: 2),
          color: Colors.amber,
          width: double.infinity,
          height: tamanhoboxyellow * 1.3,
          curve: Curves.easeOutExpo,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Pedidos prontos'),
                  SizedBox(height: 18),
                  Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: tamanhoboxyellow,
                      color: Colors.amber,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: listaOrdensFeito.length,
                        itemBuilder: (context, index) {
                          final ordemNow = listaOrdensFeito[index];
                          return Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: AnimatedContainer(
                              duration: Duration(seconds: 2),
                              color: Colors.white,
                              width: tamanhoboxyellow * 0.8,
                              height: tamanhoboxyellow * 0.8,
                              curve: Curves.easeOutExpo,
                              child: Center(
                                child: Text(
                                  'Pedido ${ordemNow}',
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                            ),
                          );
                        },
                      )),
                ],
              ),
            ),
          ),
        ),
        AnimatedContainer(
          duration: Duration(seconds: 2),
          color: Colors.black12,
          width: double.infinity,
          height: tamanhoSendoFeito * 2.5,
          curve: Curves.easeOutExpo,
          child: Padding(
            padding: EdgeInsets.all(tamanhopadding),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Pedidos sendo feitos'),
                  SizedBox(height: 5),
                  AnimatedContainer(
                    duration: Duration(seconds: 2),
                    height: tamanhoSendoFeito * 0.12,
                    curve: Curves.easeOutExpo,
                  ),
                  Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: tamanhoSendoFeito * 1.5,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: listaOrdensAtendendo.length,
                        itemBuilder: (context, index) {
                          final ordemNow = listaOrdensAtendendo[index];
                          return Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: AnimatedContainer(
                              duration: Duration(seconds: 2),
                              color: Colors.amber,
                              width: tamanhoSendoFeito * 1.3,
                              height: tamanhoSendoFeito * 1.3,
                              curve: Curves.easeOutExpo,
                              child: Center(child: Text('Pedido ${ordemNow}')),
                            ),
                          );
                        },
                      )),
                ],
              ),
            ),
          ),
        ),
        Expanded(
            flex: 1,
            child: Container(
              width: double.infinity,
              color: Colors.black12,
              child: Padding(
                padding: const EdgeInsets.only(left: 40, top: 20, bottom: 20),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Pedidos aguardando'),
                      SizedBox(height: 5),
                      AnimatedContainer(
                        duration: Duration(seconds: 2),
                        height: tamanho * 0.1,
                        curve: Curves.easeOutExpo,
                      ),
                      Container(
                          width: MediaQuery.of(context).size.width * 0.9,
                          height: tamanho,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: listaOrdensAguardando.length,
                            itemBuilder: (context, index) {
                              final ordemNow = listaOrdensAguardando[index];
                              return Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: AnimatedContainer(
                                  duration: Duration(seconds: 2),
                                  color: Colors.white,
                                  width: tamanho,
                                  height: tamanho,
                                  curve: Curves.easeOutExpo,
                                  child: Center(
                                    child: Text(
                                      'Pedido ${ordemNow}',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize:
                                              tamanhoLetraPedidosAguardando),
                                    ),
                                  ),
                                ),
                              );
                            },
                          )),
                    ],
                  ),
                ),
              ),
            )),
      ]),
    );
  }
}
