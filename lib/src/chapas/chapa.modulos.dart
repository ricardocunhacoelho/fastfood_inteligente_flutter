import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fastfood_inteligente_flutter/src/chapas/dominio/casodeuso/adicionarchapa.casodeuso.dart';
import 'package:fastfood_inteligente_flutter/src/chapas/dominio/casodeuso/atualizar.estado.pedido.casodeuso.dart';
import 'package:fastfood_inteligente_flutter/src/chapas/dominio/casodeuso/atualizar.ordens.chapa.casodeuso.dart';
import 'package:fastfood_inteligente_flutter/src/chapas/dominio/casodeuso/atualizarordembase.casodeuso.dart';
import 'package:fastfood_inteligente_flutter/src/chapas/dominio/casodeuso/atualizarvaloreschapa.casodeuso.dart';
import 'package:fastfood_inteligente_flutter/src/chapas/dominio/casodeuso/buscar.chapaentidade.na.lista.casodeuso.dart';
import 'package:fastfood_inteligente_flutter/src/chapas/dominio/casodeuso/buscarordembase.casodeuso.dart';
import 'package:fastfood_inteligente_flutter/src/chapas/dominio/casodeuso/buscartodaschapas.casodeuso.dart';
import 'package:fastfood_inteligente_flutter/src/chapas/dominio/casodeuso/calcular.qual.chapa.deve.recebe.o.pedido.casodeuso.dart';
import 'package:fastfood_inteligente_flutter/src/chapas/dominio/casodeuso/deletarchapa.casodeuso.dart';
import 'package:fastfood_inteligente_flutter/src/chapas/dominio/casodeuso/gerarordem.casodeuso.dart';
import 'package:fastfood_inteligente_flutter/src/chapas/dominio/casodeuso/quantia.de.ordens.em.cada.chapa.casodeuso.dart';
import 'package:fastfood_inteligente_flutter/src/chapas/dominio/casodeuso/remover.ordem.chapa.dart';
import 'package:fastfood_inteligente_flutter/src/chapas/dominio/casodeuso/resetar.ordembase.casodeuso.dart';
import 'package:fastfood_inteligente_flutter/src/chapas/dominio/casodeuso/resetar.todos.pedidos.casodeuso.dart';
import 'package:fastfood_inteligente_flutter/src/chapas/dominio/casodeuso/vigiar.chapa.casodeuso.dart';
import 'package:fastfood_inteligente_flutter/src/chapas/dominio/irepositorio/ichapa.repositorio.dart';
import 'package:fastfood_inteligente_flutter/src/chapas/infraestrutura/externo/chapa.firestore.externo.fontededados.dart';
import 'package:fastfood_inteligente_flutter/src/chapas/infraestrutura/fontededados/ichapa.fontededados.dart';
import 'package:fastfood_inteligente_flutter/src/chapas/infraestrutura/repositorio/chapas.repositorio.dart';

import 'package:provider/provider.dart';

final chapaModulos = [
  Provider<FirebaseFirestore>.value(
    value: FirebaseFirestore.instance,
  ),
  Provider<IChapaFonteDeDados>(
      create: (context) => ChapaFirestore(context.read())),
  Provider<IChapaRepositorio>(
      create: (context) => ChapaRepositorio(context.read())),
  //usecases
  Provider<IAdicionarChapa>(
      create: (context) => AdicionarChapa(context.read())),
  Provider<IAtualizarOrdemBase>(
      create: (context) => AtualizarOrdemBase(context.read())),

  Provider<IAtualizarValoresChapa>(
      create: (context) => AtualizarValoresChapa(context.read())),
  Provider<IBuscarOrdemBase>(
      create: (context) => BuscarOrdemBase(context.read())),
  Provider<IBuscarTodasChapas>(
      create: (context) => BuscarTodasChapas(context.read())),
  Provider<IDeletarChapa>(create: (context) => DeletarChapa(context.read())),
  Provider<IQuantiaDeOrdensEmCadaChapa>(
      create: (context) => QuantiaDeOrdensEmCadaChapa()),
  Provider<ICalcularQualChapaDeveReceberOPedido>(
      create: (context) => CalcularQualChapaDeveReceberOPedido()),
  Provider<IGerarOrdem>(create: (context) => GerarOrdem()),
  Provider<IAtualizarOrdensChapa>(
      create: (context) => AtualizarOrdensChapa(context.read())),
  Provider<IBuscarChapaEntidadeNaLista>(
      create: (context) => BuscarChapaEntidadeNaLista()),
  Provider<IResetarOrdemBase>(
      create: (context) => ResetarOrdemBase(context.read())),
  Provider<IResetarTodosPedidos>(
      create: (context) => ResetarTodosPedidos(context.read())),
  Provider<IAtualizarEstadoPedido>(
      create: (context) => AtualizarEstadoPedido(context.read())),
  Provider<IVigiarChapa>(create: (context) => VigiarChapa(context.read())),
  Provider<IRemoverOrdemChapa>(
      create: (context) => RemoverOrdemChapa(context.read())),
];



// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:fastfood_inteligente_flutter/src/chapas/dominio/casodeuso/adicionarchapa.casodeuso.dart';
// import 'package:fastfood_inteligente_flutter/src/chapas/dominio/casodeuso/atualizarordembase.casodeuso.dart';
// import 'package:fastfood_inteligente_flutter/src/chapas/dominio/casodeuso/atualizarordenschapa.casodeuso.dart';
// import 'package:fastfood_inteligente_flutter/src/chapas/dominio/casodeuso/atualizarvaloreschapa.casodeuso.dart';
// import 'package:fastfood_inteligente_flutter/src/chapas/dominio/casodeuso/buscarchapa.casodeuso.dart';
// import 'package:fastfood_inteligente_flutter/src/chapas/dominio/casodeuso/buscarordembase.casodeuso.dart';
// import 'package:fastfood_inteligente_flutter/src/chapas/dominio/casodeuso/buscartodaschapas.casodeuso.dart';
// import 'package:fastfood_inteligente_flutter/src/chapas/dominio/casodeuso/buscartodosdocumentos.chapa.casodeuso.dart';
// import 'package:fastfood_inteligente_flutter/src/chapas/dominio/casodeuso/calcularqualchaparecebepedido.casodeuso.dart';
// import 'package:fastfood_inteligente_flutter/src/chapas/dominio/casodeuso/deletarchapa.casodeuso.dart';
// import 'package:fastfood_inteligente_flutter/src/chapas/dominio/casodeuso/gerarpedido.casodeuso.dart';
// import 'package:fastfood_inteligente_flutter/src/chapas/dominio/casodeuso/totalpedidostodaschapas.casodeuso.dart';
// import 'package:fastfood_inteligente_flutter/src/chapas/dominio/irepositorio/ichapa.repositorio.dart';
// import 'package:fastfood_inteligente_flutter/src/chapas/infraestrutura/externo/chapa.firestore.externo.fontededados.dart';
// import 'package:fastfood_inteligente_flutter/src/chapas/infraestrutura/fontededados/ichapa.fontededados.dart';
// import 'package:fastfood_inteligente_flutter/src/chapas/infraestrutura/repositorio/chapas.repositorio.dart';

// import 'package:provider/provider.dart';

// final chapaModulo = [
//   Provider<FirebaseFirestore>.value(
//     value: FirebaseFirestore.instance,
//   ),
//   Provider<IChapaFonteDeDados>(
//       create: (context) => ChapaFirestore(context.read())),
//   Provider<IChapaRepositorio>(
//       create: (context) => ChapaRepositorio(context.read())),
//   //usecases
//   Provider<IBuscarTodasChapas>(
//       create: (context) => BuscarTodasChapas(context.read())),
//   Provider<IAtualizarValoresChapa>(
//       create: (context) => AtualizarValoresChapa(context.read())),
//   Provider<IDeletarChapa>(create: (context) => DeletarChapa(context.read())),
//   Provider<IAdicionarChapa>(
//       create: (context) => AdicionarChapa(context.read())),
//   Provider<IBuscarChapa>(create: (context) => BuscarChapa(context.read())),
//   Provider<IAtualizarOrdensChapa>(
//       create: (context) => AtualizarOrdensChapa(context.read())),
//   Provider<IBuscarTodosDocumentosChapa>(
//       create: (context) => BuscarTodosDocumentosChapa(context.read())),
//   Provider<ICalcularQualChapaRecebePedido>(
//       create: (context) => CalcularQualChapaRecebePedido(context.read())),
//   Provider<IGerarPedido>(create: (context) => GerarPedido()),
//   Provider<ITotalPedidosTodasChapas>(
//       create: (context) => TotalPedidosTodasChapas(context.read())),
//   Provider<IBuscarOrdemBase>(
//       create: (context) => BuscarOrdemBase(context.read())),
//   Provider<IAtualizarOrdemBase>(
//       create: (context) => AtualizarOrdemBase(context.read())),
// ];
