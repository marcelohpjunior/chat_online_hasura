import 'package:chat_online_hasura/app/shared/models/usuario_model.dart';
import 'package:chat_online_hasura/app/shared/repositories/login/ilogin_repository.dart';
import 'package:mobx/mobx.dart';

part 'login_store.g.dart';

class LoginStore = _LoginStoreBase with _$LoginStore;

abstract class _LoginStoreBase with Store {
  final ILoginRepository repository;
  _LoginStoreBase(this.repository);

  @observable
  int value = 0;
  @observable
  UsuarioModel? usuarioModel;

  @action
  void increment() {
    value++;
  }

  @action
  entrar(email, senha) async {
    usuarioModel = await repository.entrar(email, senha);
  }
}
