import 'package:mobx/mobx.dart';

part 'contatos_store.g.dart';

class ContatosStore = _ContatosStoreBase with _$ContatosStore;

abstract class _ContatosStoreBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
