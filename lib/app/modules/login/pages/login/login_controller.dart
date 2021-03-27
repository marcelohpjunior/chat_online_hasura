import 'package:chat_online_hasura/app/shared/models/usuario_model.dart';
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
  UsuarioModel? usuarioModel;

  @observable
  Object? erro;

  @action
  void increment() {
    value++;
  }

  @action
  Future<bool> entrar(String email, String senha) async {
    try {
      if (!_validaEmailSenha(email, senha)) return false;

      usuarioModel = await repository.entrar(email, senha);
      erro = null;

      return true;
    } catch (e) {
      erro = e;
      return false;
    }
  }

  _validaEmailSenha(String email, String senha) {
    if (email.isEmpty || senha.isEmpty) {
      return false;
    }
    return true;
  }

  @action
  setCarregando(bool carregar) async {
    carregando = carregar;
  }
}
