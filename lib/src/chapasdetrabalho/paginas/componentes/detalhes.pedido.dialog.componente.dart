import 'package:fastfood_inteligente_flutter/src/chapas/dominio/objetosdevalor/ordem.objeto.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetalhesPedidoDialogComponente extends StatefulWidget {
  final Ordem ordem;
  DetalhesPedidoDialogComponente(this.ordem);
  @override
  _DetalhesPedidoDialogComponenteState createState() =>
      new _DetalhesPedidoDialogComponenteState();
}

class _DetalhesPedidoDialogComponenteState
    extends State<DetalhesPedidoDialogComponente> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(mainAxisSize: MainAxisSize.min, children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.75,
          height: MediaQuery.of(context).size.width * 0.6,
          child: ListView.builder(
              itemCount: widget.ordem.produtos.length,
              itemBuilder: (context, index) {
                final produto = widget.ordem.produtos[index];
                return Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('${produto.quantidade} -',
                            style: const TextStyle(fontSize: 18)),
                        Text(' ${produto.titulo} : ',
                            style:
                                const TextStyle(fontWeight: FontWeight.bold)),
                        Expanded(
                          child: Text('${produto.descricao}'),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    )
                  ],
                );
              }),
        ),
      ]),
      actions: <Widget>[
        TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Center(child: Text('Voltar'))),
      ],
    );
  }
}
