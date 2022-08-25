import 'package:fastfood_inteligente_flutter/src/chapas/chapa.modulos.dart';
import 'package:fastfood_inteligente_flutter/src/chapasdetrabalho/paginas/selecione.sua.chapa.pagina.dart';
import 'package:fastfood_inteligente_flutter/src/configuracoes/configuracoes.chapa.modulos.dart';
import 'package:fastfood_inteligente_flutter/src/configuracoes/configuracoes.produto.modulos.dart';
import 'package:fastfood_inteligente_flutter/src/configuracoes/pagina/configuracoes.page.dart';
import 'package:fastfood_inteligente_flutter/src/entrada/entrada.modulos.dart';
import 'package:fastfood_inteligente_flutter/src/entrada/pagina/entrada.pagina.dart';
import 'package:fastfood_inteligente_flutter/src/produtos/produtos.modulos.dart';
import 'package:fastfood_inteligente_flutter/src/chapasdetrabalho/paginas/chapa.pagina.dart';
import 'package:fastfood_inteligente_flutter/src/chapasdetrabalho/selecao.chapa.modulos.dart';
import 'package:fastfood_inteligente_flutter/src/tela_chamada_de_pedidos/paginas/tela.chamada.de.pedidos.pagina.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ...chapaModulos,
        ...produtosModulos,
        ...configuracoeProdutoModulos,
        ...configuracoesChapaModulos,
        ...entradaModulos,
        ...ChapaDeTrabalhoModulos,
      ],
      child: MaterialApp(
        routes: <String, WidgetBuilder>{
          '/': (_) => TelaChamadaDePedidos(),
          ChapaPagina.routeName: (_) => ChapaPagina(),
          '/checkin': (_) => Container(),
        },
        title: 'Flutter Demo',
        theme: ThemeData.dark(),
      ),
    );
  }
}
