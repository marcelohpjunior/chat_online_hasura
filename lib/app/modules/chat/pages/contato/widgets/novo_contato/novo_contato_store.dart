import 'package:mobx/mobx.dart';

part 'novo_contato_store.g.dart';

class NovoContatoStore = _NovoContatoStoreBase with _$NovoContatoStore;
abstract class _NovoContatoStoreBase with Store {

  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  } 
}