import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:lumen/shared/models/login_model.dart';
import 'package:lumen/shared/values/custom_colors.dart';
import 'package:lumen/shared/values/preferences_keys.dart';

import 'package:shared_preferences/shared_preferences.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController _nameInputController = TextEditingController();
  TextEditingController _mailInputController = TextEditingController();
  TextEditingController _phoneInputController = TextEditingController();
  TextEditingController _passwordInputController = TextEditingController();

  bool showPassword = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 50, horizontal: 50),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              CustomColors().getGradientSecondColor(),
              CustomColors().getGradientMainColor(),
            ]
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                  "Cadastro",
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
                      controller: _nameInputController,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      labelText: "Nome Completo",
                      labelStyle: TextStyle(color: Colors.white),
                      prefixIcon: Icon(
                        Icons.person_add_alt,
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
                      controller: _mailInputController,
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
                      controller: _phoneInputController,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        labelText: "Telefone",
                        labelStyle: TextStyle(color: Colors.white),
                        prefixIcon: Icon(
                          Icons.phone_outlined,
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

                    (this.showPassword == false)?
                    TextFormField(
                      controller: _passwordInputController,
                      obscureText: (this.showPassword == true) ? false : true,
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
                    ):Container(),

                    Row(
                      children: [
                        Checkbox(
                          value: this.showPassword,
                          onChanged: (bool? value) {
                            setState(() {
                              this.showPassword = value!;
                            });
                          },
                        ),
                        Text(
                          "Mostrar senha",
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ],
              ),
              ),
              RaisedButton(
                onPressed: (){
                  _doSignUp();
                },
                child: Text(
                  "Cadastrar"
                ),
                color: CustomColors().getActiveSecondaryButtonColor(),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  void _doSignUp(){
    LoginModel newUser = LoginModel(
      name: _nameInputController.text,
      mail: _mailInputController.text,
      phone: _phoneInputController.text,
      password: _passwordInputController.text,
      keepOn: true,
    );

    print(newUser);
    _saveUser(newUser);
  }

  void _saveUser(LoginModel user) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(
        PreferencesKeys.activeUser,
        json.encode(user.toJson())
    );
  }
}
