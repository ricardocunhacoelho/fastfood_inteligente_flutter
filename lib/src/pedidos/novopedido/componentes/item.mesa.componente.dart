import 'dart:math';

import 'package:flutter/material.dart';

class ItemMesa extends StatefulWidget {
  const ItemMesa(
      {Key? key, this.numero, this.cor, this.clique, required this.selecionado})
      : super(key: key);

  final int? numero;
  final Color? cor;
  final VoidCallback? clique;
  final bool selecionado;

  @override
  State<ItemMesa> createState() => _ItemMesaState();
}

class _ItemMesaState extends State<ItemMesa> {
  late final flip = widget.selecionado;
  Widget naoSelecionado() {
    return Container(
      key: Key('first'),
      decoration: BoxDecoration(
        border: Border.all(width: 2, color: Colors.black38),
        color: widget.cor,
        borderRadius: const BorderRadius.all(
          Radius.circular(
            5,
          ),
        ),
      ),
      child: Center(
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text(widget.numero.toString(),
            style: const TextStyle(fontSize: 16, color: Colors.black45)),
      ])),
    );
  }

  Widget jaSelecionado() {
    return Container(
      key: Key('second'),
      decoration: BoxDecoration(
          color: widget.cor,
          borderRadius: const BorderRadius.all(
            Radius.circular(
              5,
            ),
          ),
          boxShadow: const [
            BoxShadow(
              color: Color.fromARGB(255, 253, 218, 166),
              offset: Offset(6, 6),
              blurRadius: 15,
              spreadRadius: 0.5,
            ),
            BoxShadow(
              color: Color.fromARGB(255, 247, 198, 125),
              offset: Offset(-6, -6),
              blurRadius: 15,
              spreadRadius: 0.5,
            ),
          ]),
      child: Center(
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text(widget.numero.toString(),
            style: const TextStyle(fontSize: 16, color: Colors.white)),
        if (widget.selecionado)
          const SizedBox(
            width: 6,
          ),
        const Icon(
          Icons.table_bar_sharp,
          color: Colors.white,
        )
      ])),
    );
  }

  Widget transicao(Widget widget, Animation<double> animacao){
    final flipAnimacao = Tween(begin:pi, end: 0.0).animate(animacao);
    return AnimatedBuilder(animation: flipAnimacao,
    child: widget,
    builder: (context, widget){
      final bool embaixo = (ValueKey(flip) != widget!.key);
      final value = embaixo ? min(flipAnimacao.value, pi/2) : flipAnimacao.value;
    
      return Transform(
        transform: Matrix4.rotationX(value),
        child: widget,
        alignment: Alignment.center,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.clique,
      child: AnimatedSwitcher(
        reverseDuration: Duration(milliseconds: 700),
        duration: Duration(milliseconds: 700),
        switchInCurve: Curves.ease,
        switchOutCurve: Curves.ease,
        transitionBuilder: transicao,
        child: widget.selecionado ? jaSelecionado() : naoSelecionado(),
      ),
    );
  }
}
