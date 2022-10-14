import 'package:fastfood_inteligente_flutter/src/chapas/dominio/entidade/chapa.entidade.dart';
import 'package:fastfood_inteligente_flutter/src/chapas/dominio/objetosdevalor/ordem.objeto.dart';
import 'package:fastfood_inteligente_flutter/src/chapasdetrabalho/bloc/chapadetrabalho.bloc.dart';
import 'package:fastfood_inteligente_flutter/src/chapasdetrabalho/paginas/componentes/listapedidos.componente.dart';
import 'package:fastfood_inteligente_flutter/src/configuracoes/bloc/configuracoes.chapa.bloc.dart';
import 'package:fastfood_inteligente_flutter/src/configuracoes/bloc/configuracoes.produto.bloc.dart';
import 'package:fastfood_inteligente_flutter/src/configuracoes/estados/configuracoes.chapa.estados.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../componentes/pausa.voltar.dialog.componente.dart';

class Argumentos {
  int numeroDaChapa = 0;

  Argumentos(this.numeroDaChapa);
}

class ChapaPagina extends StatefulWidget {
  static const routeName = 'ChapaPagina';
  const ChapaPagina({Key? key}) : super(key: key);

  @override
  State<ChapaPagina> createState() => _ChapaPaginaState();
}

class _ChapaPaginaState extends State<ChapaPagina> {
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    final argumentos = ModalRoute.of(context)!.settings.arguments as Argumentos;
    final chapabloc = context.watch<ConfiguracoesChapaBloc>();
    final chapastate = chapabloc.state;
    int numeroDaChapa = argumentos.numeroDaChapa;
    var chapa = ChapaEntidade(
        estado: EChapaEstado.desligada,
        id: '',
        numerodachapa: 0,
        ordens: [],
        titulo: '');
    if (chapastate is CompletoConfiguracoesChapaEstados) {
      chapastate.lista.forEach((element) {
        if (element.numerodachapa == numeroDaChapa) {
          chapa = element;
        }
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              const Text('Chapa:'),
              const SizedBox(height: 10),
              Text(chapa.titulo)
            ],
          ),
        ),
        actions: [
          if (chapa.estado == EChapaEstado.funcionando)
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  const Text('Pausar :'),
                  const SizedBox(width: 10),
                  IconButton(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (_) {
                              return PausarVoltarDialogComponente(chapa);
                            });
                      },
                      icon: const Icon(Icons.lock_clock_sharp)),
                ],
              ),
            ),
          if (chapa.estado == EChapaEstado.pausada)
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  const Text('Voltar :'),
                  const SizedBox(width: 10),
                  IconButton(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (_) {
                              return PausarVoltarDialogComponente(chapa);
                            });
                      },
                      icon: const Icon(Icons.lock_clock_sharp,
                          color: Colors.blueAccent)),
                ],
              ),
            ),
        ],
        toolbarHeight: 120,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (chapastate is CarregandoConfiguracoesChapaEstados)
                const Center(child: CircularProgressIndicator()),
              if (chapastate is CompletoConfiguracoesChapaEstados)
                const SizedBox(height: 30),
              const Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  'ATENDENDO',
                  style: TextStyle(
                    fontSize: 17,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              if (chapastate is CarregandoConfiguracoesChapaEstados)
                const CircularProgressIndicator(),
              if (chapastate is CompletoConfiguracoesChapaEstados)
                ListaPedidosComponente(numeroDaChapa, EOrdermEstado.atendendo),
              const SizedBox(height: 30),
              const Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  'AGUARDANDO',
                  style: TextStyle(
                    fontSize: 17,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              if (chapastate is CarregandoConfiguracoesChapaEstados)
                const CircularProgressIndicator(),
              if (chapastate is CompletoConfiguracoesChapaEstados)
                ListaPedidosComponente(numeroDaChapa, EOrdermEstado.aguardando),
            ],
          ),
        ),
      ),
    );
  }
}
