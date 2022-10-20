import 'package:fastfood_inteligente_flutter/src/recepcao/componentes/recomecar.dialog.componente.dart';
import 'package:flutter/material.dart';

class RecomecarBotao extends StatefulWidget {
  final double largura;
  final double altura;


  RecomecarBotao({Key? key, required this.largura, required this.altura})
      : super(key: key);

  @override
  State<RecomecarBotao> createState() => _RecomecarBotaoState();
}

class _RecomecarBotaoState extends State<RecomecarBotao> {
  @override
  Widget build(BuildContext context) {
 

    return Container(
      margin: const EdgeInsets.all(15),
      width: widget.largura,
      height: widget.altura,
      decoration: const BoxDecoration(
        color:  Colors.orangeAccent,
        borderRadius:  BorderRadius.all(Radius.circular(5)),
      ),
      child: TextButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (_) {
                  return RecomecarDialogComponente();
                });
          },
          child: const Center(
            child: Text(
              'Recomeçar',
              style: TextStyle(color: Colors.white, fontSize: 10),
            ),
          )),
    );
  }
}
