import 'package:fastfood_inteligente_flutter/src/mesas/dominio/entidade/mesa.entidade.dart';
import 'package:fastfood_inteligente_flutter/src/mesas/dominio/repositorio/imesa.repositorio.dart';
import 'package:fastfood_inteligente_flutter/src/mesas/infraestrutura/adaptadores/json.paramesa.adaptador.dart';
import 'package:fastfood_inteligente_flutter/src/mesas/infraestrutura/adaptadores/mesa.parajson.adaptador.dart';
import 'package:fastfood_inteligente_flutter/src/mesas/infraestrutura/fontededados/mesa.fontededados.dart';

class MesaRepositorio implements IMesaRepositorio {
  final IMesaFonteDeDados fontededados;

  MesaRepositorio(this.fontededados);

  @override
  Future<void> adicionarMesa(MesaEntidade mesa) async {
    final map = MesaParaJson.paraMap(mesa);
    await fontededados.adicionarMesa(map);
  }

    @override
  Future<void> removerMesa(MesaEntidade mesa) async {
    final map = MesaParaJson.paraMap(mesa);
    await fontededados.removerMesa(map);
  }

  @override
  Stream<List<MesaEntidade>> buscarTodasMesas() {
    final streammap = fontededados.buscarTodasMesas();
    return streammap.map(_convert);
  }

  List<MesaEntidade> _convert(List<Map<dynamic, dynamic>> list) {
    return list.map(JsonParaMesa.deMap).toList();
  }
}
