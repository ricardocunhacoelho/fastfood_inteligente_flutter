import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fastfood_inteligente_flutter/src/produtos/dominio/casodeuso/adicionar.produto.casodeuso.dart';
import 'package:fastfood_inteligente_flutter/src/produtos/dominio/casodeuso/adicionarquantidade.casodeuso.dart';
import 'package:fastfood_inteligente_flutter/src/produtos/dominio/casodeuso/buscartodosdocumentos.produto.casodeuso.dart';
import 'package:fastfood_inteligente_flutter/src/produtos/dominio/casodeuso/calcularprecopedidoprodutos.casodeuso.dart';
import 'package:fastfood_inteligente_flutter/src/produtos/dominio/casodeuso/deletar.produto.casodeuso.dart';
import 'package:fastfood_inteligente_flutter/src/produtos/dominio/casodeuso/editar.produto.casodeuso.dart';
import 'package:fastfood_inteligente_flutter/src/produtos/dominio/casodeuso/resetar.produtos.receberam.incremento.quantidade.casodeuso.dart';
import 'package:fastfood_inteligente_flutter/src/produtos/dominio/casodeuso/subtrairquantidade.casodeuso.dart';
import 'package:fastfood_inteligente_flutter/src/produtos/dominio/repositorio/iprodutos.repository.dart';
import 'package:fastfood_inteligente_flutter/src/produtos/dominio/casodeuso/buscartodosprodutos.casodeuso.dart';
import 'package:fastfood_inteligente_flutter/src/produtos/infraestrutura/fontededados/iproduto.data.source.dart';
import 'package:fastfood_inteligente_flutter/src/produtos/infraestrutura/externo/produto.firestore.external.data.source.dart';
import 'package:fastfood_inteligente_flutter/src/produtos/infraestrutura/repositorio/produtos.repository.dart';
import 'package:fastfood_inteligente_flutter/src/usuarios/dominio/casodeuso/autentica.usuario.dart';
import 'package:fastfood_inteligente_flutter/src/usuarios/dominio/casodeuso/buscar.todos.usuarios.dart';
import 'package:fastfood_inteligente_flutter/src/usuarios/dominio/casodeuso/registra.usuario.dart';
import 'package:fastfood_inteligente_flutter/src/usuarios/dominio/repositorio/iusuario.repositorio.dart';
import 'package:fastfood_inteligente_flutter/src/usuarios/infraestrutura/externo/usuario.firebase.externo.dart';
import 'package:fastfood_inteligente_flutter/src/usuarios/infraestrutura/fontededados/iusuario.fontededados.dart';
import 'package:fastfood_inteligente_flutter/src/usuarios/infraestrutura/repositorio/usuario.repositorio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';

final usuariosModulos = [
  Provider<FirebaseFirestore>.value(
    value: FirebaseFirestore.instance,
  ),
  Provider<FirebaseAuth>.value(
    value: FirebaseAuth.instance,
  ),
  Provider<IUsuarioFonteDeDados>(
      create: (context) => UsuarioFirebase(context.read(), context.read())),
  Provider<IUsuarioRepositorio>(
      create: (context) => UsuarioRepositorio(context.read())),
  //casosdeuso
  Provider<IAutenticaUsuario>(
      create: (context) => AutenticaUsuario(context.read())),
  Provider<IRegistrarUsuario>(
      create: (context) => RegistrarUsuario(context.read())),
  Provider<IBuscarUsuario>(
      create: (context) => BuscarUsuario(context.read())),
];
