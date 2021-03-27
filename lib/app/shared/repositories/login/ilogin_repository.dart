import 'package:chat_online_hasura/app/shared/models/usuario.dart';

abstract class ILoginRepository {
  Future<Usuario?> entrar(email, senha);
  // Future<UsuarioModel> cadastrar(email, senha);
}
