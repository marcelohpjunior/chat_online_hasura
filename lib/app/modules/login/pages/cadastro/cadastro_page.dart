import 'package:chat_online_hasura/app/modules/login/pages/cadastro/cadastro_controller.dart';
import 'package:chat_online_hasura/app/shared/widgets/text_border_input_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CadastroPage extends StatefulWidget {
  final String title;
  const CadastroPage({Key? key, this.title = "Cadastro"}) : super(key: key);
  @override
  CadastroPageState createState() => CadastroPageState();
}

class CadastroPageState extends ModularState<CadastroPage, CadastroController> {
  var email = '';
  var senha = '';
  var nome = '';
  var sobrenome = '';
  var telefone = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Center(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(maxWidth: 500),
                    child: TextBorderInputWidget(
                      onChanged: (text) {
                        nome = text;
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
                    child: TextBorderInputWidget(
                        onChanged: (text) {
                          sobrenome = text;
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
                    child: TextBorderInputWidget(
                      onChanged: (text) {
                        telefone = text;
                      },
                      labelText: "Telefone",
                      hintText: "ddd + número",
                      keyboardType: TextInputType.phone,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(maxWidth: 500),
                    child: TextBorderInputWidget(
                      onChanged: (text) {
                        email = text;
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
                    child: TextBorderInputWidget(
                      onChanged: (text) {
                        senha = text;
                      },
                      labelText: "Senha",
                      hintText: "********",
                      obscureText: true,
                      keyboardType: TextInputType.visiblePassword,
                    ),
                  ),
                ),
                Observer(builder: (context) {
                  if (controller.carregando) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: CircularProgressIndicator(),
                    );
                  }

                  return Padding(
                    padding: const EdgeInsets.only(top: 40, bottom: 20),
                    child: ElevatedButton(
                      onPressed: () async {
                        try {
                          await controller.cadastrar(
                              email, senha, nome, sobrenome, telefone);

                          if (controller.usuarioStore.usuario != null) {
                            Modular.to.navigate('/chat', replaceAll: true);
                          }
                        } catch (e) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              backgroundColor: Colors.red,
                              content: Text(
                                e.toString(),
                                textAlign: TextAlign.center,
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          );
                        }
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
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
