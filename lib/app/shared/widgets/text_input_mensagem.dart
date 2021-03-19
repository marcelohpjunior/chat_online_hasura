import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextInputMensagem extends StatelessWidget {
  final Function(String)? onChanged;
  final Function() onSendMessage;
  final _controller = TextEditingController();
  TextInputMensagem({
    Key? key,
    this.onChanged,
    required this.onSendMessage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        children: [
          Expanded(
              child: TextField(
            maxLines: null,
            controller: _controller,
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
                    onPressed: () {
                      if (_controller.text != "") {
                        onSendMessage();
                        _controller.text = "";
                      }
                    },
                  )
                : IconButton(
                    icon: Icon(
                      Icons.send,
                      color: Theme.of(context).accentColor,
                    ),
                    onPressed: () {
                      if (_controller.text != "") {
                        onSendMessage();
                        _controller.text = "";
                      }
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
