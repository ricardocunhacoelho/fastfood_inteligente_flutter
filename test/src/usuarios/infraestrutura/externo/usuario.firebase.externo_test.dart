import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:fastfood_inteligente_flutter/src/usuarios/dominio/entidade/usuario.entidade.dart';
import 'package:fastfood_inteligente_flutter/src/usuarios/infraestrutura/adaptadores/json.para.usuarioentidade.adaptador.dart';
import 'package:fastfood_inteligente_flutter/src/usuarios/infraestrutura/externo/usuario.firebase.externo.dart';
import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('deve logar com firebase', () {
    // Sign in.
    final user = MockUser(
      isAnonymous: false,
      uid: 'someuid',
      email: 'bob@somedomain.com',
      displayName: 'Bob',
    );
    final auth = MockFirebaseAuth(mockUser: user);

    print(auth.currentUser!.email);
  });

  test('description', () async {
    late var usuarioInicial;
    final user = MockUser(
      isAnonymous: false,
      uid: 'someuid',
      email: 'bob@somedomain.com',
    );
    final auth = MockFirebaseAuth(mockUser: user);
    final firestore = FakeFirebaseFirestore();
    await firestore.collection('usuarios').doc('someuid').set({
      'uid': 'someuid',
      'email': 'bob@somedomain.com',
      'usuarioFuncao': 'chapeiro',
    });
    final datasource = UsuarioFirebase(firestore, auth);
    final result = await datasource.buscarUsuario('someuid');
    final usuario = JsonParaUsuarioEntidade.deMap(result);

    print(result['email']);
    print(usuario.uid);

  });
}
