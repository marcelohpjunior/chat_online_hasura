import 'package:chat_online_hasura/app/shared/widgets/text_input_mensagem.dart';

import 'package:flutter/material.dart';

class MensagemPage extends StatefulWidget {
  final String title;
  const MensagemPage({Key? key, this.title = "Mensagem"}) : super(key: key);
  @override
  MensagemPageState createState() => MensagemPageState();
}

class MensagemPageState extends State<MensagemPage> {
  String a = "";
  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).size.width);
    print(Theme.of(context).platform);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Padding(
          padding: Theme.of(context).platform != TargetPlatform.android &&
                  Theme.of(context).platform != TargetPlatform.iOS
              ? const EdgeInsets.only(right: 20)
              : const EdgeInsets.only(right: 0),
          child: Column(
            children: <Widget>[
              Expanded(child: Container()),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: TextInputMensagem(
                  onChanged: (text) {
                    print(text);
                    a = text;
                  },
                  onSendMessage: () {
                    print("Msg enviada: $a");
                    a = "";
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
