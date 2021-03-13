import 'package:flutter_modular/flutter_modular.dart';
import 'pages/chat/chat_page.dart';
import 'pages/chat/chat_store.dart';

class MainModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => ChatStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => ChatPage()),
  ];
}
