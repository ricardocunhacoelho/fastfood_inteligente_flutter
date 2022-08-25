import 'package:fastfood_inteligente_flutter/src/chapas/dominio/objetosdevalor/ordem.objeto.dart';
import 'package:fastfood_inteligente_flutter/src/configuracoes/bloc/configuracoes.chapa.bloc.dart';
import 'package:fastfood_inteligente_flutter/src/configuracoes/estados/configuracoes.chapa.estados.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TelaChamadaDePedidos extends StatefulWidget {
  const TelaChamadaDePedidos({Key? key}) : super(key: key);

  @override
  State<TelaChamadaDePedidos> createState() => _TelaChamadaDePedidosState();
}

class _TelaChamadaDePedidosState extends State<TelaChamadaDePedidos> {
  var listaOrdensAtendendo = [];
  List todasChapas = [];
  bool clicado = false;
  double tamanho = 150;
  double tamanhobox = 200;
  double tamanhoboxyellow = 0;
  double tamanhopadding = 40;
  @override
  Widget build(BuildContext context) {
    final chapabloc = context.watch<ConfiguracoesChapaBloc>();
    final chapastate = chapabloc.state;

    if (chapastate is CompletoConfiguracoesChapaEstados) {
      todasChapas = chapastate.lista;
    }

    todasChapas.forEach((element) {
      listaOrdensAtendendo = element.ordens
          .where((element) => element.estado == EOrdermEstado.atendendo);
    });
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
                        itemCount: 3,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: AnimatedContainer(
                              duration: Duration(seconds: 2),
                              color: Colors.white,
                              width: tamanhoboxyellow * 0.8,
                              height: tamanhoboxyellow * 0.8,
                              curve: Curves.easeOutExpo,
                              child: Center(child: Text('asdddd')),
                            ),
                          );
                        },
                      )),

                  // ListView.builder(
                  //     itemCount: 3,
                  //     itemBuilder: (context, index) {
                  //       return Container(
                  //           height: 10, width: 10, color: Colors.amber);
                  //     }),
                ],
              ),
            ),
          ),
        ),
        AnimatedContainer(
          duration: Duration(seconds: 2),
          color: Colors.purple,
          width: double.infinity,
          height: tamanho * 2.5,
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
                    height: tamanho * 0.12,
                    curve: Curves.easeOutExpo,
                  ),
                  Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: tamanho * 1.5,
                      color: Colors.purple,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 3,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: AnimatedContainer(
                              duration: Duration(seconds: 2),
                              color: Colors.amber,
                              width: tamanho * 1.3,
                              height: tamanho * 1.3,
                              curve: Curves.easeOutExpo,
                              child: Center(child: Text('adas')),
                            ),
                          );
                        },
                      )),
                  // SingleChildScrollView(
                  //   child:
                  //       ListView(scrollDirection: Axis.horizontal, children: [
                  //     Container(
                  //       width: 10,
                  //       height: 10,
                  //       color: Colors.amber,
                  //     ),
                  //     Container(
                  //       width: 10,
                  //       height: 10,
                  //       color: Colors.amber,
                  //     ),
                  //     Container(
                  //       width: 10,
                  //       height: 10,
                  //       color: Colors.amber,
                  //     ),
                  //   ]

                  // AnimatedContainer(
                  //   duration: Duration(seconds: 2),
                  //   color: Colors.white,
                  //   width: tamanhoboxyellow * 0.9,
                  //   height: tamanhoboxyellow * 0.9,
                  //   curve: Curves.easeOutExpo,
                  //           // ),
                  //           // AnimatedContainer(
                  //           //   duration: Duration(seconds: 2),
                  //           //   color: Colors.white,
                  //           //   width: tamanhoboxyellow * 0.9,
                  //           //   height: tamanhoboxyellow * 0.9,
                  //           //   curve: Curves.easeOutExpo,
                  //           // ),
                  //           ),
                  // ),
                  // AnimatedContainer(
                  //   duration: Duration(seconds: 2),
                  //   color: Colors.white,
                  //   width: tamanho * 1.3,
                  //   height: tamanho * 1.3,
                  //   curve: Curves.easeOutExpo,
                  // ),
                  TextButton(
                      onPressed: () {
                        setState(() {
                          clicado = !clicado;
                          if (clicado) {
                            tamanhoboxyellow = 200;
                            tamanho = tamanho * 0.5;
                            tamanhopadding = 15;
                            // tamanhobox = 10;
                          } else {
                            tamanhoboxyellow = 0;
                            tamanho = 150;
                            tamanhopadding = 40;
                            // tamanhobox = 20;
                          }
                        });
                      },
                      child: Text('clicaaqui'))
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
                    AnimatedContainer(
                      duration: Duration(seconds: 2),
                      color: Colors.white,
                      width: tamanho * 1,
                      height: tamanho * 1,
                      curve: Curves.easeOutExpo,
                      // child: Center(
                      //     child: Text(
                      //   'Box',
                      //   style: TextStyle(color: Colors.black38),
                      // )),
                    ),
                  ],
                ),
              ),
            )),
      ]),
    );
  }
}
