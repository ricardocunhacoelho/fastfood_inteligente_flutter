abstract class LoginEstados {}

class IniciarLoginEstado implements LoginEstados {}

class AutenticarUsuarioCarregandoEstado implements LoginEstados {}

class AutenticarUsuarioCompletoEstado implements LoginEstados {}

class AutenticarUsuarioErroEstado implements LoginEstados {}