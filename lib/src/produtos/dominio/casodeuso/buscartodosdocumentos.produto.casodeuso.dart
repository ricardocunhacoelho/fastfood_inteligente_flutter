import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fastfood_inteligente_flutter/src/produtos/dominio/repositorio/iprodutos.repository.dart';

abstract class IBuscarTodosDocumentosProdutos {
  Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>> call();
}

class BuscarTodosDocumentosProdutos implements IBuscarTodosDocumentosProdutos {
  final IProdutoRepositorio repositorio;

  BuscarTodosDocumentosProdutos(this.repositorio);
  @override
  Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>> call() async {
    final documentos = await repositorio.buscarTodosDocumentos();
    return documentos;
  }
}
