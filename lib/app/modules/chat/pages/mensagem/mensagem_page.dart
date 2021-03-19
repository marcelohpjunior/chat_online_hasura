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
  var loren =
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.";
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
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.only(top: 10),
                  child: ListView.builder(
                    itemCount: 30,
                    itemBuilder: (context, index) {
                      return Container(
                        alignment: index % 2 == 1
                            ? Alignment.centerLeft
                            : Alignment.centerRight,
                        child: Wrap(
                          children: [
                            ConstrainedBox(
                              constraints: BoxConstraints(
                                  maxWidth:
                                      MediaQuery.of(context).size.width * 0.60),
                              child: Container(
                                margin:
                                    const EdgeInsets.only(left: 20, bottom: 20),
                                padding: const EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Theme.of(context).primaryColor,
                                ),
                                child: Text(
                                  "$index Mensagem: $loren",
                                  textAlign: index % 2 == 1
                                      ? TextAlign.left
                                      : TextAlign.right,
                                  maxLines: null,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                    reverse: true,
                    shrinkWrap: true,
                  ),
                ),
              ),
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
