import 'package:fastfood_inteligente_flutter/src/chapas/dominio/casodeuso/atualizarvaloreschapa.casodeuso.dart';
import 'package:fastfood_inteligente_flutter/src/chapas/dominio/casodeuso/buscartodaschapas.casodeuso.dart';
import 'package:fastfood_inteligente_flutter/src/chapas/dominio/entidade/chapa.entidade.dart';
import 'package:fastfood_inteligente_flutter/src/produtos/dominio/casodeuso/adicionar.produto.casodeuso.dart';
import 'package:fastfood_inteligente_flutter/src/produtos/dominio/casodeuso/buscartodosprodutos.casodeuso.dart';
import 'package:fastfood_inteligente_flutter/src/produtos/dominio/casodeuso/deletar.produto.casodeuso.dart';
import 'package:fastfood_inteligente_flutter/src/produtos/dominio/casodeuso/editar.produto.casodeuso.dart';
import 'package:fastfood_inteligente_flutter/src/produtos/dominio/entidade/produto.entidade.dart';
import 'package:fastfood_inteligente_flutter/src/produtos/dominio/repositorio/iprodutos.repository.dart';
import 'package:fastfood_inteligente_flutter/src/produtos/infraestrutura/fontededados/iproduto.data.source.dart';
import 'package:mocktail/mocktail.dart';

class IProdutoRepositorioMock extends Mock implements IProdutoRepositorio {}

class ProdutoEntityMock extends Mock implements ProdutoEntidade {}

class IProdutoDataSourceMock extends Mock implements IProdutoDataSource {}

class IBuscarTodosProdutosMock extends Mock implements IBuscarTodosProdutos {}

class IAdicionarProdutoMock extends Mock implements IAdicionarProduto {}

class IDeletarProdutoMock extends Mock implements IDeletarProduto {}

class IEditarProdutoMock extends Mock implements IEditarProduto {}

class ProdutoEntidadeMock extends Mock implements ProdutoEntidade {}

//mocks chapa
class ChapaEntidadeMock extends Mock implements ChapaEntidade {}

class IBuscarTodasChapasMock extends Mock implements IBuscarTodasChapas {}

class IAtualizarValoresChapaMock extends Mock
    implements IAtualizarValoresChapa {}
