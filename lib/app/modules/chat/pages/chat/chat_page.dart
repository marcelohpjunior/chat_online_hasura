import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'chat_store.dart';

class ChatPage extends StatefulWidget {
  final String title;
  const ChatPage({this.title = "Chat Online"}) : super();

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends ModularState<ChatPage, ChatStore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat Online'),
      ),
      body: WillPopScope(
        onWillPop: () async {
          showDialog(
              context: context,
              builder: (BuildContext context) {
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
                      onPressed: () {
                        Modular.to.pop();
                      },
                    ),
                    TextButton(
                      child: Text(
                        "Sim",
                        style: TextStyle(
                          color: Theme.of(context).accentColor,
                        ),
                      ),
                      onPressed: () {
                        Modular.to.navigate('/login', replaceAll: true);
                      },
                    )
                  ],
                );
              });
          return true;
        },
        child: Observer(builder: (context) {
          print(store.counter);
          return Container(
            child: ListView.builder(
                itemCount: 20,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      print("Card $index");
                      Modular.to.pushNamed('mensagem');
                    },
                    onLongPress: () => print("Card $index -> Opções"),
                    child: Card(
                      color: Theme.of(context).primaryColor,
                      child: ListTile(
                        title: Text("Usuário $index"),
                        leading: InkWell(
                          onTap: () {
                            print("foto perfil");
                          },
                          child: CircleAvatar(
                            child: Icon(
                              FontAwesomeIcons.userAlt,
                              size: 20,
                            ),
                            backgroundColor: Theme.of(context).accentColor,
                          ),
                        ),
                        trailing: Column(
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
                                  store.counter < index
                                      ? "0"
                                      : store.counter - index > 99
                                          ? "+99"
                                          : "${store.counter - index}",
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
                }),
          );
        }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          store.increment();
        },
        child: Icon(
          FontAwesomeIcons.solidComment,
          color: Theme.of(context).primaryColorDark,
          size: 20,
        ),
      ),
    );
  }
}
