abstract class ICalcularQualChapaDeveReceberOPedido {
  int call(List<dynamic> listaQuantidadeDeOrdensNasChapas);
}

class CalcularQualChapaDeveReceberOPedido
    implements ICalcularQualChapaDeveReceberOPedido {
  @override
  int call(List listaQuantidadeDeOrdensNasChapas) {
    int valorfinal = 0;
    List<dynamic> numerodeordensemcadachapa = listaQuantidadeDeOrdensNasChapas;
    List<int> ordenar = [];
    ordenar.sort();
    var posicaoatual = 0;
    var map = Map();
    numerodeordensemcadachapa.forEach((element) {
      if (!map.containsKey(element)) {
        map[element] = 1;
      } else {
        map[element] += 1;
      }
    });

    List referencia = [];
    int contandor = 0;
    map.forEach((key, value) {
      referencia.add({
        key: [],
      });
      ordenar.add(key);
      if (map[key] > 1) {
        for (int i = 0; i < map[key]; i++) {
          posicaoatual += numerodeordensemcadachapa.indexOf(key, i);
          var valores = numerodeordensemcadachapa.indexOf(key, posicaoatual);
          referencia[contandor][key].add(valores);
        }
      } else {
        referencia[contandor][key]
            .add(numerodeordensemcadachapa.indexOf(key, posicaoatual));
      }
      posicaoatual = 0;
      contandor++;
    });
    ordenar.sort();
    for (var i = 0; i < referencia.length; i++) {
      if (referencia[i].containsKey(ordenar[0])) {
        valorfinal = referencia[i][ordenar[0]].first;
        // print('contem a primeira posição que é ${referencia[i]}');
        // print(
        //     'as chapas com ${ordenar[0]} ordens são ${referencia[i][ordenar[0]]}');
        // print('inserir na chapa ${referencia[i][ordenar[0]].first}');
        // for (int e = 0; e < referencia[i][ordenar[0]].length; e++) {
        //   print(
        //       'tentar injetar uma ordem na chap de id ${referencia[i][ordenar[0]][e]}');
        // }
      }
    }
    return (valorfinal + 1);
  }
}
