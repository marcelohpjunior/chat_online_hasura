import 'package:chat_online_hasura/app/modules/chat/pages/contato/contatos_controller.dart';
import 'package:chat_online_hasura/app/modules/chat/pages/contato/widgets/novo_contato/novo_contato_dialog_widget.dart';
import 'package:chat_online_hasura/app/modules/chat/widgets/lista_contatos_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ContatosPage extends StatefulWidget {
  final String title;
  const ContatosPage({Key? key, this.title = "Contatinhos"}) : super(key: key);
  @override
  ContatosPageState createState() => ContatosPageState();
}

class ContatosPageState extends ModularState<ContatosPage, ContatosController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListaContatosWidget(
        onTap: () {
          Modular.to.pushNamed('mensagem');
        },
        onLongPress: () => print("Opções"),
        titulo: "Usuário",
        onAvatarTap: () {
          print("foto perfil");
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          NovoContatoDialogWidget.showNovoContatoDialog(context);
        },
        child: Icon(
          FontAwesomeIcons.plus,
          color: Theme.of(context).primaryColorDark,
          size: 20,
        ),
      ),
    );
  }
}
