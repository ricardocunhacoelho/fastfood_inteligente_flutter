import 'package:fastfood_inteligente_flutter/src/chapasdetrabalho/bloc/chapadetrabalho.bloc.dart';
import 'package:fastfood_inteligente_flutter/src/chapasdetrabalho/eventos/selecaochapa.eventos.dart';
import 'package:fastfood_inteligente_flutter/src/chapasdetrabalho/paginas/chapa.pagina.dart';
import 'package:fastfood_inteligente_flutter/src/configuracoes/bloc/configuracoes.chapa.bloc.dart';
import 'package:fastfood_inteligente_flutter/src/configuracoes/estados/configuracoes.chapa.estados.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SelecioneSuaChapaPagina extends StatefulWidget {
  const SelecioneSuaChapaPagina({Key? key}) : super(key: key);

  @override
  State<SelecioneSuaChapaPagina> createState() =>
      _SelecioneSuaChapaPaginaState();
}

class _SelecioneSuaChapaPaginaState extends State<SelecioneSuaChapaPagina> {
  var listChapas = [];

  @override
  Widget build(BuildContext context) {
    final chapabloc = context.watch<ConfiguracoesChapaBloc>();
    final chapastate = chapabloc.state;
    if (chapastate is CompletoConfiguracoesChapaEstados) {
      listChapas = chapastate.lista;
    }
    return Scaffold(
      appBar: AppBar(title: const Text('Chapas')),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 10),
            const Center(child: Text('SELECIONE SUA CHAPA')),
            const SizedBox(height: 30),
            if (chapastate is CarregandoConfiguracoesChapaEstados)
              const CircularProgressIndicator(),
            if (chapastate is CompletoConfiguracoesChapaEstados)
              ListView.builder(
                shrinkWrap: true,
                itemCount: chapastate.lista.length,
                itemBuilder: (context, index) {
                  final chapa = chapastate.lista[index];
                  return Column(
                    children: [
                      Container(
                        color: Colors.black12,
                        child: ListTile(
                          horizontalTitleGap: 18,
                          contentPadding: const EdgeInsets.only(
                              left: 18, right: 18, top: 5, bottom: 5),
                          title: Text(
                            chapa.titulo,
                            style: const TextStyle(fontSize: 15),
                          ),
                          subtitle: Text(
                            '${chapa.numerodachapa}',
                            style: const TextStyle(fontSize: 15),
                          ),
                          trailing: Container(
                            color: Colors.black38,
                            width: 140,
                            height: 40,
                            child: TextButton(
                                onPressed: () {
                                  context.read<ChapaDeTrabalhoBloc>().add(
                                      BuscarTodasSolicitacoesCancelamentoPedidoChapaDeTrabalhoEventos());
                                  context.read<ChapaDeTrabalhoBloc>().add(
                                      BuscarChapaDeTrabalhoEventos(
                                          chapa.numerodachapa));
                                  Navigator.pushNamed(context, 'ChapaPagina',
                                      arguments:
                                          Argumentos(chapa.numerodachapa));
                                },
                                child: const Text('Selecionar')),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                    ],
                  );
                },
              ),
          ],
        ),
      ),
    );
  }
}
