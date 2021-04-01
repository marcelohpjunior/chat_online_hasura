import 'package:chat_online_hasura/app/shared/models/usuario.dart';

abstract class ILoginRepository {
  Future<Usuario?> entrar(String email, String senha);
  Future<Usuario?> cadastrar(String email, String senha, String nome,
      String sobrenome, String telefone);
}
