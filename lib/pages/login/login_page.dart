import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:lumen/pages/cadastro/cadastro_page.dart';
import 'package:lumen/shared/models/login_model.dart';
import 'package:lumen/shared/values/custom_colors.dart';
import 'package:lumen/shared/values/preferences_keys.dart';

import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  TextEditingController _mailInputController = TextEditingController();
  TextEditingController _passwordInputController = TextEditingController();
  bool continueConnected = false;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              CustomColors().getGradientMainColor(),
              CustomColors().getGradientSecondColor(),
              ],
          ),
        ),
        child: SingleChildScrollView(child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [

            Padding(padding: EdgeInsets.only(
              bottom: 15,
            ),
              child: Image.asset("assets/logo.png",
                height: 125,
              ),
            ),
            Text(
              "Bem-vindo",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold
              ),
            ),
            Form(
                child: Column(
                  children: [
                    TextFormField(
                      controller: _mailInputController,
                      autofocus: true,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                          labelText: "E-mail",
                          labelStyle: TextStyle(color: Colors.white),
                          prefixIcon: Icon(
                              Icons.mail_outline,
                              color: Colors.white,
                          ),

                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                            color: Colors.white,
                            ),
                            ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white,
                            ),
                          ),
                        ),
                    ),
                    TextFormField(
                      obscureText: true,
                      controller: _passwordInputController,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        labelText: "Senha",
                        labelStyle: TextStyle(color: Colors.white),
                        prefixIcon: Icon(
                          Icons.vpn_key_outlined,
                          color: Colors.white,
                        ),

                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                          ),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
            ),
            Padding(
                padding: EdgeInsets.only(
                    bottom: 12
                ),
            ),
            GestureDetector(
              onTap: (){print("worked!");},
              child: Text(
                "Esqueceu a senha?",
                textAlign: TextAlign.right,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 15
                ),
              ),
            ),
            Padding(padding: EdgeInsets.only(bottom: 10)),
            Row(
              children: [
              Checkbox(
              value: this.continueConnected,
              onChanged: (bool? value) {
                setState(() {
                  this.continueConnected = value!;
                });
              },
              ),
                Text(
                    "Lembrar senha",
                    style: TextStyle(color: Colors.white),
                ),
              ],
            ),
            ElevatedButton(
                onPressed: () {
                  _doLogin();
                },
                child: Text(
                  "Entrar",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                  CustomColors().getActivePrimaryButtonColor(),
                ),
                shape: MaterialStateProperty.all<OutlinedBorder>(
                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                ),
              ),
              //shape:
            ),
            Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child:   Divider(
                  color: Colors.black,
                  ),
                ),
            Text("Ainda não possui conta?", textAlign: TextAlign.center, style: TextStyle(fontSize: 13),),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: RaisedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SignUpPage()
                    ),
                );
              },
              child: Text(
                "Cadastrar-se",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              color: CustomColors().getActiveSecondaryButtonColor(),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
            ),)
          ],
        ),
      ),
      ),
    );
  }
  void _doLogin() async {
    String mailForm = this._mailInputController.text;
    String passForm = this._passwordInputController.text;

    LoginModel savedUser = await _getSavedUser();

    if(mailForm == savedUser.mail && passForm == savedUser.password){
      print("Login efetuado com sucesso!");
    }else{
      print("Falha no login");
    }
    //print(savedUser);
  }

  Future<LoginModel> _getSavedUser() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? jsonUser = prefs.getString(PreferencesKeys.activeUser);
    print(jsonUser);

    Map<String,dynamic> mapUser = json.decode(jsonUser!);
    LoginModel user = LoginModel.fromJson(mapUser);
    return user;
  }
}

