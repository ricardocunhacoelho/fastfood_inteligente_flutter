import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:fastfood_inteligente_flutter/src/chapas/dominio/objetosdevalor/ordem.objeto.dart';
import 'package:fastfood_inteligente_flutter/src/chapas/infraestrutura/externo/chapa.firestore.externo.fontededados.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('deve retornar todas as chapas', () async {
    final firestore = FakeFirebaseFirestore();
    await firestore.collection('chapa').add({
      'titulo': 'Chapa01',
      'id': 'chapa01',
      'numerodachapa': 1,
      'estado': 'desligada',
      'ordens': [
        {'1': '1'},
        {'2': '2'}
      ],
    });
    await firestore.collection('chapa').add({
      'titulo': 'Chapa02',
      'id': 'chapa02',
      'numerodachapa': 1,
      'estado': 'desligada',
      'ordens': [
        {'1': '1'}
      ],
    });
    final fonteDeDados = ChapaFirestore(firestore);
    final listadeOrdens = [];
    final ref = firestore.collection('chapa');
    final query = await ref.get();
    final docs = query.docs;
    final data = docs.forEach(
      (element) {
        listadeOrdens.add(element['ordens'].length);
      },
    );
    print(listadeOrdens);
    expect(query.docs.length, 2);
  });
  test('deve retornar modificar o titulo da chapa', () async {
    final firestore = FakeFirebaseFirestore();
    final fonteDeDados = ChapaFirestore(firestore);
    await fonteDeDados.adicionarChapa({
      'titulo': 'Chapa01',
      'id': 'chapa01',
      'numerodachapa': 1,
      'estado': 'desligada',
      'ordens': [
        {'1': '1'},
        {'2': '2'}
      ],
    });
    await fonteDeDados.adicionarChapa({
      'titulo': 'Chapa02',
      'id': 'chapa02',
      'numerodachapa': 2,
      'estado': 'desligada',
      'ordens': [
        {'1': '1'},
        {'2': '2'}
      ],
    });

    // print(chapateste['titulo']);
    // final listadeOrdens = [];
    // final ref = firestore.collection('chapa');
    // final query = await ref.get();
    // final docs = query.docs;
    // final data = docs.forEach(
    //   (element) {
    //     listadeOrdens.add(element['ordens'].length);
    //   },
    // );
    // print(listadeOrdens);
    // expect(query.docs.length, 2);
  });
  test('deve atualizar as ordens', () async {
    //   final String id;
    // final String observacao;
    // final int posicao;
    // final bool embalarParaViajem;
    // final DateTime datahora;
    // final List<ProdutoEntidade> produtos;
    // final EOrdermEstado estado;
    final listaMapOrdens = [
      {
        'id': 'id',
        'observacao': 'obs',
        'posicao': 1,
        'embalarParaViajem': true,
        'produtos': [],
        'estado': 'aguardando',
      },
      {
        'id': 'id2',
        'observacao': 'obs2',
        'posicao': 2,
        'embalarParaViajem': true,
        'produtos': [],
        'estado': 'aguardando',
      }
    ];
    final String id = 'chapa01';
    final firestore = FakeFirebaseFirestore();
    final fonteDeDados = ChapaFirestore(firestore);
    await fonteDeDados.adicionarChapa({
      'titulo': 'Chapa01',
      'id': 'chapa01',
      'numerodachapa': 1,
      'estado': 'desligada',
      'ordens': [
        {'1': '1'},
        {'2': '2'}
      ],
    });
    await fonteDeDados.adicionarChapa({
      'titulo': 'Chapa02',
      'id': 'chapa02',
      'numerodachapa': 2,
      'estado': 'desligada',
      'ordens': [
        {'1': '1'},
        {'2': '2'}
      ],
    });
    await fonteDeDados.atualizarOrdensChapa(listaMapOrdens, id);
    final docRef = firestore.collection("chapa").doc(id);
    final buscar = await docRef.get();
    final dados = buscar.data();
    print(dados);
  });
  test('deve trazer a ordem', () async {
    final firestore = FakeFirebaseFirestore();
    final docRef = await firestore.collection("ordem");
    await docRef.doc('ordem1').set(
      {
        'id': 'ordem1',
        'observacao': 'obs',
        'posicao': 1,
        'embalarParaViajem': true,
        'produtos': [],
        'estado': 'aguardando',
      },
    );
    final fonteDeDados = ChapaFirestore(firestore);

    final valorchecar = await fonteDeDados.buscarOrdemBase();

    print(valorchecar);
  });
  test('deve atualizar a ordem', () async {
    final firestore = FakeFirebaseFirestore();
    final docRef = await firestore.collection("ordem");
    await docRef.doc('ordem1').set(
      {
        'id': 'ordem1',
        'observacao': 'obs',
        'posicao': 1,
        'embalarParaViajem': true,
        'produtos': [],
        'estado': 'aguardando',
      },
    );
    final fonteDeDados = ChapaFirestore(firestore);
    fonteDeDados.atualizarOrdemBase({
      'id': 'ordem1',
      'observacao': 'obs',
      'posicao': 2,
      'embalarParaViajem': false,
      'produtos': [],
      'estado': 'aguardando',
    });
    final valorchecar = await fonteDeDados.buscarOrdemBase();
  });
  test('testar', () async {
    final listaMapOrdens = [
      {
        'id': 'id',
        'observacao': 'obs',
        'posicao': 1,
        'embalarParaViajem': true,
        'produtos': [],
        'estado': 'aguardando',
      },
      {
        'id': 'id2',
        'observacao': 'obs2',
        'posicao': 2,
        'embalarParaViajem': true,
        'produtos': [],
        'estado': 'aguardando',
      }
    ];
    final String id = 'chapa1';
    final firestore = FakeFirebaseFirestore();
    final fonteDeDados = ChapaFirestore(firestore);
    await fonteDeDados.adicionarChapa({
      'titulo': 'Chapa01',
      'id': 'chapa1',
      'numerodachapa': 1,
      'estado': 'desligada',
      'ordens': [
        {'1': '1'},
        {'2': '2'}
      ],
    });
    await fonteDeDados.adicionarChapa({
      'titulo': 'Chapa02',
      'id': 'chapa2',
      'numerodachapa': 2,
      'estado': 'desligada',
      'ordens': [
        {'1': '1'},
        {'2': '2'}
      ],
    });

    fonteDeDados.removerOrdemChapa('chapa1', 0);
    final docRef = firestore.collection("chapa").doc('chapa1');
    final buscar = await docRef.get();
    final dados = buscar.data();
    print(dados);
  });
}
