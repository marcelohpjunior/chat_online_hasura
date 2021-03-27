import 'package:chat_online_hasura/app/shared/models/error_exception.dart';
import 'package:chat_online_hasura/app/shared/models/usuario.dart';
import 'package:chat_online_hasura/app/shared/repositories/login/ilogin_repository.dart';
import 'package:mobx/mobx.dart';

part 'login_controller.g.dart';

class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {
  final ILoginRepository repository;

  _LoginControllerBase(this.repository);

  @observable
  int value = 0;

  @observable
  bool carregando = false;

  @observable
  Usuario? usuario;

  @observable
  ErrorException? erro;

  @action
  void increment() {
    value++;
  }

  @action
  Future<bool> entrar(String email, String senha) async {
    try {
      if (!_validaEmailSenha(email, senha)) return false;

      usuario = await repository.entrar(email, senha);
      erro = usuario == null
          ? ErrorException(message: 'Usuário não encontrado!')
          : null;

      return true;
    } catch (e) {
      erro = ErrorException(message: "Ocorreu um erro inesperado!");
      return false;
    }
  }

  _validaEmailSenha(String email, String senha) {
    if (email.isEmpty || senha.isEmpty) {
      erro = email.isEmpty
          ? ErrorException(message: "Campo E-mail está vazio!")
          : senha.isEmpty
              ? ErrorException(message: "Campo Senha está vazio!")
              : null;
      return false;
    }
    return true;
  }

  @action
  setCarregando(bool carregar) async {
    carregando = carregar;
  }
}
