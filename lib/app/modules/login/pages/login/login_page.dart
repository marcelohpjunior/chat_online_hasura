import 'package:chat_online_hasura/app/shared/widgets/text_border_input_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class LoginPage extends StatefulWidget {
  final String title;
  const LoginPage({Key? key, this.title = "Login"}) : super(key: key);
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
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 50, bottom: 50),
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
                ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: 500),
                  child: TextBorderInputWidget(
                      onChanged: (text) {
                        print(text);
                      },
                      labelText: "E-mail",
                      hintText: "email@email.com",
                      keyboardType: TextInputType.emailAddress),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(maxWidth: 500),
                    child: TextBorderInputWidget(
                      onChanged: (text) {
                        print(text);
                      },
                      labelText: "Senha",
                      hintText: "********",
                      obscureText: true,
                      keyboardType: TextInputType.visiblePassword,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: ElevatedButton(
                    onPressed: () {
                      Modular.to.navigate('/chat', replaceAll: true);
                    },
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            Theme.of(context).accentColor)),
                    child: ConstrainedBox(
                      constraints: BoxConstraints(minWidth: 100),
                      child: Container(
                        child: Text(
                          "Entrar",
                          style: TextStyle(
                            color: Theme.of(context).primaryColorDark,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Não possui uma conta? "),
                      InkWell(
                        onTap: () {
                          Modular.to.pushNamed('/cadastro');
                        },
                        child: Text(
                          "Cadastre-se",
                          style: TextStyle(
                            color: Theme.of(context).accentColor,
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
