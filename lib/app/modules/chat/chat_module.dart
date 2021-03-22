import 'package:chat_online_hasura/app/modules/chat/pages/contato/contatos_page.dart';
import 'package:chat_online_hasura/app/modules/chat/pages/contato/contatos_store.dart';
import 'package:chat_online_hasura/app/modules/chat/pages/contato/widgets/novo_contato/novo_contato_dialog_widget.dart';
import 'package:chat_online_hasura/app/modules/chat/pages/contato/widgets/novo_contato/novo_contato_store.dart';
import 'package:chat_online_hasura/app/modules/chat/pages/mensagem/mensagem_page.dart';
import 'package:chat_online_hasura/app/modules/chat/pages/mensagem/mensagem_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'pages/chat/chat_page.dart';
import 'pages/chat/chat_store.dart';

class ChatModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => NovoContatoStore()),
    Bind.lazySingleton((i) => ContatosStore()),
    Bind.lazySingleton((i) => MensagemStore()),
    Bind.lazySingleton((i) => ChatStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => ChatPage()),
    ChildRoute('/mensagem', child: (_, args) => MensagemPage()),
    ChildRoute('/contatos', child: (_, args) => ContatosPage()),
    ChildRoute('/novo-contato', child: (_, args) => NovoContatoDialogWidget()),
  ];
}
