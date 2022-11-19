import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fastfood_inteligente_flutter/src/mesas/dominio/casodeuso/adicionarmesa.casodeuso.dart';
import 'package:fastfood_inteligente_flutter/src/mesas/dominio/casodeuso/buscar.todas.mesas.casodeuso.dart';
import 'package:fastfood_inteligente_flutter/src/mesas/dominio/casodeuso/removermesa.casodeuso.dart';
import 'package:fastfood_inteligente_flutter/src/mesas/dominio/repositorio/imesa.repositorio.dart';
import 'package:fastfood_inteligente_flutter/src/mesas/infraestrutura/externo/mesa.firestore.externo.dart';
import 'package:fastfood_inteligente_flutter/src/mesas/infraestrutura/fontededados/mesa.fontededados.dart';
import 'package:fastfood_inteligente_flutter/src/mesas/infraestrutura/repositorio/mesa.repositorio.dart';

import 'package:provider/provider.dart';

final mesaModulos = [
  Provider<FirebaseFirestore>.value(
    value: FirebaseFirestore.instance,
  ),
  Provider<IMesaFonteDeDados>(
      create: (context) => MesaFirestore(context.read())),
  Provider<IMesaRepositorio>(
      create: (context) => MesaRepositorio(context.read())),
  //casosdeuso
  Provider<IAdicionarMesa>(create: (context) => AdicionarMesa(context.read())),
  Provider<IBuscarTodasMesas>(
      create: (context) => BuscarTodasMesas(context.read())),
  Provider<IRemoverMesa>(
      create: (context) => RemoverMesa(context.read())),
];
