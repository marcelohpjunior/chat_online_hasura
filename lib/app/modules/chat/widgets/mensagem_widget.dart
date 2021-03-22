import 'package:flutter/material.dart';

class MensagemWidget extends StatelessWidget {
  final int index;
  final String mensagem;
  const MensagemWidget({Key? key, this.index = 0, this.mensagem = ""})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: index % 2 == 1 ? Alignment.centerLeft : Alignment.centerRight,
      child: Wrap(
        children: [
          ConstrainedBox(
            constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * 0.70),
            child: Container(
              margin: const EdgeInsets.only(left: 20, bottom: 20, right: 20),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: index % 2 == 1
                    ? Theme.of(context).primaryColor
                    : Theme.of(context).accentColor,
              ),
              child: Text(
                "$index Mensagem: $mensagem",
                textAlign: index % 2 == 1 ? TextAlign.left : TextAlign.right,
                maxLines: null,
                style: index % 2 == 1
                    ? TextStyle(color: Colors.white)
                    : TextStyle(color: Colors.black),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
