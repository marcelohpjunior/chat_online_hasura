import 'package:flutter_modular/flutter_modular.dart';

import 'modules/chat/chat_module.dart';
import 'modules/login/login_module.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(Modular.initialRoute, module: LoginModule()),
    ModuleRoute('/chat', module: ChatModule()),
  ];
}
