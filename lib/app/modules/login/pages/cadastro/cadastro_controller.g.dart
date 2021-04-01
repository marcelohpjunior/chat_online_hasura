// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cadastro_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CadastroController on _CadastroControllerBase, Store {
  final _$carregandoAtom = Atom(name: '_CadastroControllerBase.carregando');

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

  final _$cadastrarAsyncAction =
      AsyncAction('_CadastroControllerBase.cadastrar');

  @override
  Future cadastrar(String email, String senha, String nome, String sobrenome,
      String telefone) {
    return _$cadastrarAsyncAction
        .run(() => super.cadastrar(email, senha, nome, sobrenome, telefone));
  }

  final _$setCarregandoAsyncAction =
      AsyncAction('_CadastroControllerBase.setCarregando');

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
