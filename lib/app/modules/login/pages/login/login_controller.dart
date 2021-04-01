import 'package:chat_online_hasura/app/shared/models/erro_exception.dart';
import 'package:chat_online_hasura/app/shared/stores/usuario/usuario_store.dart';

import 'package:mobx/mobx.dart';

part 'login_controller.g.dart';

class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {
  UsuarioStore usuarioStore;
  _LoginControllerBase(this.usuarioStore);

  @observable
  bool carregando = false;

  @action
  entrar(String email, String senha) async {
    try {
      setCarregando(true);
      await usuarioStore.entrar(email, senha);
      setCarregando(false);
    } catch (e) {
      setCarregando(false);
      if (e.runtimeType == ErroException) throw e;
      throw ErroException();
    }
  }

  @action
  setCarregando(bool carregar) async {
    carregando = carregar;
  }
}
