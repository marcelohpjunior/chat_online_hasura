// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoginStore on _LoginStoreBase, Store {
  final _$valueAtom = Atom(name: '_LoginStoreBase.value');

  @override
  int get value {
    _$valueAtom.reportRead();
    return super.value;
  }

  @override
  set value(int value) {
    _$valueAtom.reportWrite(value, super.value, () {
      super.value = value;
    });
  }

  final _$carregandoAtom = Atom(name: '_LoginStoreBase.carregando');

  @override
  bool get carregando {
    _$carregandoAtom.reportRead();
    return super.carregando;
  }

  @override
  set carregando(bool value) {
    _$carregandoAtom.reportWrite(value, super.carregando, () {
      super.carregando = value;
    });
  }

  final _$usuarioModelAtom = Atom(name: '_LoginStoreBase.usuarioModel');

  @override
  UsuarioModel? get usuarioModel {
    _$usuarioModelAtom.reportRead();
    return super.usuarioModel;
  }

  @override
  set usuarioModel(UsuarioModel? value) {
    _$usuarioModelAtom.reportWrite(value, super.usuarioModel, () {
      super.usuarioModel = value;
    });
  }

  final _$erroAtom = Atom(name: '_LoginStoreBase.erro');

  @override
  Object? get erro {
    _$erroAtom.reportRead();
    return super.erro;
  }

  @override
  set erro(Object? value) {
    _$erroAtom.reportWrite(value, super.erro, () {
      super.erro = value;
    });
  }

  final _$entrarAsyncAction = AsyncAction('_LoginStoreBase.entrar');

  @override
  Future<bool> entrar(dynamic email, dynamic senha) {
    return _$entrarAsyncAction.run(() => super.entrar(email, senha));
  }

  final _$setCarregandoAsyncAction =
      AsyncAction('_LoginStoreBase.setCarregando');

  @override
  Future setCarregando(bool carregar) {
    return _$setCarregandoAsyncAction.run(() => super.setCarregando(carregar));
  }

  final _$_LoginStoreBaseActionController =
      ActionController(name: '_LoginStoreBase');

  @override
  void increment() {
    final _$actionInfo = _$_LoginStoreBaseActionController.startAction(
        name: '_LoginStoreBase.increment');
    try {
      return super.increment();
    } finally {
      _$_LoginStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
value: ${value},
carregando: ${carregando},
usuarioModel: ${usuarioModel},
erro: ${erro}
    ''';
  }
}
