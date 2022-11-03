abstract class IUsuarioFonteDeDados {
  
  Future<void> registrarUsuario(Map<String, dynamic> usuarioMap, String senha);
  
  Future<void> autenticarUsuario(String email, String senha);
  
  Future<Map> buscarUsuario(String uid);

}
