import 'package:chat_online_hasura/app/modules/login/pages/cadastro/cadastro_page.dart';
import 'package:chat_online_hasura/app/modules/login/pages/cadastro/cadastro_controller.dart';
import 'package:chat_online_hasura/app/shared/repositories/login/login_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'pages/login/login_controller.dart';
import 'pages/login/login_page.dart';
import 'pages/splash/splash_page.dart';

class LoginModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => CadastroController()),
    Bind.lazySingleton((i) => LoginController(i.get<LoginRepository>())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => SplashPage()),
    ChildRoute('/login',
        child: (_, args) => LoginPage(), transition: TransitionType.fadeIn),
    ChildRoute('/cadastro', child: (_, args) => CadastroPage()),
  ];
}
