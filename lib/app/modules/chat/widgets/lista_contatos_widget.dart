import 'dart:math';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ListaContatosWidget extends StatelessWidget {
  final Function()? onTap;
  final Function()? onLongPress;
  final Function()? onAvatarTap;
  final String titulo;
  final String? fotoUrl;
  final bool showQtdMensagem;
  final int qtdMensagem;
  const ListaContatosWidget(
      {Key? key,
      this.onTap,
      this.onLongPress,
      this.onAvatarTap,
      this.titulo = "",
      this.fotoUrl,
      this.showQtdMensagem = false,
      this.qtdMensagem = 0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 20,
        itemBuilder: (context, index) {
          var qtdMensagens = Random().nextInt(150);
          return InkWell(
            onTap: onTap,
            onLongPress: onLongPress,
            child: Card(
              color: Theme.of(context).primaryColor,
              child: ListTile(
                title: Text("$titulo $index"),
                leading: InkWell(
                  onTap: onAvatarTap,
                  child: CircleAvatar(
                    child: fotoUrl == null
                        ? Icon(
                            FontAwesomeIcons.userAlt,
                            size: 20,
                          )
                        : Image.network(
                            fotoUrl!,
                            fit: BoxFit.contain,
                          ),
                    backgroundColor: Theme.of(context).accentColor,
                  ),
                ),
                trailing: showQtdMensagem != true
                    ? null
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 25,
                            height: 25,
                            decoration: BoxDecoration(
                              color: Theme.of(context).accentColor,
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: Text(
                                qtdMensagens < index
                                    ? "0"
                                    : qtdMensagens > 99
                                        ? "+99"
                                        : "$qtdMensagens",
                                style: TextStyle(
                                  color: Theme.of(context).primaryColorDark,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
              ),
            ),
          );
        });
  }
}
