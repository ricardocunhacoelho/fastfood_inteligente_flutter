import 'package:fastfood_inteligente_flutter/src/chapasdetrabalho/estados/selecaochapa.estados.dart';
import 'package:fastfood_inteligente_flutter/src/configuracoes/componentes/solicitacoes/confirmar.remover.pedido.dialog.componente.dart';
import 'package:fastfood_inteligente_flutter/src/configuracoes/componentes/solicitacoes/detalhes.solicitacao.remover.pedido.dialog.componente.dart';
import 'package:fastfood_inteligente_flutter/src/configuracoes/componentes/solicitacoes/negar.pedido.cancelamento.dialog.componente.dart';

import 'package:flutter/material.dart';

Widget listaSolicitacoesCancelamentoConfiguracoes(
    ChapaDeTrabalhoEstados solicitacoesState, BuildContext context) {
  if (solicitacoesState is ErroBuscarSolicitacoesConfiguracoesChapaEstados) {
    return Container(child: Center(child: Text(solicitacoesState.erro)));
  }

  if (solicitacoesState
      is CarregandoBuscarSolicitacoesConfiguracoesChapaEstados) {
    return Container(child: Center(child: CircularProgressIndicator()));
  }

  if (solicitacoesState
      is CompletoBuscarSolicitacoesConfiguracoesChapaEstados) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: solicitacoesState.lista.length,
      itemBuilder: (context, index) {
        final solicitacao = solicitacoesState.lista[index];
        return ListTile(
          contentPadding:
              const EdgeInsets.only(left: 18, right: 18, top: 10, bottom: 10),
          trailing: Container(
            width: 170,
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
                            return DetalhesSolicitacaoRemoverPedidoDialog(
                                solicitacao);
                          });
                    },
                    icon: const Icon(Icons.library_books_rounded)),
                IconButton(
                  iconSize: 17,
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (_) {
                          return ConfirmarRemoverPedidoDialog(solicitacao);
                        });
                  },
                  icon: const Icon(Icons.check),
                ),
                IconButton(
                  iconSize: 17,
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (_) {
                          return NegarPedidoCancelamentoDialog(solicitacao);
                        });
                  },
                  icon: const Icon(Icons.close),
                ),
              ],
            ),
          ),
          title: Text('Solicitação ${solicitacao.chapa.titulo}',
              style: const TextStyle(fontSize: 15)),
          subtitle: Text('Ordem ${solicitacao.ordem.id}'),
        );
      },
    );
  } else {
    return Text('Erro inesperado');
  }
}
