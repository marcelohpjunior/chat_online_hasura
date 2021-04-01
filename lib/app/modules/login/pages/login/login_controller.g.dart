// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoginController on _LoginControllerBase, Store {
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

  final _$entrarAsyncAction = AsyncAction('_LoginControllerBase.entrar');

  @override
  Future entrar(String email, String senha) {
    return _$entrarAsyncAction.run(() => super.entrar(email, senha));
  }

  final _$setCarregandoAsyncAction =
      AsyncAction('_LoginControllerBase.setCarregando');

  @override
  Future setCarregando(bool carregar) {
    return _$setCarregandoAsyncAction.run(() => super.setCarregando(carregar));
  }

  @override
  String toString() {
    return '''
carregando: ${carregando}
    ''';
  }
}
