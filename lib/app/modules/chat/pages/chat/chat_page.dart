import 'package:chat_online_hasura/app/modules/chat/widgets/lista_contatos_widget.dart';
import 'package:chat_online_hasura/app/shared/widgets/sair_dialog_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'chat_controller.dart';

class ChatPage extends StatefulWidget {
  final String title;
  const ChatPage({this.title = "Chat Online"}) : super();

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends ModularState<ChatPage, ChatController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat Online'),
      ),
      body: WillPopScope(
        onWillPop: () async {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return SairDialogWidget(
                  onPressedNao: () {
                    Modular.to.pop();
                  },
                  onPressedSim: () {
                    Modular.to.navigate('/login', replaceAll: true);
                  },
                );
              });
          return true;
        },
        child: Observer(builder: (context) {
          return ListaContatosWidget(
            onTap: () {
              Modular.to.pushNamed('mensagem');
            },
            onLongPress: () => print("Opções"),
            titulo: "Usuário",
            onAvatarTap: () {
              print("foto perfil");
            },
            showQtdMensagem: true,
            qtdMensagem: controller.counter,
          );
        }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //store.increment();
          Modular.to.pushNamed("contatos");
        },
        child: Icon(
          FontAwesomeIcons.solidCommentAlt,
          color: Theme.of(context).primaryColorDark,
          size: 20,
        ),
      ),
    );
  }
}
