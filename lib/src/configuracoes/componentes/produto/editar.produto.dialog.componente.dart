import 'package:fastfood_inteligente_flutter/src/configuracoes/bloc/configuracoes.produto.bloc.dart';
import 'package:fastfood_inteligente_flutter/src/configuracoes/eventos/configuracoes.produto.eventos.dart';
import 'package:fastfood_inteligente_flutter/src/configuracoes/modelo/configuracoes.produto.modelo.dart';
import 'package:fastfood_inteligente_flutter/src/produtos/dominio/entidade/produto.entidade.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditarProdutoDialogComponente extends StatefulWidget {
  final ProdutoEntidade produtoEntidade;
  EditarProdutoDialogComponente(this.produtoEntidade);
  @override
  _EditarProdutoDialogComponenteState createState() =>
      new _EditarProdutoDialogComponenteState();
}

class _EditarProdutoDialogComponenteState
    extends State<EditarProdutoDialogComponente> {
  var produto = ConfiguracoesProdutoModelo.empty();
  @override
  void initState() {
    super.initState();
    produto = ConfiguracoesProdutoModelo.converter(widget.produtoEntidade);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextFormField(
            initialValue: produto.titulo,
            onChanged: (value) {
              produto = produto.copyWith(titulo: value);
              produto = produto.copyWith(id: 'id${value}');
            },
            decoration: InputDecoration(
              labelText: 'Produto',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 10),
          TextFormField(
            initialValue: produto.descricao,
            onChanged: (value) => produto = produto.copyWith(descricao: value),
            decoration: InputDecoration(
              labelText: 'Descrição',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 10),
          TextFormField(
            initialValue: produto.preco.toString(),
            onChanged: (value) => produto = produto.copyWith(
              preco: double.tryParse(value),
            ),
            decoration: InputDecoration(
              labelText: 'Preço',
              border: OutlineInputBorder(),
            ),
          ),
          DropdownButton<String>(
            value: produto.categoria.name,
            onChanged: (String? newValue) {
              setState(() {
                produto = produto.copyWith(
                    categoria: EProdutoCategorias.values
                        .firstWhere((element) => element.name == newValue));
              });
            },
            items: <String>['lanche', 'bebida', 'sobremesa', 'combo']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ],
      ),
      actions: <Widget>[
        TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Cancelar')),
        TextButton(
            onPressed: () {
              context
                  .read<ConfiguracoesProdutoBloc>()
                  .add(EditarProdutoConfiguracoesEventos(produto));
              Navigator.pop(context);
            },
            child: Text('Salvar')),
      ],
    );
  }
}
