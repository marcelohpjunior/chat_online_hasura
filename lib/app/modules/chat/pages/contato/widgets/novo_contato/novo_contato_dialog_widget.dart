import 'package:chat_online_hasura/app/shared/widgets/text_border_input_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'novo_contato_store.dart';

class NovoContatoDialogWidget extends StatefulWidget {
  const NovoContatoDialogWidget({Key? key}) : super(key: key);

  static Future<void> showNovoContatoDialog(BuildContext context,
      {GlobalKey? key}) async {
    return showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return NovoContatoDialogWidget();
        });
  }

  @override
  _NovoContatoDialogWidgetState createState() =>
      _NovoContatoDialogWidgetState();
}

class _NovoContatoDialogWidgetState
    extends ModularState<NovoContatoDialogWidget, NovoContatoStore> {
  @override
  Widget build(BuildContext context) {
    var controller = TextEditingController();
    var _contato = "";
    return Observer(builder: (context) {
      return SimpleDialog(key: widget.key, children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Radio(
                            groupValue: store.value,
                            onChanged: (int? value) {
                              store.value = value ?? 0;
                            },
                            value: 0,
                          ),
                          Text("E-mail"),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 30),
                        child: Row(
                          children: [
                            Radio(
                              groupValue: store.value,
                              onChanged: (int? value) {
                                store.value = value ?? 0;
                              },
                              value: 1,
                            ),
                            Text("Telefone"),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: 500),
                  child: TextBorderInputWidget(
                      textEditingController: controller,
                      onChanged: (text) {
                        _contato = text;
                        print(text);
                      },
                      labelText: store.value == 0 ? "E-mail" : "Telefone",
                      hintText:
                          store.value == 0 ? "email@email.com" : "ddd + número",
                      keyboardType: TextInputType.text),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        child: Text(
                          "Cancelar",
                          style: TextStyle(
                            color: Theme.of(context).accentColor,
                          ),
                        ),
                        onPressed: () {
                          Modular.to.pop();
                        },
                      ),
                      TextButton(
                        onPressed: () {
                          print("Contato $_contato Adicionado");
                          _contato = "";
                          controller.text = "";
                          Modular.to.pop();
                        },
                        child: Text(
                          "Adicionar",
                          style: TextStyle(
                            color: Theme.of(context).accentColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ]),
        )
      ]);
    });
  }
}
