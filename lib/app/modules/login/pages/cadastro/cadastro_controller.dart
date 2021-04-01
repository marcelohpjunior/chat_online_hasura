import 'package:chat_online_hasura/app/shared/models/erro_exception.dart';
import 'package:chat_online_hasura/app/shared/stores/usuario/usuario_store.dart';
import 'package:mobx/mobx.dart';

part 'cadastro_controller.g.dart';

class CadastroController = _CadastroControllerBase with _$CadastroController;

abstract class _CadastroControllerBase with Store {
  UsuarioStore usuarioStore;
  _CadastroControllerBase(this.usuarioStore);

  @observable
  bool carregando = false;

  @action
  cadastrar(String email, String senha, String nome, String sobrenome,
      String telefone) async {
    try {
      setCarregando(true);
      await usuarioStore.cadastrar(email, senha, nome, sobrenome, telefone);
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
