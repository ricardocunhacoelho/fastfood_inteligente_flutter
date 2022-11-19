import 'package:fastfood_inteligente_flutter/src/configuracoes/componentes/mesa/detalhes.mesa.dialog.componente.dart';
import 'package:fastfood_inteligente_flutter/src/configuracoes/componentes/produto/deletar.produto.dialog.componente.dart';
import 'package:fastfood_inteligente_flutter/src/configuracoes/componentes/produto/detalhes.produto.dialog.componente.dart';
import 'package:fastfood_inteligente_flutter/src/configuracoes/componentes/produto/editar.produto.dialog.componente.dart';
import 'package:fastfood_inteligente_flutter/src/configuracoes/estados/configuracoes.mesa.estados.dart';
import 'package:fastfood_inteligente_flutter/src/configuracoes/estados/configuracoes.produto.estados.dart';
import 'package:flutter/material.dart';

Widget listaMesaConfiguracoes(
    ConfiguracoesMesaEstados mesatate, BuildContext context) {
  if (mesatate is ErroConfiguracoesMesaEstados) {
    return Text(mesatate.menssagem);
  }

  if (mesatate is CarregandoConfiguracoesProdutoEstados) {
    return Container(
        color: Colors.black26,
        width: MediaQuery.of(context).size.width * 0.9,
        height: MediaQuery.of(context).size.width * 0.8,
        child: const Center(
          child: CircularProgressIndicator(),
        ));
  }
  if (mesatate is CompletoConfiguracoesMesaEstados) {
    return Container(
      color: Colors.black26,
      width: MediaQuery.of(context).size.width * 0.9,
      height: MediaQuery.of(context).size.width * 0.8,
      child: Scrollbar(
        trackVisibility: true,
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: mesatate.lista.length,
          itemBuilder: (context, index) {
            final mesa = mesatate.lista[index];
            return ListTile(
              horizontalTitleGap: 18,
              contentPadding: const EdgeInsets.only(
                  left: 18, right: 18, top: 10, bottom: 10),
              title: Text(
                'Mesa ${mesa.numero}',
                style: const TextStyle(fontSize: 13),
              ),
              trailing: IconButton(
                      iconSize: 17,
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (_) {
                              return DetalhesMesaDialogComponente(mesa);
                            });
                      },
                      icon: const Icon(
                        Icons.description_sharp,
                      ),
                    ),
              
            );
          },
        ),
      ),
    );
  } else {
    return const Text('Erro Inesperado');
  }
}
