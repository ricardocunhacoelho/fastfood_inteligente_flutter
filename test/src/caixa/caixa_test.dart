import 'package:fastfood_inteligente_flutter/src/produtos/dominio/entidade/produto.entidade.dart';
import 'package:fastfood_inteligente_flutter/src/produtos/modelos/produto.modelo.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('buscar todos os produtos consumidos pelos clientes, traz todas as resoluções do controle', () {
    double conta = 0;
    double pagoProdutos = 0;
    List<ProdutoModelo> produtos = [];
    List clientes = [
      {
        'nome': 'ricardo',
        'consumido': [
          ProdutoModelo(
              id: 'id',
              categoria: EProdutoCategorias.lanche,
              titulo: 'ricardotitulo',
              imagem: 'imagem',
              descricao: 'descricao',
              preco: 13.0,
              quantidade: 2)
        ],
      },
      {
        'nome': 'guilherme',
        'consumido': [
          ProdutoModelo(
              id: 'id2',
              categoria: EProdutoCategorias.lanche,
              titulo: 'guilhermetitulo',
              imagem: 'imagem',
              descricao: 'descricao',
              preco: 10.0,
              quantidade: 2)
        ],
      },
      {
        'nome': 'hugo',
        'consumido': [
          ProdutoModelo(
              id: 'id',
              categoria: EProdutoCategorias.lanche,
              titulo: 'hugotitulo',
              imagem: 'imagem',
              descricao: 'descricao',
              preco: 4,
              quantidade: 1)
        ],
      },
    ];

    bool? valueByKey(String id, List<ProdutoModelo> produtos) {
      for (final entry in produtos) {
        if (entry.id.contains(id)) return true;
      }
    }

    void changeValue(List<dynamic> toChange, String id,
        List<ProdutoModelo> listProdutoEntidade, int quantidade) {
      if (valueByKey(id, listProdutoEntidade) == true) {
        for (final entry in listProdutoEntidade) {
          if (entry.id.contains(id)) toChange.add(entry);
        }
        var indice =
            listProdutoEntidade.indexWhere((e) => toChange.contains(e));
        listProdutoEntidade[indice] = listProdutoEntidade[indice].copyWith(
            quantidade: listProdutoEntidade[indice].quantidade + quantidade);
      }
    }

    Map mesa3 = {
      'clientes': clientes,
      'numero': 3,
      'conta': {
        'pago': {
          'produtos': [
            ProdutoModelo(
                id: 'id',
                categoria: EProdutoCategorias.lanche,
                titulo: 'hugotitulo',
                imagem: 'imagem',
                descricao: 'descricao',
                preco: 4,
                quantidade: 1)
          ],
          'valor': 0,
        }
      }
    };
    // puxa valor total da conta
    List clientesmesa3 = mesa3['clientes'];
    for (final entry in clientesmesa3) {
      entry['consumido'].forEach((element) {
        conta += element.preco * element.quantidade;
      });
    }

    // subtrai valor pago na mesa
    List produtosPg = mesa3['conta']['pago']['produtos'];
    int valorPgTotal = mesa3['conta']['pago']['valor'];

    //junta todos os produtos
    for (final entry in clientes) {
      entry['consumido'].forEach((element) {
        bool? adicionar = valueByKey(element.id, produtos);
        if (adicionar == true) {
          changeValue([], element.id, produtos, element.quantidade);
        } else {
          produtos.add(element);
        }
      });
    }
    print('conta total da mesa3 ${conta}');

    if(produtosPg.isNotEmpty){
       produtosPg.forEach((element) {
        pagoProdutos += element.preco * element.quantidade;
      print('produto pago na mesa3 ${element.titulo}');
    });
    }
   
    print('valor ja pago ${pagoProdutos}');
    print('valor que falta pagar ${conta - pagoProdutos}');
    // print(produtos[1].quantidade);
    // print(produtos.first.quantidade);

    //print(produtos[0].titulo);
  });
}