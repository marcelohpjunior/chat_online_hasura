import 'package:mobx/mobx.dart';

part 'chat_store.g.dart';

class ChatStore = ChatStoreBase with _$ChatStore;

abstract class ChatStoreBase with Store {
  @observable
  int counter = 0;

  Future<void> increment() async {
    counter = counter + 1;
  }
}
