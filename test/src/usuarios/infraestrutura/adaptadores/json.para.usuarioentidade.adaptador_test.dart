import 'package:fastfood_inteligente_flutter/src/usuarios/infraestrutura/adaptadores/json.para.usuarioentidade.adaptador.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('json.para.usuarioentidade.adaptador ...', () {
    final valorUsuario = JsonParaUsuarioEntidade.deMap({
        'uid': 'ordem1',
        'email': 'obs',
        'usuarioFuncao': 'chapeiro',
      },);

    print(valorUsuario.email);
  });
}