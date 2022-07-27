import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fastfood_inteligente_flutter/src/chapas/infraestrutura/fontededados/ichapa.fontededados.dart';

class ChapaFirestore implements IChapaFonteDeDados {
  final FirebaseFirestore firestore;
  late List<int> listadeOrdens;
  late Map dados;
  ChapaFirestore(this.firestore);

  @override
  Stream<List<Map>> buscarTodasChapas() {
    final ref = firestore.collection('chapa');
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
  Future<void> adicionarChapa(Map<String, dynamic> map) async {
    final ref = firestore.collection('chapa');
    await ref.doc(map['id']).set(map);
    // map.remove('id');
    // await ref.add(map);
  }

  @override
  Future<void> deletarChapa(Map<String, dynamic> map) async {
    final ref = firestore.collection('chapa');
    final doc = ref.doc(map['id']);
    await doc.delete();
  }

  @override
  Future<void> atualizarValoresChapa(Map<String, dynamic> map) async {
    final ref = firestore.collection('chapa');
    final doc = ref.doc(map['id']);
    await doc.update(map);
  }

  @override
  Future<void> atualizarOrdensChapa(
      List<Map<String, dynamic>> listaMapOrdens, String id) async {
    var sfRef = firestore.collection("chapa").doc(id);
    sfRef.update({"ordens": listaMapOrdens});
  }

  @override
  Stream<List<Map>> buscarOrdemBase() {
    final ref = firestore.collection('ordem');
    final snapshots = ref.snapshots();

    return snapshots.map((e) => e.docs).map(_convertOrdem);
  }

  List<Map> _convertOrdem(
      List<QueryDocumentSnapshot<Map<String, dynamic>>> docs) {
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
  atualizarOrdemBase(Map<String, dynamic> map) async {
    var sfRef = firestore.collection("ordem").doc(map['id']);
    sfRef.set(map);
  }

  @override
  Future<void> resetarTodosPedidos() async {
    final ref = firestore.collection('chapa');
    final snapshot = await ref.get();
    for (var docs in snapshot.docs) {
      final map = docs.data();
      map['ordens'] = [];
      docs.reference.set(map);
    }
  }

  @override
  Future<void> atualizarEstadoPedido(Map<String, dynamic> mapChapaEntidade,
      String estado, int indexOrdem) async {
    final ref = firestore.collection('chapa');
    final doc = ref.doc(mapChapaEntidade['id']);
    final getdocumento = doc.get();
    getdocumento.then((documentoSnap) {
      final map = documentoSnap.data();
      map!['ordens'][indexOrdem]['estado'] = estado;
      doc.update(map);
    });
  }

  @override
  Stream<Map<String, dynamic>> vigiarChapa(int numeroChapa) {
    final docRef = firestore.collection("chapa").doc("chapa1");
    final mapChapa = docRef.snapshots().map((event) => event.data()!);
    return mapChapa;
  }

  @override
  Future<void> removerOrdemChapa(String id, int indexOrdem) async {
    final ref = firestore.collection('chapa');
    final doc = ref.doc(id);
    final getdocumento = doc.get();
    getdocumento.then((documentoSnap) {
      final map = documentoSnap.data();
      (map!['ordens'] as List).removeAt(indexOrdem);
      doc.update(map);
      print(map);
    });
  }
}
