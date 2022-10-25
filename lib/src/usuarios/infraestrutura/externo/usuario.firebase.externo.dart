import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fastfood_inteligente_flutter/src/usuarios/infraestrutura/fontededados/iusuario.fontededados.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UsuarioFirebase implements IUsuarioFonteDeDados {
  final FirebaseFirestore firestore;
  final FirebaseAuth firebaseAuth;
  UsuarioFirebase(this.firestore, this.firebaseAuth);

  @override
  Future<void> autenticarUsuario(String email, String senha) async {
    await firebaseAuth.signInWithEmailAndPassword(
        email: email, password: senha);
  }

  @override
  Future<void> registrarUsuario(
      Map<String, dynamic> usuarioMap, String senha) async {
    await firebaseAuth
        .createUserWithEmailAndPassword(
            email: usuarioMap['email'], password: senha)
        .then((data) {
      var uid = data.user!.uid;
      usuarioMap['uid'] = uid;
      var ref = firestore.collection('usuarios');
      ref.doc(uid).set(usuarioMap);
    });
  }
}
