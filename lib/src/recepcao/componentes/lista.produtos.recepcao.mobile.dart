import 'package:fastfood_inteligente_flutter/src/configuracoes/estados/configuracoes.produto.estados.dart';
import 'package:fastfood_inteligente_flutter/src/recepcao/componentes/contadorquantidade.entrada.componente.dart';
import 'package:fastfood_inteligente_flutter/src/recepcao/estados/entrada.estados.dart';
import 'package:flutter/material.dart';
ScrollController _controller = ScrollController();
Widget listaProdutosRecepcaoMobile(
        String pagina, ConfiguracoesProdutoEstados produtostate,EntradaEstados entradastates) =>
    Container(
      child: Column(children: [
        const SizedBox(height: 30),
        Text(
          pagina.toUpperCase(),
        ),
        
        const SizedBox(height: 25),
        if (entradastates is CarregaListaProdutosAdicionadosPedidoEntradaEstados && 
                  entradastates.produtos.isEmpty && pagina.toLowerCase() == 'sacola' )
          Center(child: Text('Sua sacola está vazia, selecione algum produto')),
        if (produtostate is CarregandoConfiguracoesProdutoEstados)
          const Center(child: CircularProgressIndicator()),
        if (produtostate is CompletoConfiguracoesProdutoEstados)
          Expanded(
            child: Scrollbar(
              controller: _controller,
              trackVisibility: true,
              thickness: 5, // Optional: Thickness
              radius: const Radius.circular(5), // Optional: Radius
              child: ListView.builder(
                controller: _controller,
                scrollDirection: Axis.vertical,
                physics: ScrollPhysics(),
                shrinkWrap: true,
                itemCount: entradastates is CarregaListaProdutosAdicionadosPedidoEntradaEstados && entradastates.produtos.isNotEmpty 
                && pagina.toLowerCase() == 'sacola' ? entradastates.produtos.length : produtostate.lista.length,
                itemBuilder: (context, index) {
                  final produto = entradastates is CarregaListaProdutosAdicionadosPedidoEntradaEstados && entradastates.produtos.isNotEmpty 
                && pagina.toLowerCase() == 'sacola' ? entradastates.produtos[index] : produtostate.lista[index];
                  if (entradastates is CarregaListaProdutosAdicionadosPedidoEntradaEstados && 
                  entradastates.produtos.isNotEmpty && pagina.toLowerCase() == 'sacola' ) {
                    return ListTile(
                      minLeadingWidth: 15,
                      horizontalTitleGap: 18,
                      contentPadding: const EdgeInsets.all(10),
                      trailing: Container(
                        alignment: Alignment.centerRight,
                        width: 150,
                        child: 
                        ContadorQuantidadeComponente(produto: produto),
                      ),
                      leading: Image.asset(
                        'assets/${produto.imagem}',
                        height: 55,
                        width: 55,
                        fit: BoxFit.fitWidth,
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
                      contentPadding: const EdgeInsets.all(10),
                      trailing: Container(
                        alignment: Alignment.centerRight,
                        width: 150,
                        child: ContadorQuantidadeComponente(produto: produto),
                      ),
                      leading: Image.asset(
                        'assets/${produto.imagem}',
                        height: 55,
                        width: 55,
                        fit: BoxFit.fitWidth,
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
          
      ]),
    );
