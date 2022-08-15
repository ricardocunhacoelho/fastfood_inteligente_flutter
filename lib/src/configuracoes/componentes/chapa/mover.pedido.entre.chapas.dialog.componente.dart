import 'package:fastfood_inteligente_flutter/src/chapas/dominio/casodeuso/buscar.chapaentidade.na.lista.casodeuso.dart';
import 'package:fastfood_inteligente_flutter/src/chapas/dominio/entidade/chapa.entidade.dart';
import 'package:fastfood_inteligente_flutter/src/chapas/dominio/objetosdevalor/ordem.objeto.dart';
import 'package:fastfood_inteligente_flutter/src/configuracoes/bloc/configuracoes.chapa.bloc.dart';
import 'package:fastfood_inteligente_flutter/src/configuracoes/eventos/configuracoes.chapa.eventos.dart';
import 'package:fastfood_inteligente_flutter/src/configuracoes/modelo/configuracoes.chapa.modelo.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MoverPedidoEntreChapasDialogComponente extends StatefulWidget {
  final Ordem ordem;
  final ChapaEntidade chapaAtual;
  final List<dynamic> listaChapasAptas;
  MoverPedidoEntreChapasDialogComponente(
      this.ordem, this.chapaAtual, this.listaChapasAptas);
  @override
  _MoverPedidoEntreChapasDialogComponenteState createState() =>
      new _MoverPedidoEntreChapasDialogComponenteState();
}

class _MoverPedidoEntreChapasDialogComponenteState
    extends State<MoverPedidoEntreChapasDialogComponente> {
  IBuscarChapaEntidadeNaLista buscarChapaEntidadeNaListaUsecase =
      BuscarChapaEntidadeNaLista();

  List todasAsChapas = [];
  List nomeTodasAsChapasAptas = <String>[];
  var nomeChapaSelecionada = '';
  ConfiguracoesChapaModelo chapaDestinoSelecionada =
      ConfiguracoesChapaModelo.empty();
  ConfiguracoesChapaModelo chapaDestino = ConfiguracoesChapaModelo.empty();
  @override
  void initState() {
    print(widget.listaChapasAptas[1].titulo);
    chapaDestinoSelecionada =
        ConfiguracoesChapaModelo.converter(widget.listaChapasAptas[0]);
    widget.listaChapasAptas.forEach((element) {
      nomeTodasAsChapasAptas.add(element.titulo);
    });
  }

  @override
  Widget build(BuildContext context) {
    var tamanhoDaLista = widget.listaChapasAptas.length;
    var listaAdd = new List<int>.generate(tamanhoDaLista, (i) => 1000);
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          DropdownButton<String>(
            value: chapaDestinoSelecionada.titulo,
            onChanged: (String? newValue) {
              widget.listaChapasAptas.forEach((element) => {
                    if (element.titulo == newValue)
                      {
                        chapaDestinoSelecionada =
                            ConfiguracoesChapaModelo.converter(element)
                      }
                  });
              setState(() {
                chapaDestinoSelecionada;
              });
              print(chapaDestinoSelecionada.titulo);
            },
            items:
                nomeTodasAsChapasAptas.map<DropdownMenuItem<String>>((value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ],
      ),
      actions: <Widget>[
        TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Cancelar')),
        TextButton(
            onPressed: () async {
              final chapaDestino = await buscarChapaEntidadeNaListaUsecase.call(
                  todasAsChapas, chapaDestinoSelecionada.numerodachapa);
              context.read<ConfiguracoesChapaBloc>().add(
                  MoverPedidoEntreChapasEventoConfiguracoesEventos(widget.ordem,
                      widget.chapaAtual, chapaDestinoSelecionada));
              Navigator.pop(context);
            },
            child: Text('Salvar')),
      ],
    );
  }
}
