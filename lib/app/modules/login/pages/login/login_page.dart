import 'package:chat_online_hasura/app/shared/widgets/text_border_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class LoginPage extends StatefulWidget {
  final String title;
  const LoginPage({this.title = "Login"}) : super();
  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 50),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/logo.png',
                        height: 100,
                        width: 100,
                      ),
                      Container(
                        // color: Colors.red,
                        width: MediaQuery.of(context).size.width - 40,
                        child: Center(
                          child: Text(
                            "Chat Online Hasura",
                            style: TextStyle(fontSize: 25),
                            textAlign: TextAlign.center,
                          ),
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
                  hintText: "email@email.com",
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: TextBorderInput(
                    onChanged: (text) {
                      print(text);
                    },
                    labelText: "Senha",
                    hintText: "********",
                    obscureText: true,
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
                    child: ConstrainedBox(
                      constraints: BoxConstraints(minWidth: 100),
                      child: Container(
                        child: Text(
                          "ENTRAR",
                          style: TextStyle(
                              color: Theme.of(context).primaryColorDark),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
