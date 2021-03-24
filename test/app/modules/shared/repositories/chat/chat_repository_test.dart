import 'package:flutter_test/flutter_test.dart';
import 'package:chat_online_hasura/app/shared/repositories/chat/chat_repository.dart';

void main() {
  late ChatRepository repository;

  setUpAll(() {
    repository = ChatRepository();
  });
}
