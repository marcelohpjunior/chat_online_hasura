import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
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
      body: Observer(
        builder: (context) => Center(
            child: Text(
          '${store.counter}',
          style: TextStyle(fontSize: 18),
        )),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          store.increment();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
