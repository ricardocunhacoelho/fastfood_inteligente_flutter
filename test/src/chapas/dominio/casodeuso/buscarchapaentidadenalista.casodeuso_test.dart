import 'package:flutter_test/flutter_test.dart';

void main() {
  test('description', () {
    var lista = [1, 1, 1, 1, 1, 1, 2, 3, 3, 3, 3];
    var guardar = 'achou';
    lista.forEach((element) {
      while (element == 2) {
        print(element);
        guardar = 'foi';
        break;
      }
    });
    print(guardar);
  });
}
