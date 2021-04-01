// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'usuario_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$UsuarioStore on _UsuarioStoreBase, Store {
  final _$usuarioAtom = Atom(name: '_UsuarioStoreBase.usuario');

  @override
  Usuario? get usuario {
    _$usuarioAtom.reportRead();
    return super.usuario;
  }

  @override
  set usuario(Usuario? value) {
    _$usuarioAtom.reportWrite(value, super.usuario, () {
      super.usuario = value;
    });
  }

  final _$entrarAsyncAction = AsyncAction('_UsuarioStoreBase.entrar');

  @override
  Future entrar(String email, String senha) {
    return _$entrarAsyncAction.run(() => super.entrar(email, senha));
  }

  final _$cadastrarAsyncAction = AsyncAction('_UsuarioStoreBase.cadastrar');

  @override
  Future cadastrar(String email, String senha, String nome, String sobrenome,
      String telefone) {
    return _$cadastrarAsyncAction
        .run(() => super.cadastrar(email, senha, nome, sobrenome, telefone));
  }

  @override
  String toString() {
    return '''
usuario: ${usuario}
    ''';
  }
}
