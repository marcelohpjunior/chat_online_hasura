import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'chat_store.dart';

class ChatPage extends StatefulWidget {
  final String title;
  const ChatPage({Key key, this.title = "Chat Online"}) : super(key: key);

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
      body: Observer(builder: (context) {
        print(store.counter);
        return Container(
          child: ListView.builder(
              itemCount: 20,
              itemBuilder: (context, index) {
                return Card(
                  color: Theme.of(context).primaryColor,
                  child: ListTile(
                    title: Text("Usuário $index"),
                    leading: GestureDetector(
                      onTap: () {},
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
                );
              }),
        );
      }),
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
