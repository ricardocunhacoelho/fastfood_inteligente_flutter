import 'package:fastfood_inteligente_flutter/src/configuracoes/componentes/chapa/deletar.chapa.dialog.componente.dart';
import 'package:fastfood_inteligente_flutter/src/configuracoes/componentes/chapa/detalhes.chapa.dialog.componente.dart';
import 'package:fastfood_inteligente_flutter/src/configuracoes/componentes/chapa/ligadeslig.chapa.botao.componente.dart';
import 'package:flutter/material.dart';

import '../../estados/configuracoes.chapa.estados.dart';

Widget listaChapasConfiguracoes(
    ConfiguracoesChapaEstados chapastate, BuildContext context) {
  if (chapastate is ErroConfiguracoesChapaEstados) {
    return Container(
      color: Colors.black12,
      width: MediaQuery.of(context).size.width * 0.9,
      height: MediaQuery.of(context).size.width * 0.5,
      child: Center(
        child: Text(chapastate.menssagem),
      ),
    );
  }

  if (chapastate is CarregandoConfiguracoesChapaEstados) {
    return Container(
      color: Colors.black12,
      width: MediaQuery.of(context).size.width * 0.9,
      height: MediaQuery.of(context).size.width * 0.5,
      child: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  if (chapastate is CompletoConfiguracoesChapaEstados) {
    return Container(
      color: Colors.black12,
      width: MediaQuery.of(context).size.width * 0.9,
      height: MediaQuery.of(context).size.width * 0.5,
      child: Scrollbar(
        isAlwaysShown: true,
        showTrackOnHover: true,
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: chapastate.lista.length,
          itemBuilder: (context, index) {
            final chapa = chapastate.lista[index];
            return ListTile(
              contentPadding: const EdgeInsets.only(
                  left: 18, right: 18, top: 10, bottom: 10),
              trailing: Container(
                width: 170,
                alignment: Alignment.centerRight,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BotaoOnOffChapa(chapa),
                    IconButton(
                      iconSize: 17,
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (_) {
                              return DetalhesChapaDialogComponente(chapa);
                            });
                      },
                      icon: const Icon(Icons.description_sharp),
                    ),
                    IconButton(
                      iconSize: 17,
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (_) {
                              return DeletarChapaDialogComponente(chapa);
                            });
                      },
                      icon: const Icon(
                        Icons.remove,
                      ),
                    ),
                  ],
                ),
              ),
              title: Text(chapa.titulo, style: const TextStyle(fontSize: 15)),
              subtitle: Text('${chapa.numerodachapa}'),
            );
          },
        ),
      ),
    );
  } else {
    return const Text('Erro inesperado');
  }
}
