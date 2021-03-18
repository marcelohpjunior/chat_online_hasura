import 'package:flutter_test/flutter_test.dart';
import 'package:chat_online_hasura/app/modules/chat/pages/mensagem/mensagem_store.dart';
 
void main() {
  late MensagemStore store;

  setUpAll(() {
    store = MensagemStore();
  });

  test('increment count', () async {
    expect(store.value, equals(0));
    store.increment();
    expect(store.value, equals(1));
  });
}