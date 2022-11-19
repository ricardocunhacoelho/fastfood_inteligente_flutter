import 'package:fastfood_inteligente_flutter/src/configuracoes/bloc/configuracoes.mesa.bloc.dart';
import 'package:fastfood_inteligente_flutter/src/configuracoes/estados/configuracoes.mesa.estados.dart';
import 'package:fastfood_inteligente_flutter/src/configuracoes/eventos/configuracoes.mesa.eventos.dart';
import 'package:fastfood_inteligente_flutter/src/mesas/modelos/mesa.modelo.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class RemoverMesaDialogComponente extends StatefulWidget {
  @override
  _RemoverMesaDialogComponenteState createState() =>
      new _RemoverMesaDialogComponenteState();
}

class _RemoverMesaDialogComponenteState
    extends State<RemoverMesaDialogComponente> {
  MesaModelo mesa = MesaModelo.empty();
  bool vazio = false;
  
  @override
  Widget build(BuildContext context) {
    final mesabloc = context.watch<ConfiguracoesMesaBloc>();
    final mesastate = mesabloc.state;
    if (mesastate is CompletoConfiguracoesMesaEstados) {
      if (mesastate.lista.isNotEmpty) {
        mesa = mesa.copyWith(numero: mesastate.lista.length);
      } else if (mesastate.lista.isEmpty) {
        vazio = true;
      }
    return AlertDialog(
      content:
      vazio ? const Text('Não existe mesa para ser deletada') :
          Text('Ao remover uma mesa o total de mesas será: ${mesa.numero}'),
      actions: <Widget>[
        TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Cancelar')),
        if(!vazio)
        TextButton(
            onPressed: () {
              context
                  .read<ConfiguracoesMesaBloc>()
                  .add(RemoverMesaConfiguracoesEventos(mesa));
              Navigator.pop(context);
            },
            child: const Text('Salvar')),
      ],
    );
    } else if (mesastate is CarregandoConfiguracoesMesaEstados) {
      return AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Center(
              child: CircularProgressIndicator(),
            ),
          ],
        ),
      );
    } else {
      return AlertDialog(
        content: const Text('Erro ao carregar mesas tentar'),
        actions: <Widget>[
          IconButton(
              onPressed: () {
                context
                    .read<ConfiguracoesMesaBloc>()
                    .add(BuscarTodasMesasConfiguracoesEventos());
              },
              icon: const Icon(Icons.replay_outlined))
        ],
      );
    }

    
  }
}
