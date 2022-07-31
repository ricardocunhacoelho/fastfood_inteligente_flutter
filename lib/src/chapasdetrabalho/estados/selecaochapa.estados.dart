import 'package:fastfood_inteligente_flutter/src/chapas/dominio/entidade/chapa.entidade.dart';
import 'package:fastfood_inteligente_flutter/src/chapas/dominio/objetosdevalor/solicitacoes/solicitacao.cancelamento.pedido.objeto.dart';

abstract class ChapaDeTrabalhoEstados {}

class InicialChapaDeTrabalhoEstados implements ChapaDeTrabalhoEstados {}

class CarregandoChapaDeTrabalhoEstados implements ChapaDeTrabalhoEstados {}

class CompletoChapaDeTrabalhoEstados implements ChapaDeTrabalhoEstados {
  final ChapaEntidade chapa;

  CompletoChapaDeTrabalhoEstados(this.chapa);
}

class ErroChapaDeTrabalhoEstados implements ChapaDeTrabalhoEstados {
  final String erro;

  ErroChapaDeTrabalhoEstados(this.erro);
}

class RequisitarDeletarPedidoChapaDeTrabalhoEstados
    implements ChapaDeTrabalhoEstados {
  final int numeroDaChapa;
  final int indexOrdem;

  RequisitarDeletarPedidoChapaDeTrabalhoEstados(
      this.numeroDaChapa, this.indexOrdem);
}

class CompletoBuscarSolicitacoesConfiguracoesChapaEstados
    implements ChapaDeTrabalhoEstados {
  final List<SolicitacaoCancelamentoPedidoObjeto> lista;

  CompletoBuscarSolicitacoesConfiguracoesChapaEstados(this.lista);
}

class CarregandoBuscarSolicitacoesConfiguracoesChapaEstados
    implements ChapaDeTrabalhoEstados {}

class ErroBuscarSolicitacoesConfiguracoesChapaEstados
    implements ChapaDeTrabalhoEstados {
  final String erro;

  ErroBuscarSolicitacoesConfiguracoesChapaEstados(this.erro);
}
