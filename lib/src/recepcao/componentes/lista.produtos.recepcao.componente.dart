import 'package:fastfood_inteligente_flutter/src/configuracoes/estados/configuracoes.produto.estados.dart';
import 'package:fastfood_inteligente_flutter/src/recepcao/componentes/contadorquantidade.entrada.componente.dart';
import 'package:fastfood_inteligente_flutter/src/recepcao/estados/entrada.estados.dart';

import 'package:flutter/material.dart';

ScrollController controller = ScrollController();

Widget listaProdutosRecepcaoWeb(
        String pagina, ConfiguracoesProdutoEstados produtostate,EntradaEstados entradastates) =>
    Container(
      child: Column(children: [
        const SizedBox(height: 40),
        Text(
          pagina.toUpperCase(),
          style: const TextStyle(fontSize: 20),
        ),
        const SizedBox(height: 20),
         if (!(entradastates is CarregaListaProdutosAdicionadosPedidoEntradaEstados) && 
                  pagina.toLowerCase() == 'sacola' )
          const Center(child: Text('Sua sacola está vazia, selecione algum produto')),
        if (produtostate is CarregandoConfiguracoesProdutoEstados)
          const Center(child: CircularProgressIndicator()),
        if (produtostate is CompletoConfiguracoesProdutoEstados)
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 100.0),
              child: Scrollbar(
                controller: controller,
                trackVisibility: true,
                child: ListView.builder(
                  controller: controller,
                  shrinkWrap: true,
                itemCount: entradastates is CarregaListaProdutosAdicionadosPedidoEntradaEstados && entradastates.produtos.isNotEmpty 
                && pagina.toLowerCase() == 'sacola' ? entradastates.produtos.length : produtostate.lista.length,
                itemBuilder: (context, index) {
                  final produto = entradastates is CarregaListaProdutosAdicionadosPedidoEntradaEstados && entradastates.produtos.isNotEmpty 
                && pagina.toLowerCase() == 'sacola' ? entradastates.produtos[index] : produtostate.lista[index];
                  if (entradastates is CarregaListaProdutosAdicionadosPedidoEntradaEstados && 
                  entradastates.produtos.isNotEmpty && pagina.toLowerCase() == 'sacola' ) {
                      return ListTile(
                        horizontalTitleGap: 18,
                        contentPadding: const EdgeInsets.only(
                            left: 18, right: 18, top: 20, bottom: 20),
                        trailing: Container(
                          alignment: Alignment.centerRight,
                          width: 150,
                          child: ContadorQuantidadeComponente(produto: produto),
                        ),
                        leading: Image.asset(
                          'assets/${produto.imagem}',
                          height: 160,
                          width: 160,
                          fit: BoxFit.contain,
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 5),
                            Text(
                              produto.descricao,
                              style: const TextStyle(fontSize: 11),
                            ),
                          ],
                        ),
                        title: Text(
                          '${produto.titulo} R\$${produto.preco}',
                          style: const TextStyle(fontSize: 13),
                        ),
                      );
                    }
                    if (produto.categoria.name == pagina.toLowerCase()) {
                      return ListTile(
                        minLeadingWidth: 15,
                        horizontalTitleGap: 18,
                        contentPadding: const EdgeInsets.only(
                            left: 18, right: 18, top: 20, bottom: 20),
                        trailing: Container(
                          alignment: Alignment.centerRight,
                          width: 150,
                          child: ContadorQuantidadeComponente(produto: produto),
                        ),
                        leading: Image.asset(
                          'assets/${produto.imagem}',
                          height: 160,
                          width: 160,
                          fit: BoxFit.contain,
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 5),
                            Text(
                              produto.descricao,
                              style: const TextStyle(fontSize: 11),
                            ),
                          ],
                        ),
                        title: Text(
                          '${produto.titulo} R\$${produto.preco}',
                          style: const TextStyle(fontSize: 13),
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
        const SizedBox(height: 15)
      ]),
    );
