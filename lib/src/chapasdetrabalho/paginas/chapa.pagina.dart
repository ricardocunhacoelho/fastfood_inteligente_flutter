import 'package:fastfood_inteligente_flutter/src/chapas/dominio/entidade/chapa.entidade.dart';
import 'package:fastfood_inteligente_flutter/src/chapas/dominio/objetosdevalor/ordem.objeto.dart';
import 'package:fastfood_inteligente_flutter/src/chapasdetrabalho/estados/selecaochapa.estados.dart';
import 'package:fastfood_inteligente_flutter/src/chapasdetrabalho/paginas/componentes/listapedidos.componente.dart';
import 'package:fastfood_inteligente_flutter/src/configuracoes/bloc/configuracoes.chapa.bloc.dart';
import 'package:fastfood_inteligente_flutter/src/configuracoes/estados/configuracoes.chapa.estados.dart';
import 'package:fastfood_inteligente_flutter/src/configuracoes/modelo/configuracoes.chapa.modelo.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
  @override
  Widget build(BuildContext context) {
    final argumentos = ModalRoute.of(context)!.settings.arguments as Argumentos;
    int numeroDaChapa = argumentos.numeroDaChapa;
    String titulo = 'Carregando...';
    var chapa = ChapaEntidade(
        estado: EChapaEstado.desligada,
        id: '',
        numerodachapa: 0,
        ordens: [],
        titulo: '');
    final chapabloc = context.watch<ConfiguracoesChapaBloc>();
    final chapastate = chapabloc.state;
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
              Text('Chapa:'),
              SizedBox(
                height: 10,
              ),
              Text('${chapa.titulo}')
            ],
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                Text('Pausar :'),
                SizedBox(width: 10),
                IconButton(
                    onPressed: () {}, icon: Icon(Icons.lock_clock_sharp)),
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
              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  'AGUARDANDO',
                  style: TextStyle(
                    fontSize: 17,
                  ),
                ),
              ),
              SizedBox(height: 20),
              if (chapastate is CarregandoConfiguracoesChapaEstados)
                CircularProgressIndicator(),
              if (chapastate is CompletoConfiguracoesChapaEstados)
                ListaPedidosComponente(numeroDaChapa, EOrdermEstado.aguardando),
            ],
          ),
        ),
      ),
    );
  }
}
