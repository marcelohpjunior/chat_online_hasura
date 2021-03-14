import 'package:chat_online_hasura/app/shared/widgets/text_border_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class LoginPage extends StatefulWidget {
  final String title;
  const LoginPage({this.title = "LoginPage"}) : super();
  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
            child: Stack(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 50),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/images/logo.png',
                            height: 100,
                            width: 100,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Text(
                              "Chat Online Hasura",
                              style: TextStyle(fontSize: 30),
                            ),
                          ),
                        ],
                      ),
                    ),
                    TextBorderInput(
                      onChanged: (text) {
                        print(text);
                      },
                      labelText: "E-mail",
                      // labelFontSize: 20,
                      hintText: "email@email.com",
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: TextBorderInput(
                        onChanged: (text) {
                          print(text);
                        },
                        labelText: "Senha",
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30, bottom: 10),
                      child: ElevatedButton(
                        onPressed: () async {
                          Modular.to.navigate('/chat', replaceAll: true);
                        },
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                Theme.of(context).accentColor)),
                        child: Text(
                          "ENTRAR",
                          style: TextStyle(
                              color: Theme.of(context).primaryColorDark),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
