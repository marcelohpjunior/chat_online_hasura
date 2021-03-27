// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoginController on _LoginControllerBase, Store {
  final _$valueAtom = Atom(name: '_LoginControllerBase.value');

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

  final _$carregandoAtom = Atom(name: '_LoginControllerBase.carregando');

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

  final _$usuarioAtom = Atom(name: '_LoginControllerBase.usuario');

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

  final _$erroAtom = Atom(name: '_LoginControllerBase.erro');

  @override
  ErrorException? get erro {
    _$erroAtom.reportRead();
    return super.erro;
  }

  @override
  set erro(ErrorException? value) {
    _$erroAtom.reportWrite(value, super.erro, () {
      super.erro = value;
    });
  }

  final _$entrarAsyncAction = AsyncAction('_LoginControllerBase.entrar');

  @override
  Future<bool> entrar(String email, String senha) {
    return _$entrarAsyncAction.run(() => super.entrar(email, senha));
  }

  final _$setCarregandoAsyncAction =
      AsyncAction('_LoginControllerBase.setCarregando');

  @override
  Future setCarregando(bool carregar) {
    return _$setCarregandoAsyncAction.run(() => super.setCarregando(carregar));
  }

  final _$_LoginControllerBaseActionController =
      ActionController(name: '_LoginControllerBase');

  @override
  void increment() {
    final _$actionInfo = _$_LoginControllerBaseActionController.startAction(
        name: '_LoginControllerBase.increment');
    try {
      return super.increment();
    } finally {
      _$_LoginControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
value: ${value},
carregando: ${carregando},
usuario: ${usuario},
erro: ${erro}
    ''';
  }
}
