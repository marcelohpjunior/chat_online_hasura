import 'package:chat_online_hasura/app/shared/models/usuario.dart';
import 'package:chat_online_hasura/app/shared/repositories/login/ilogin_repository.dart';
import 'package:hasura_connect/hasura_connect.dart';

class LoginRepository extends ILoginRepository {
  final HasuraConnect hasura;

  LoginRepository(this.hasura);

  // @override
  // Future<UsuarioModel> cadastrar(email, senha) {}

  @override
  Future<Usuario?> entrar(email, senha) async {
    const query = '''
    query entrar(\$email: String!, \$senha: String!) {
      usuarios(where: {email: {_eq: \$email}, _and: {senha: {_eq: \$senha}}}) {
        id_usuario
        email
        senha
        nome
        sobrenome
        telefone
      }
    }
  ''';

    var resultado = await hasura.query(query, variables: {
      "email": email,
      "senha": senha
    }).then((value) => value['data']['usuarios'] as List);

    if (resultado.isEmpty) {
      return null;
    }

    return Usuario.fromJson(resultado.first);
  }
}
