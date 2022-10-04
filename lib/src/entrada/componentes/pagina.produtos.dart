import 'package:fastfood_inteligente_flutter/src/chapas/dominio/objetosdevalor/ordem.objeto.dart';
import 'package:fastfood_inteligente_flutter/src/configuracoes/estados/configuracoes.produto.estados.dart';
import 'package:fastfood_inteligente_flutter/src/entrada/componentes/contadorquantidade.entrada.componente.dart';
import 'package:flutter/material.dart';

Widget paginaProdutos(String pagina, ConfiguracoesProdutoEstados produtostate,
        bool habilitar, Ordem ordemInicial) =>
    Container(
      child: Column(children: [
        SizedBox(height: 40),
        Text(
          pagina.toUpperCase(),
          style: TextStyle(fontSize: 20),
        ),
        SizedBox(height: 15),
        if (produtostate is CarregandoConfiguracoesProdutoEstados)
          Center(child: CircularProgressIndicator()),
        if (produtostate is CompletoConfiguracoesProdutoEstados)
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 100.0),
              child: Scrollbar(
                showTrackOnHover: true,
                isAlwaysShown: true,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: produtostate.lista.length,
                  itemBuilder: (context, index) {
                    final produto = produtostate.lista[index];
                    if (pagina.toLowerCase() == 'todos') {
                      return ListTile(
                        horizontalTitleGap: 18,
                        contentPadding: EdgeInsets.all(5),
                        trailing: Container(
                          alignment: Alignment.centerRight,
                          width: 150,
                          child: ContadorQuantidadeComponente(produto: produto),
                        ),
                        leading: Image.asset(
                          'assets/${produto.imagem}',
                          height: 80,
                          width: 80,
                          fit: BoxFit.fitWidth,
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              '${produto.descricao}',
                              style: TextStyle(fontSize: 11),
                            ),
                          ],
                        ),
                        title: Text(
                          '${produto.titulo} R\$${produto.preco}',
                          style: TextStyle(fontSize: 13),
                        ),
                      );
                    }
                    if (produto.categoria.name == pagina.toLowerCase()) {
                      return ListTile(
                        minLeadingWidth: 15,
                        horizontalTitleGap: 18,
                        contentPadding: EdgeInsets.all(30),
                        trailing: Container(
                          alignment: Alignment.centerRight,
                          width: 150,
                          child: ContadorQuantidadeComponente(produto: produto),
                        ),
                        leading: Image.asset(
                          'assets/${produto.imagem}',
                          height: 80,
                          width: 80,
                          fit: BoxFit.fitWidth,
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              '${produto.descricao}',
                              style: TextStyle(fontSize: 11),
                            ),
                          ],
                        ),
                        title: Text(
                          '${produto.titulo} R\$${produto.preco}',
                          style: TextStyle(fontSize: 13),
                        ),
                      );
                    } else {
                      return Container();
                    }
                  },
                ),
              ),
            ),
          ),
        // Padding(
        //   padding: const EdgeInsets.only(bottom: 20.0, top: 15.0),
        //   child: Container(
        //     width: 80,
        //     height: 80,
        //     child: FloatingActionButton(
        //       onPressed: () {},
        //       child: Icon(Icons.check),
        //     ),
        //   ),
        // ),
        SizedBox(height: 15)
      ]),
    );
