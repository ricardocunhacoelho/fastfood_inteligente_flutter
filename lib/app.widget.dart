import 'package:fastfood_inteligente_flutter/src/chapas/chapa.modulos.dart';
import 'package:fastfood_inteligente_flutter/src/chapasdetrabalho/paginas/selecione.sua.chapa.pagina.dart';
import 'package:fastfood_inteligente_flutter/src/configuracoes/configuracoes.chapa.modulos.dart';
import 'package:fastfood_inteligente_flutter/src/configuracoes/configuracoes.produto.modulos.dart';
import 'package:fastfood_inteligente_flutter/src/configuracoes/pagina/configuracoes.page.dart';
import 'package:fastfood_inteligente_flutter/src/inicio/pagina/home.page.dart';
import 'package:fastfood_inteligente_flutter/src/produtos/produtos.modulos.dart';
import 'package:fastfood_inteligente_flutter/src/chapasdetrabalho/paginas/chapa.pagina.dart';
import 'package:fastfood_inteligente_flutter/src/chapasdetrabalho/selecao.chapa.modulos.dart';
import 'package:fastfood_inteligente_flutter/src/recepcao/entrada.modulos.dart';
import 'package:fastfood_inteligente_flutter/src/recepcao/pagina/entrada.pagina.dart';
import 'package:fastfood_inteligente_flutter/src/tela_chamada_de_pedidos/paginas/tela.chamada.de.pedidos.pagina.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'src/recepcao/pagina/entrada.web.responsivo.dart';

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
          '/': (_) => const HomePage(),
          ChapaPagina.routeName: (_) => const ChapaPagina(),
          '/config': (_) => const ConfiguracoesPage(),
          '/selecionesuachapa': (_) => const SelecioneSuaChapaPagina(),
          '/entrada': (_) => const EntradaPagina(),
          '/chamadapedidos': (_) => const TelaChamadaDePedidosPage(),
          '/entradachrome': (_) => const EntradaWebResponsivo(),
        },
        title: 'Flutter Demo',
        theme: ThemeData.dark(),
        darkTheme: ThemeData(colorSchemeSeed: Colors.orange),
      ),
    );
  }
}
