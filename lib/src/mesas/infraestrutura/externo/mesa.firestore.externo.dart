import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fastfood_inteligente_flutter/src/mesas/infraestrutura/fontededados/mesa.fontededados.dart';

class MesaFirestore implements IMesaFonteDeDados {
  final FirebaseFirestore firestore;
  late List<int> listadeOrdens;
  late Map dados;
  MesaFirestore(this.firestore);

  @override
  Future<void> adicionarMesa(Map<String, dynamic> map) async {
    final ref = firestore.collection('mesas');
    await ref.doc('mesa${map['numero']}').set(map);
  }

  @override
  Future<void> removerMesa(Map<String, dynamic> map) async {
    final ref = firestore.collection('mesas');
    await ref.doc('mesa${map['numero']}').delete();
  }

  @override
  Stream<List<Map>> buscarTodasMesas() {
    final ref = firestore.collection('mesas');
    final snapshots = ref.snapshots();

    return snapshots.map((e) => e.docs).map(_convert);
  }

  List<Map> _convert(List<QueryDocumentSnapshot<Map<String, dynamic>>> docs) {
    return docs
        .map(
          (documents) => {
            ...documents.data(),
          },
        )
        .toList();
  }
}
