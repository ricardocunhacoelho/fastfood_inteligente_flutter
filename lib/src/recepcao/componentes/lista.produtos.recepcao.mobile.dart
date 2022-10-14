import 'package:fastfood_inteligente_flutter/src/configuracoes/estados/configuracoes.produto.estados.dart';
import 'package:fastfood_inteligente_flutter/src/recepcao/componentes/contadorquantidade.entrada.componente.dart';
import 'package:flutter/material.dart';

Widget listaProdutosRecepcaoMobile(
        String pagina, ConfiguracoesProdutoEstados produtostate) =>
    Container(
      child: Column(children: [
        const SizedBox(height: 30),
        Text(
          pagina.toUpperCase(),
        ),
        const SizedBox(height: 25),
        if (produtostate is CarregandoConfiguracoesProdutoEstados)
          const Center(child: CircularProgressIndicator()),
        if (produtostate is CompletoConfiguracoesProdutoEstados)
          Expanded(
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
