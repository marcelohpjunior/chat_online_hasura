import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextInputMensagem extends StatelessWidget {
  final Function(String)? onChanged;
  final Function() onSendMessage;
  final controller = TextEditingController();
  TextInputMensagem({
    Key? key,
    this.onChanged,
    required this.onSendMessage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: TextField(
          maxLines: null,
          controller: controller,
          decoration:
              InputDecoration.collapsed(hintText: "Enviar uma mensagem..."),
          onChanged: onChanged,
        )),
        Container(
          child: Theme.of(context).platform == TargetPlatform.iOS
              ? CupertinoButton(
                  child: Text(
                    "Enviar",
                  ),
                  onPressed: onSendMessage)
              : IconButton(
                  icon: Icon(
                    Icons.send,
                    color: Theme.of(context).accentColor,
                  ),
                  onPressed: () {
                    if (controller.text != "") {
                      onSendMessage();
                      controller.text = "";
                    }
                  },
                ),
        ),
      ],
    );
  }
}
