import 'package:chat_online_hasura/app/shared/constants/hasura_headrs_constant.dart';
import 'package:chat_online_hasura/app/shared/repositories/chat/chat_repository.dart';
import 'package:chat_online_hasura/app/shared/repositories/login/login_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hasura_connect/hasura_connect.dart';

import 'modules/chat/chat_module.dart';
import 'modules/login/login_module.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => ChatRepository()),
    Bind.lazySingleton((i) => LoginRepository(i.get<HasuraConnect>())),
    Bind.lazySingleton((i) => HasuraConnect(
        'https://helloworld-hasura.hasura.app/v1/graphql',
        headers: {'x-hasura-admin-secret': xHasuraAdminSecret})),
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(Modular.initialRoute, module: LoginModule()),
    ModuleRoute('/chat', module: ChatModule()),
  ];
}
