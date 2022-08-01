import 'package:fastfood_inteligente_flutter/src/chapas/dominio/entidade/chapa.entidade.dart';
import 'package:fastfood_inteligente_flutter/src/chapas/dominio/objetosdevalor/ordem.objeto.dart';
import 'package:fastfood_inteligente_flutter/src/chapasdetrabalho/bloc/chapadetrabalho.bloc.dart';
import 'package:fastfood_inteligente_flutter/src/chapasdetrabalho/componentes/requisitar.deletar.pedido.dialog.componente.dart';
import 'package:fastfood_inteligente_flutter/src/chapasdetrabalho/eventos/selecaochapa.eventos.dart';
import 'package:fastfood_inteligente_flutter/src/chapasdetrabalho/paginas/componentes/detalhes.pedido.dialog.componente.dart';
import 'package:fastfood_inteligente_flutter/src/configuracoes/bloc/configuracoes.chapa.bloc.dart';
import 'package:fastfood_inteligente_flutter/src/configuracoes/estados/configuracoes.chapa.estados.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListaPedidosComponente extends StatefulWidget {
  final int numeroDaChapa;
  final EOrdermEstado estado;
  ListaPedidosComponente(this.numeroDaChapa, this.estado);
  @override
  _ListaPedidosComponenteState createState() =>
      new _ListaPedidosComponenteState();
}

class _ListaPedidosComponenteState extends State<ListaPedidosComponente> {
  var listChapas = [];
  var todasSolicitacoesCancelamento = [];
  @override
  Widget build(BuildContext context) {
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
        if (element.numerodachapa == widget.numeroDaChapa) {
          chapa = element;
        }
      });
    }

    return SingleChildScrollView(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: chapa.ordens.length,
        itemBuilder: (context, index) {
          final ordem = chapa.ordens[index];
          if (ordem.estado == EOrdermEstado.aguardando &&
              widget.estado == EOrdermEstado.aguardando) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: 100,
                    color: Colors.black38,
                    child: ListTile(
                      title: Padding(
                        padding: const EdgeInsets.only(
                            right: 10, top: 15, bottom: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Text('Pedido'),
                                SizedBox(height: 10),
                                Text('${ordem.id}')
                              ],
                            ),
                            SizedBox(width: 17),
                            Column(
                              children: [
                                Text('Status'),
                                SizedBox(height: 10),
                                Text('${ordem.estado.name}')
                              ],
                            ),
                            SizedBox(width: 30),
                            IconButton(
                                onPressed: () {
                                  showDialog(
                                      context: context,
                                      builder: (_) {
                                        return DetalhesPedidoDialogComponente(
                                            ordem);
                                      });
                                },
                                icon: const Icon(
                                    Icons.restore_from_trash_rounded)),
                            IconButton(
                                onPressed: () {
                                  context.read<ChapaDeTrabalhoBloc>().add(
                                      AtualizarEstadoPedidoChapaDeTrabalhoEventos(
                                          'atendendo', index, chapa));
                                },
                                icon: const Icon(
                                  Icons.check_box,
                                  // color: Colors.lightGreen,
                                )),
                            IconButton(
                                onPressed: () {
                                  showDialog(
                                      context: context,
                                      builder: (_) {
                                        return DetalhesPedidoDialogComponente(
                                            ordem);
                                      });
                                },
                                icon: const Icon(Icons.library_books)),

                            // Icon(Icons.check_box),
                            // Icon(Icons.check_box),
                            // Icon(Icons.check_box),
                          ],
                        ),
                      ),
                      subtitle: Row(),
                    ),
                  ),
                  const SizedBox(height: 25),
                ],
              ),
            );
          }
          if (ordem.estado == EOrdermEstado.atendendo &&
              widget.estado == EOrdermEstado.atendendo) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: 100,
                    color: Colors.black38,
                    child: ListTile(
                      title: Padding(
                        padding: const EdgeInsets.only(
                            right: 10, top: 15, bottom: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Text('Pedido'),
                                SizedBox(height: 10),
                                Text('${ordem.id}')
                              ],
                            ),
                            SizedBox(width: 17),
                            Column(
                              children: [
                                Text('Status'),
                                SizedBox(height: 10),
                                Text('${ordem.estado.name}')
                              ],
                            ),
                            SizedBox(width: 30),
                            IconButton(
                                onPressed: () {
                                  showDialog(
                                      context: context,
                                      builder: (_) {
                                        return RequisitarDeletarPedidoDialogComponente(
                                            chapa, ordem, index);
                                      });
                                },
                                icon: const Icon(
                                    Icons.restore_from_trash_rounded)),
                            IconButton(
                                onPressed: () {
                                  context.read<ChapaDeTrabalhoBloc>().add(
                                      AtualizarEstadoPedidoChapaDeTrabalhoEventos(
                                          'aguardando', index, chapa));
                                },
                                icon: const Icon(
                                  Icons.check_box,
                                  color: Colors.orangeAccent,
                                )),
                            IconButton(
                                onPressed: () {
                                  showDialog(
                                      context: context,
                                      builder: (_) {
                                        return DetalhesPedidoDialogComponente(
                                            ordem);
                                      });
                                },
                                icon: const Icon(Icons.library_books)),

                            // Icon(Icons.check_box),
                            // Icon(Icons.check_box),
                            // Icon(Icons.check_box),
                          ],
                        ),
                      ),
                      subtitle: Row(),
                    ),
                  ),
                  const SizedBox(height: 25),
                ],
              ),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
