import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fastfood_inteligente_flutter/src/produtos/infraestrutura/fontededados/iproduto.data.source.dart';

class ProdutoFirestore implements IProdutoDataSource {
  final FirebaseFirestore firestore;
  ProdutoFirestore(this.firestore);
  @override
  Stream<List<Map>> buscarTodosProdutos() {
    final ref = firestore.collection('queue');
    final snapshots = ref.snapshots();

    return snapshots.map((e) => e.docs).map(_convert);
  }

  List<Map> _convert(List<QueryDocumentSnapshot<Map<String, dynamic>>> docs) {
    return docs
        .map(
          (documents) => {
            'id': documents.id,
            ...documents.data(),
          },
        )
        .toList();
  }

  @override
  Future<void> adicionarProduto(Map<String, dynamic> map) async {
    final ref = firestore.collection('queue');
    map.remove('id');
    await ref.add(map);
  }

  @override
  Future<void> deletarProdutoCasodeUso(Map<String, dynamic> map) async {
    final ref = firestore.collection('queue');
    final doc = ref.doc(map['id']);
    await doc.delete();
  }

  @override
  Future<void> editarProduto(Map<String, dynamic> map) async {
    final ref = firestore.collection('queue');
    final doc = ref.doc(map['id']);
    await doc.update(map);
  }

  @override
  Future<void> adicionarQuantidade(Map<String, dynamic> map) async {
    final ref = firestore.collection('queue').doc(map['id']);
    ref.update({"quantidade": map['quantidade'] + 1});
  }

  @override
  Future subtrairQuantidade(Map<String, dynamic> map) async {
    final ref = firestore.collection('queue').doc(map['id']);
    ref.update({"quantidade": map['quantidade'] - 1});
  }

  @override
  Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>>
      buscarTodosDocumentos() async {
    final ref = firestore.collection('queue');
    final query = await ref.get();
    final docs = query.docs;
    return docs;
  }

  @override
  Future<void> resetarProdutosReceberamIncrementoQuantidade() async {
    final ref = firestore.collection('queue');
    final snapshot = await ref.get();
    for (var docs in snapshot.docs) {
      final map = docs.data();
      map['quantidade'] = 0;
      docs.reference.set(map);
    }
  }
}
