import 'package:fastfood_inteligente_flutter/src/recepcao/componentes/finalizar.botao.componente.dart';
import 'package:fastfood_inteligente_flutter/src/recepcao/componentes/mostrarpreco.entrada.componente.dart';
import 'package:fastfood_inteligente_flutter/src/recepcao/componentes/recomecar.botao.componente.dart';
import 'package:flutter/material.dart';

Widget caixaValorRecomecarFinalizarRecepcaoMobile(
        bool habilitar, double tamanho) =>
    Container(
      width: double.infinity,
      color: Colors.black12,
      height: tamanho,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(
              15,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: [
                    Container(
                      child: const Text(
                        "TOTAL",
                        textAlign: TextAlign.start,
                      ),
                    ),
                    if (habilitar)
                      const RecomecarBotao(largura: 100, altura: 25),
                  ],
                ),
                Container(child: const MostrarPrecoEntrada()),
              ],
            ),
          ),
          const FinalizarBotao(largura: 160, altura: 50),
        ],
      ),
    );
