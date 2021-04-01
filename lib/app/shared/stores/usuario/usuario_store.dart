import 'package:chat_online_hasura/app/shared/models/erro_exception.dart';
import 'package:chat_online_hasura/app/shared/models/usuario.dart';
import 'package:chat_online_hasura/app/shared/repositories/login/ilogin_repository.dart';
import 'package:mobx/mobx.dart';

part 'usuario_store.g.dart';

class UsuarioStore = _UsuarioStoreBase with _$UsuarioStore;

abstract class _UsuarioStoreBase with Store {
  final ILoginRepository _repository;

  _UsuarioStoreBase(this._repository);

  @observable
  Usuario? usuario;

  @action
  entrar(String email, String senha) async {
    try {
      _validaEntrar(email, senha);

      usuario = await _repository.entrar(email, senha);
      if (usuario == null) throw ErroException('Usuário não encontrado!');

      return true;
    } catch (e) {
      if (e.runtimeType == ErroException) throw e;
      throw ErroException();
    }
  }

  @action
  cadastrar(String email, String senha, String nome, String sobrenome,
      String telefone) async {
    try {
      _validaCadastro(email, senha, nome, sobrenome, telefone);
      usuario =
          await _repository.cadastrar(email, senha, nome, sobrenome, telefone);
      if (usuario == null) throw ErroException();

      return true;
    } catch (e) {
      if (e.runtimeType == ErroException) throw e;
      throw ErroException();
    }
  }

  _validaEntrar(String email, String senha) {
    _validaEmail(email);
    _validaSenha(senha);
  }

  _validaCadastro(String email, String senha, String nome, String sobrenome,
      String telefone) {
    _validaNome(nome);
    _validaSobrenome(sobrenome);
    _validaTelefone(telefone);
    _validaEmail(email);
    _validaSenha(senha);
  }

  _validaEmail(String email) {
    if (email.isEmpty) throw ErroException("Campo E-mail está vazio!");
  }

  _validaSenha(String senha) {
    if (senha.isEmpty) throw ErroException("Campo Senha está vazio!");
  }

  _validaNome(String nome) {
    if (nome.isEmpty) throw ErroException("Campo Nome está vazio!");
  }

  _validaSobrenome(String sobrenome) {
    if (sobrenome.isEmpty) throw ErroException("Campo Sobrenome está vazio!");
  }

  _validaTelefone(String telefone) {
    if (telefone.isEmpty) throw ErroException("Campo Telefone está vazio!");
  }
}
