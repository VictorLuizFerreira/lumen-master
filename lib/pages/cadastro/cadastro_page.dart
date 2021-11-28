import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:lumen/pages/cadastro/cadastro_service.dart';
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
  final TextEditingController _nameInputController = TextEditingController();
  final TextEditingController _mailInputController = TextEditingController();
  final TextEditingController _phoneInputController = TextEditingController();
  final TextEditingController _passwordInputController = TextEditingController();

  bool _obscurePassword = true;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 30),

        height: MediaQuery.of(context).size.height * 1.2,
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
              const Text(
                  "Cadastro",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold
                ),
              ),
              const Padding(
                  padding: EdgeInsets.only(bottom: 10)
              ),
              Form(
                key: _formKey,
                  child: Column(
                  children: [
                    TextFormField(
                      validator: (value) {
                        if (value!.length < 10) {
                          return "Digite um nome maior";
                        }
                        return null;
                      },
                      controller: _nameInputController,
                      autofocus: true,
                    style: const TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
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
                      validator: (value){
                        if(value!.length < 4){
                          return "E-mail curto demais";
                        } else if (!value.contains("@")){
                          return "E-mail faltando caracter";
                        }
                        return null;
                      },
                      controller: _mailInputController,
                    style: const TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
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
                      validator: (value){
                        if(value!.length < 8){
                          return "Telefone curto demais";
                        }
                        return null;
                      },
                      controller: _phoneInputController,
                      style: const TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
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

                    TextFormField(
                      validator: (value){
                        if (value!.length < 6){
                          return "A senha deve possuir no mínimo 6 caracteres";
                        }
                        return null;
                      },
                      obscureText: _obscurePassword,
                      controller: _passwordInputController,
                      style: const TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
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

                    Row(
                      children: [
                        Checkbox(
                          value: this._obscurePassword,
                          onChanged: (bool? value) {
                            setState(() {
                              this._obscurePassword = value!;
                            });
                          },
                        ),
                        const Text(
                          "Ocultar senha",
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
                child: const Text(
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
    );
  }
  void _doSignUp(){
    if (_formKey.currentState!.validate()) {
      CadastroService().cadastrar(
          _mailInputController.text,
          _passwordInputController.text,
      );
    } else{
      print("inválido");
    }

    //LoginModel newUser = LoginModel(
      //name: _nameInputController.text,
      //mail: _mailInputController.text,
      //phone: _phoneInputController.text,
      //password: _passwordInputController.text,
      //keepOn: true,
   // );

   // print(newUser);
   // _saveUser(newUser);
  }

  void _saveUser(LoginModel user) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(
        PreferencesKeys.activeUser,
        json.encode(user.toJson()),
    );
  }
}


