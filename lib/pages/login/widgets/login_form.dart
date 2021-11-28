import 'package:flutter/material.dart';
import 'package:lumen/shared/values/custom_colors.dart';

import '../login_service.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController _mailInputController = TextEditingController();
  final TextEditingController _passwordInputController = TextEditingController();
  bool _obscurePassword = true;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    return Form(
      //resizeToAvoidBottomInset: false,
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
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
            autofocus: true,
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
                value: _obscurePassword,
                onChanged: (bool? value) {
                  setState(() {
                    _obscurePassword = value!;
                  });
                },

              ),

              const Text(
                "Ocultar senha",
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () {
              _doLogin();
            },
            child: const Text(
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
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
            ),
            //shape:
          ),
          GestureDetector(
            onTap: () {},
            child: const Text(
              "Esqueceu a senha?",
              textAlign: TextAlign.right,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 15
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _doLogin() async {
    if (_formKey.currentState!.validate()) {
      LoginService()
          .login(_mailInputController.text, _passwordInputController.text);
    } else {
      print("inválido");
    }
  }
}
