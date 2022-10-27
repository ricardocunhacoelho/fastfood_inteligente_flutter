abstract class LoginEventos {}

class AutenticarUsuarioLoginEventos implements LoginEventos {
  final String email;
  final String senha;
  AutenticarUsuarioLoginEventos(this.email, this.senha);
}
