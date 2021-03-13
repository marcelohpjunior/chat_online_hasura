import 'package:flutter_modular/flutter_modular.dart';
import 'chat_page.dart';
import 'chat_store.dart';

class ChatModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => ChatStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/home', child: (_, args) => ChatPage()),
  ];
}
