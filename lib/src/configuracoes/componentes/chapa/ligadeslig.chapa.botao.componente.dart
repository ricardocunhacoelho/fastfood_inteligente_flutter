import 'package:fastfood_inteligente_flutter/src/chapas/dominio/entidade/chapa.entidade.dart';
import 'package:fastfood_inteligente_flutter/src/configuracoes/bloc/configuracoes.chapa.bloc.dart';
import 'package:fastfood_inteligente_flutter/src/configuracoes/eventos/configuracoes.chapa.eventos.dart';
import 'package:fastfood_inteligente_flutter/src/configuracoes/modelo/configuracoes.chapa.modelo.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BotaoOnOffChapa extends StatefulWidget {
  final ChapaEntidade chapaEntidade;
  BotaoOnOffChapa(this.chapaEntidade);
  @override
  _BotaoOnOffChapaState createState() => new _BotaoOnOffChapaState();
}

class _BotaoOnOffChapaState extends State<BotaoOnOffChapa> {
  var chapa = ConfiguracoesChapaModelo.empty();
  @override
  void initState() {
    super.initState();
    chapa = ConfiguracoesChapaModelo.converter(widget.chapaEntidade);
  }

  late bool isSwitched;
  @override
  Widget build(BuildContext context) {
    if (chapa.estado == EChapaEstado.desligada) {
      isSwitched = false;
    } else if (chapa.estado == EChapaEstado.funcionando) {
      isSwitched = true;
    }
    return Switch(
      value: isSwitched,
      onChanged: (value) {
        if (value) {
          showDialog(
              context: context,
              builder: (_) {
                return AlertDialog(
                  title: Text('Deseja ligar esta chapa?'),
                  actions: <Widget>[
                    TextButton(
                        onPressed: () {
                          value = !value;
                          Navigator.pop(context);
                        },
                        child: Text('Não')),
                    TextButton(
                        onPressed: () {
                          setState(() {
                            chapa = chapa.copyWith(
                                estado: EChapaEstado.funcionando);
                          });
                          context.read<ConfiguracoesChapaBloc>().add(
                              AtualizarValoresChapaConfiguracoesEventos(chapa));
                          Navigator.pop(context);
                        },
                        child: Text('Sim')),
                  ],
                );
              });
        } else {
          showDialog(
              context: context,
              builder: (_) {
                return AlertDialog(
                  title: Text('Deseja desligar esta chapa?'),
                  actions: <Widget>[
                    TextButton(
                        onPressed: () {
                          value = !value;
                          Navigator.pop(context);
                        },
                        child: Text('Não')),
                    TextButton(
                        onPressed: () {
                          setState(() {
                            chapa =
                                chapa.copyWith(estado: EChapaEstado.desligada);
                          });
                          context.read<ConfiguracoesChapaBloc>().add(
                              AtualizarValoresChapaConfiguracoesEventos(chapa));
                          Navigator.pop(context);
                        },
                        child: Text('Sim')),
                  ],
                );
              });
        }
      },
      activeTrackColor: Colors.lightGreenAccent,
      activeColor: Color.fromARGB(255, 96, 216, 100),
    );
  }
}
