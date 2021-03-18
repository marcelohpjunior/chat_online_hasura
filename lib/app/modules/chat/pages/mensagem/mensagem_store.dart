import 'package:mobx/mobx.dart';

//part 'mensagem_store.g.dart';

class MensagemStore {
// = _MensagemStoreBase with _$MensagemStore;
// abstract class _MensagemStoreBase with Store {

  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
