import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextInputMensagemWidget extends StatelessWidget {
  final Function(String)? onChanged;
  final Function() enviaMensagem;
  final _controller = TextEditingController();

  TextInputMensagemWidget({
    Key? key,
    this.onChanged,
    required this.enviaMensagem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _enviaMensagem() {
      if (_controller.text != "") {
        enviaMensagem();
        _controller.text = "";
      }
    }

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
                    onPressed: _enviaMensagem,
                  )
                : IconButton(
                    icon: Icon(
                      Icons.send,
                      color: Theme.of(context).accentColor,
                    ),
                    onPressed: _enviaMensagem,
                  ),
          ),
        ],
      ),
    );
  }
}
