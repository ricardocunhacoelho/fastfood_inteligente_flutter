abstract class ICalcularQualChapaDeveReceberOPedido {
  int call(List<dynamic> listaQuantidadeDeOrdensNasChapas,
      List<dynamic> listaTodasChapas);
}

class CalcularQualChapaDeveReceberOPedido
    implements ICalcularQualChapaDeveReceberOPedido {
  @override
  int call(List listaQuantidadeDeOrdensNasChapas, List listaTodasChapas) {
    int valorfinal = 0;
    int retornar = 0;
    List<dynamic> todasAsChapasNumero = [];
    List<dynamic> numerodeordensemcadachapa = listaQuantidadeDeOrdensNasChapas;
    List<int> ordenar = [];
    listaTodasChapas.forEach((element) {
      if (!todasAsChapasNumero.contains(element.numerodachapa)) {
        todasAsChapasNumero.add(element.numerodachapa);
      }
    });
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
    if (todasAsChapasNumero.length > 0) {
      if (todasAsChapasNumero.contains(valorfinal + 1)) {
        //contem a chapa referente ao numero retornar valorfinal+1
        retornar = valorfinal + 1;
      } else {
        retornar = todasAsChapasNumero[valorfinal];
      }
    }

    return retornar;
  }
}
