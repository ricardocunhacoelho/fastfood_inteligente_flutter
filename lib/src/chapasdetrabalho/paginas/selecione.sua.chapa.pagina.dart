import 'package:fastfood_inteligente_flutter/src/chapasdetrabalho/bloc/chapadetrabalho.bloc.dart';
import 'package:fastfood_inteligente_flutter/src/chapasdetrabalho/eventos/selecaochapa.eventos.dart';
import 'package:fastfood_inteligente_flutter/src/chapasdetrabalho/paginas/chapa.pagina.dart';
import 'package:fastfood_inteligente_flutter/src/configuracoes/bloc/configuracoes.chapa.bloc.dart';
import 'package:fastfood_inteligente_flutter/src/configuracoes/estados/configuracoes.chapa.estados.dart';
import 'package:fastfood_inteligente_flutter/src/configuracoes/eventos/configuracoes.chapa.eventos.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SelecioneSuaChapaPagina extends StatefulWidget {
  const SelecioneSuaChapaPagina({Key? key}) : super(key: key);

  @override
  State<SelecioneSuaChapaPagina> createState() =>
      _SelecioneSuaChapaPaginaState();
}

class _SelecioneSuaChapaPaginaState extends State<SelecioneSuaChapaPagina>
    with CompleteStateMixin {
  @override
  void completeState() {
    context
        .read<ConfiguracoesChapaBloc>()
        .add(BuscarTodasChapasEventoConfiguracoesEventos());
  }

  var listChapas = [];

  @override
  Widget build(BuildContext context) {
    final chapabloc = context.watch<ConfiguracoesChapaBloc>();
    final chapastate = chapabloc.state;
    if (chapastate is CompletoConfiguracoesChapaEstados) {
      listChapas = chapastate.lista;
    }
    return Scaffold(
      appBar: AppBar(title: Text('Chapas')),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            SizedBox(height: 10),
            Center(child: Text('SELECIONE SUA CHAPA')),
            SizedBox(height: 30),
            if (chapastate is CarregandoConfiguracoesChapaEstados)
              CircularProgressIndicator(),
            if (chapastate is CompletoConfiguracoesChapaEstados)
              ListView.builder(
                shrinkWrap: true,
                itemCount: chapastate.lista.length,
                itemBuilder: (context, index) {
                  final chapa = chapastate.lista[index];
                  return Container(
                    color: Colors.black12,
                    child: ListTile(
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '${chapa.titulo} - ${chapa.numerodachapa}',
                            style: TextStyle(fontSize: 15),
                          ),
                          Container(
                            width: 180,
                            alignment: Alignment.centerRight,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  color: Colors.black38,
                                  width: 140,
                                  height: 40,
                                  child: TextButton(
                                      onPressed: () {
                                        context.read<ChapaDeTrabalhoBloc>().add(
                                            BuscarChapaDeTrabalhoEventos(
                                                chapa.numerodachapa));
                                        Navigator.pushNamed(
                                            context, 'ChapaPagina',
                                            arguments: Argumentos(
                                                chapa.numerodachapa));
                                        // ChapaPagina(
                                        //     listachapas: listChapas,
                                        //     chapa: chapa);
                                      },
                                      child: Text('Selecionar')),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
          ],
        ),
      ),
    );
  }
}

mixin CompleteStateMixin<T extends StatefulWidget> on State<T> {
  void completeState();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      context
          .read<ConfiguracoesChapaBloc>()
          .add(BuscarTodasChapasEventoConfiguracoesEventos());

      completeState();
    });
  }
}
