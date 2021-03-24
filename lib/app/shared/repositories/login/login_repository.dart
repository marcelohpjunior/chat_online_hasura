import 'package:chat_online_hasura/app/shared/models/usuario_model.dart';
import 'package:chat_online_hasura/app/shared/repositories/login/ilogin_repository.dart';
import 'package:hasura_connect/hasura_connect.dart';

class LoginRepository extends ILoginRepository {
  final HasuraConnect hasura;

  LoginRepository(this.hasura);

  // @override
  // Future<UsuarioModel> cadastrar(email, senha) {}

  @override
  Future<UsuarioModel?> entrar(email, senha) async {
    var resultado = await hasura.query(
        ''' query entrar(\$email: String!, \$senha: String!) {
  usuarios(where: {email: {_eq: \$email}, _and: {senha: {_eq: \$senha}}}) {
    id_usuario
    email
    senha
    nome
    sobrenome
    telefone
  }
}
''',
        variables: {"email": email, "senha": senha});

    UsuarioModel usuarioModel =
        UsuarioModel.fromJson(resultado['data']['usuarios'][0]);
    return usuarioModel;
  }
}
