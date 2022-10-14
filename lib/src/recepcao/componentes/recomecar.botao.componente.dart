import 'package:fastfood_inteligente_flutter/src/chapas/dominio/objetosdevalor/ordem.objeto.dart';
import 'package:fastfood_inteligente_flutter/src/configuracoes/bloc/configuracoes.produto.bloc.dart';
import 'package:fastfood_inteligente_flutter/src/recepcao/bloc/entrada.bloc.dart';
import 'package:fastfood_inteligente_flutter/src/recepcao/componentes/recomecar.dialog.componente.dart';
import 'package:fastfood_inteligente_flutter/src/recepcao/estados/entrada.estados.dart';
import 'package:fastfood_inteligente_flutter/src/recepcao/modelo/entrada.ordem.model.dart';
import 'package:fastfood_inteligente_flutter/src/produtos/dominio/casodeuso/checarsefoiadicionadoproduto.casodeuso.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RecomecarBotao extends StatefulWidget {
  final double largura;
  final double altura;

  const RecomecarBotao({Key? key, required this.largura, required this.altura})
      : super(key: key);

  @override
  State<RecomecarBotao> createState() => _RecomecarBotaoState();
}

bool habilitar = false;

class _RecomecarBotaoState extends State<RecomecarBotao> {
  Ordem ordemInicial = Ordem(
      produtos: [],
      embalarParaViajem: false,
      estado: EOrdermEstado.aguardando,
      id: 'ordem1',
      datahora: DateTime.now(),
      observacao: '',
      posicao: 1);

  final IChecarSeFoiAdicionadoProduto checarSeFoiAdicionadoProduto =
      ChecarSeFoiAdicionadoProduto();

  double tamanho = 90;

  @override
  Widget build(BuildContext context) {
    final produtobloc = context.watch<ConfiguracoesProdutoBloc>();
    final produtostate = produtobloc.state;
    final entradabloc = context.watch<EntradaBloc>();
    final entradastates = entradabloc.state;
    if (entradastates is CarregandoOrdemBaseEstados) {
      ordemInicial = EntradaOrdemModelo.empty();
    }
    if (entradastates is CompletoOrdemBaseEstados) {
      ordemInicial = entradastates.lista.first;
    }
    final valor = checarSeFoiAdicionadoProduto.call(produtostate);
    if (valor > 0) {
      setState(() {
        habilitar = true;
      });
    }

    return Container(
      margin: EdgeInsets.all(15),
      width: widget.largura,
      height: widget.altura,
      decoration: BoxDecoration(
        color: habilitar ? Colors.orangeAccent : Colors.black12,
        borderRadius: BorderRadius.all(
          Radius.circular(5),
        ),
      ),
      child: TextButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (_) {
                  return RecomecarDialogComponente();
                });

            setState(() {
              valor;
            });
          },
          child: const Center(
            child: Text(
              'Recomeçar',
              style: TextStyle(color: Colors.white, fontSize: 10),
            ),
          )),
    );
  }
}
