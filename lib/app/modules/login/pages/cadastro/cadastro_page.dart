import 'package:chat_online_hasura/app/shared/widgets/text_border_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CadastroPage extends StatefulWidget {
  final String title;
  const CadastroPage({Key? key, this.title = "Cadastro"}) : super(key: key);
  @override
  CadastroPageState createState() => CadastroPageState();
}

class CadastroPageState extends State<CadastroPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: 500),
                  child: TextBorderInput(
                    onChanged: (text) {
                      print(text);
                    },
                    labelText: "Nome",
                    hintText: "João",
                    keyboardType: TextInputType.name,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: 500),
                  child: TextBorderInput(
                      onChanged: (text) {
                        print(text);
                      },
                      labelText: "Sobrenome",
                      hintText: "Silva",
                      keyboardType: TextInputType.name),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: 500),
                  child: TextBorderInput(
                    onChanged: (text) {
                      print(text);
                    },
                    labelText: "Telefone",
                    hintText: "ddd + numero",
                    keyboardType: TextInputType.phone,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: 500),
                  child: TextBorderInput(
                    onChanged: (text) {
                      print(text);
                    },
                    labelText: "E-mail",
                    hintText: "email@email.com",
                    keyboardType: TextInputType.emailAddress,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: 500),
                  child: TextBorderInput(
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
                padding: const EdgeInsets.only(top: 40, bottom: 20),
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
                        "Confirmar",
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
            ],
          ),
        ),
      ),
    );
  }
}
