import 'package:chat_online_hasura/app/shared/themes/tema_escuro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chat Online',
      debugShowCheckedModeBanner: false,
      theme: temaEscuro,
      initialRoute: '/',
    ).modular();
  }
}
