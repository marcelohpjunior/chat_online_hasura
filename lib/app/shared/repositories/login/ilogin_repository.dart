import 'package:chat_online_hasura/app/shared/models/usuario_model.dart';

abstract class ILoginRepository {
  Future<UsuarioModel?> entrar(email, senha);
  // Future<UsuarioModel> cadastrar(email, senha);
}
