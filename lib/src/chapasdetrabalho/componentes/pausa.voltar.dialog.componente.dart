import 'package:fastfood_inteligente_flutter/src/chapas/dominio/casodeuso/calcular.posicao.solicitacao.cancelamento.casodeuso.dart';
import 'package:fastfood_inteligente_flutter/src/chapas/dominio/entidade/chapa.entidade.dart';
import 'package:fastfood_inteligente_flutter/src/chapas/dominio/objetosdevalor/ordem.objeto.dart';
import 'package:fastfood_inteligente_flutter/src/chapas/dominio/objetosdevalor/solicitacoes/solicitacao.cancelamento.pedido.objeto.dart';
import 'package:fastfood_inteligente_flutter/src/chapasdetrabalho/bloc/chapadetrabalho.bloc.dart';
import 'package:fastfood_inteligente_flutter/src/chapasdetrabalho/componentes/motivo.deletar.pedido.dialog.componente.dart';
import 'package:fastfood_inteligente_flutter/src/chapasdetrabalho/estados/selecaochapa.estados.dart';
import 'package:fastfood_inteligente_flutter/src/chapasdetrabalho/eventos/selecaochapa.eventos.dart';
import 'package:fastfood_inteligente_flutter/src/chapasdetrabalho/modelos/chapadetrabalho.solicitacoes.modelo.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PausarVoltarDialogComponente extends StatefulWidget {
  final ChapaEntidade chapa;

  PausarVoltarDialogComponente(
    this.chapa,
  );

  @override
  _PausarVoltarDialogComponenteState createState() =>
      new _PausarVoltarDialogComponenteState();
}

class _PausarVoltarDialogComponenteState
    extends State<PausarVoltarDialogComponente> {
  @override
  Widget build(BuildContext context) {
    if (widget.chapa.estado == EChapaEstado.funcionando)
      return AlertDialog(
        title: Text('Iniciar Pausa? '),
        actions: <Widget>[
          TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancelar')),
          TextButton(
              onPressed: () {
                context.read<ChapaDeTrabalhoBloc>().add(
                    PausarVoltarChapaDeTrabalhoEventos(
                        'pausada', widget.chapa));

                Navigator.pop(context);
              },
              child: const Text('Pausar')),
        ],
      );

    if (widget.chapa.estado == EChapaEstado.pausada)
      return AlertDialog(
        title: Text('Voltar ao trabalho? '),
        actions: <Widget>[
          TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancelar')),
          TextButton(
              onPressed: () {
                context.read<ChapaDeTrabalhoBloc>().add(
                    PausarVoltarChapaDeTrabalhoEventos(
                        'funcionando', widget.chapa));
                Navigator.pop(context);
              },
              child: const Text('Voltar ao trabalho')),
        ],
      );
    else {
      return AlertDialog(
        title: Text('Chapa desligada'),
        actions: <Widget>[
          TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancelar')),
        ],
      );
    }
  }
}
