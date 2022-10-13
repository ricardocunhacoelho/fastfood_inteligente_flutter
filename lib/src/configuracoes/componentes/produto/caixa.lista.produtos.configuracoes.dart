import 'package:fastfood_inteligente_flutter/src/configuracoes/componentes/produto/deletar.produto.dialog.componente.dart';
import 'package:fastfood_inteligente_flutter/src/configuracoes/componentes/produto/detalhes.produto.dialog.componente.dart';
import 'package:fastfood_inteligente_flutter/src/configuracoes/componentes/produto/editar.produto.dialog.componente.dart';
import 'package:fastfood_inteligente_flutter/src/configuracoes/estados/configuracoes.produto.estados.dart';
import 'package:flutter/material.dart';

Widget listaProdutosConfiguracoes(
    ConfiguracoesProdutoEstados produtostate, BuildContext context) {
  if (produtostate is ErroConfiguracoesProdutoEstados) {
    return Text(produtostate.menssagem);
  }

  if (produtostate is CarregandoConfiguracoesProdutoEstados) {
    return Container(
        color: Colors.black26,
        width: MediaQuery.of(context).size.width * 0.9,
        height: MediaQuery.of(context).size.width * 0.8,
        child: const Center(
          child: CircularProgressIndicator(),
        ));
  }
  if (produtostate is CompletoConfiguracoesProdutoEstados) {
    return Container(
      color: Colors.black26,
      width: MediaQuery.of(context).size.width * 0.9,
      height: MediaQuery.of(context).size.width * 0.8,
      child: Scrollbar(
        isAlwaysShown: true,
        showTrackOnHover: true,
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: produtostate.lista.length,
          itemBuilder: (context, index) {
            final produto = produtostate.lista[index];
            return ListTile(
              horizontalTitleGap: 18,
              contentPadding: const EdgeInsets.only(
                  left: 18, right: 18, top: 10, bottom: 10),
              trailing: Container(
                width: 150,
                alignment: Alignment.centerRight,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      iconSize: 17,
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (_) {
                              return DetalhesProdutoDialogComponente(produto);
                            });
                      },
                      icon: const Icon(
                        Icons.description_sharp,
                      ),
                    ),
                    IconButton(
                      iconSize: 17,
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (_) {
                              return EditarProdutoDialogComponente(produto);
                            });
                      },
                      icon: const Icon(
                        Icons.edit,
                      ),
                    ),
                    IconButton(
                      iconSize: 17,
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (_) {
                              return DeletarProdutoDialogComponente(produto);
                            });
                      },
                      icon: const Icon(
                        Icons.remove,
                      ),
                    ),
                  ],
                ),
              ),
              leading: Image.asset(
                'assets/${produto.imagem}',
                height: 60,
                width: 60,
                fit: BoxFit.contain,
              ),
              title: Text(
                '${produto.titulo}',
                style: const TextStyle(fontSize: 13),
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
