import 'package:fastfood_inteligente_flutter/src/cadastro/cadastro.modulo.dart';
import 'package:fastfood_inteligente_flutter/src/cadastro/pagina/cadastro.pagina.dart';
import 'package:fastfood_inteligente_flutter/src/chapas/chapa.modulos.dart';
import 'package:fastfood_inteligente_flutter/src/chapasdetrabalho/paginas/selecione.sua.chapa.pagina.dart';
import 'package:fastfood_inteligente_flutter/src/configuracoes/configuracoes.chapa.modulos.dart';
import 'package:fastfood_inteligente_flutter/src/configuracoes/configuracoes.mesa.modulo.dart';
import 'package:fastfood_inteligente_flutter/src/configuracoes/configuracoes.produto.modulos.dart';
import 'package:fastfood_inteligente_flutter/src/configuracoes/pagina/configuracoes.page.dart';
import 'package:fastfood_inteligente_flutter/src/gerente/pagina/home.gerente.pagina.dart';
import 'package:fastfood_inteligente_flutter/src/inicio/pagina/home.page.dart';
import 'package:fastfood_inteligente_flutter/src/login/login.modulo.dart';
import 'package:fastfood_inteligente_flutter/src/login/pagina/login.pagina.dart';
import 'package:fastfood_inteligente_flutter/src/mesas/mesas.modulos.dart';
import 'package:fastfood_inteligente_flutter/src/produtos/produtos.modulos.dart';
import 'package:fastfood_inteligente_flutter/src/chapasdetrabalho/paginas/chapa.pagina.dart';
import 'package:fastfood_inteligente_flutter/src/chapasdetrabalho/selecao.chapa.modulos.dart';
import 'package:fastfood_inteligente_flutter/src/recepcao/entrada.modulos.dart';
import 'package:fastfood_inteligente_flutter/src/recepcao/pagina/entrada.pagina.dart';
import 'package:fastfood_inteligente_flutter/src/tela_chamada_de_pedidos/paginas/tela.chamada.de.pedidos.pagina.dart';
import 'package:fastfood_inteligente_flutter/src/usuarios/usuarios.modulos.dart';
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
        ...usuariosModulos,
        ...loginModulo,
        ...cadastroModulo,
        ...mesaModulos,
        ...configuracoeMesaModulos,
      ],
      child: MaterialApp(
        routes: <String, WidgetBuilder>{
          '/': (_) => const LoginPagina(),
          ChapaPagina.routeName: (_) => const ChapaPagina(),
          '/gerente': (_) => const HomePage(),
          '/config': (_) => const ConfiguracoesPage(),
          '/chapeiro': (_) => const SelecioneSuaChapaPagina(),
          '/registraPedidos': (_) => const EntradaPagina(),
          '/avocaClientes': (_) => const TelaChamadaDePedidosPage(),
          '/caixa': (_) => const CadastroPagina(),
          '/gerentepage': (_) => const HomeGerente(),
        },
        title: 'Flutter Demo',
        theme: ThemeData.light(),
        darkTheme: ThemeData(colorSchemeSeed: const Color.fromARGB(255, 10, 10, 9)),
      ),
    );
  }
}
