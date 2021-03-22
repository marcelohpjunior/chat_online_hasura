import 'package:flutter/material.dart';

class SairDialogWidget extends StatelessWidget {
  final Function()? onPressedNao;
  final Function()? onPressedSim;
  const SairDialogWidget({Key? key, this.onPressedNao, this.onPressedSim})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Sair"),
      content: Text("Tem certeza que deseja sair?"),
      actions: <Widget>[
        TextButton(
          child: Text(
            "Não",
            style: TextStyle(
              color: Theme.of(context).accentColor,
            ),
          ),
          onPressed: onPressedNao,
        ),
        TextButton(
          child: Text(
            "Sim",
            style: TextStyle(
              color: Theme.of(context).accentColor,
            ),
          ),
          onPressed: onPressedSim,
        ),
      ],
    );
  }
}
