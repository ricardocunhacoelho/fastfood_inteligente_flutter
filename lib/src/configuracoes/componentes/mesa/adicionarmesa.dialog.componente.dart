import 'package:fastfood_inteligente_flutter/src/configuracoes/bloc/configuracoes.mesa.bloc.dart';
import 'package:fastfood_inteligente_flutter/src/configuracoes/estados/configuracoes.mesa.estados.dart';
import 'package:fastfood_inteligente_flutter/src/configuracoes/eventos/configuracoes.mesa.eventos.dart';
import 'package:fastfood_inteligente_flutter/src/mesas/modelos/mesa.modelo.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AdicionarMesaDialogComponente extends StatefulWidget {
  @override
  _AdicionarMesaDialogComponenteState createState() =>
      new _AdicionarMesaDialogComponenteState();
}

class _AdicionarMesaDialogComponenteState
    extends State<AdicionarMesaDialogComponente> {
  bool salvo = false;
  @override
  Widget build(BuildContext context) {
    final mesabloc = context.watch<ConfiguracoesMesaBloc>();
    final mesastate = mesabloc.state;
    if (mesastate is CompletoConfiguracoesMesaEstados) {
      MesaModelo mesa = MesaModelo.empty();
      mesa = mesa.copyWith(numero: mesastate.lista.length + 1);
      return AlertDialog(
        content: salvo
            ? Column(
              mainAxisSize: MainAxisSize.min,
              children: const[
                 Center(child: CircularProgressIndicator()),
              ],
            )
            : Text('Sua próxima mesa será de número ${mesa.numero}'),
        actions: <Widget>[
          TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancelar')),
          TextButton(
              onPressed: () async {
                salvo = true;
                context
                    .read<ConfiguracoesMesaBloc>()
                    .add(AdicionarMesaConfiguracoesEventos(mesa));
                Navigator.pop(context);
              },
              child: const Text('Salvar')),
        ],
      );
    }
    if (mesastate is CarregandoConfiguracoesMesaEstados) {
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
