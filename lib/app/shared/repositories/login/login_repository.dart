import 'package:chat_online_hasura/app/shared/models/erro_exception.dart';
import 'package:chat_online_hasura/app/shared/models/usuario.dart';
import 'package:chat_online_hasura/app/shared/repositories/login/ilogin_repository.dart';
import 'package:hasura_connect/hasura_connect.dart';

class LoginRepository extends ILoginRepository {
  final HasuraConnect hasura;

  LoginRepository(this.hasura);

  @override
  Future<Usuario?> cadastrar(String email, String senha, String nome,
      String sobrenome, String telefone) async {
    const mutation = '''
    mutation cadastro(\$email: String!, \$senha: String!, \$nome:String!, \$sobrenome: String!, \$telefone: String!) {
      insert_usuarios(objects: {email: \$email, senha: \$senha, nome: \$nome, sobrenome: \$sobrenome, telefone: \$telefone}) {
        returning {
          id_usuario
          email
          senha
          nome
          sobrenome
          telefone
        }
      }
    }
    ''';
    var resultado = await hasura
        .mutation(mutation, variables: {
          "email": email,
          "senha": senha,
          "nome": nome,
          "sobrenome": sobrenome,
          "telefone": telefone
        })
        .onError((error, stackTrace) => throw ErroException())
        .then((value) => value['data']['insert_usuarios']["returning"] as List);

    if (resultado.isEmpty) {
      return null;
    }

    return Usuario.fromJson(resultado.first);
  }

  @override
  Future<Usuario?> entrar(String email, String senha) async {
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

    var resultado = await hasura
        .query(query, variables: {"email": email, "senha": senha})
        .onError((error, stackTrace) => throw ErroException())
        .then((value) => value['data']['usuarios'] as List);

    if (resultado.isEmpty) {
      return null;
    }

    return Usuario.fromJson(resultado.first);
  }
}
