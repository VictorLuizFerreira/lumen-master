
import 'package:flutter/material.dart';
import 'package:lumen/pages/login/widgets/login_cadastro_invite.dart';
import 'package:lumen/pages/login/widgets/login_form.dart';

import 'package:lumen/shared/values/custom_colors.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        height: MediaQuery
            .of(context)
            .size
            .height,
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
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
        child: AnimatedOpacity(
          opacity: 1.0,
          duration: const Duration(milliseconds: 1200),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                      padding: const EdgeInsets.only(
                        bottom: 15,
                      ),
                      child: Image.asset(
                        "assets/logo.png",
                        height: 125,
                      ),
                    ),
                 Column(
                    children: const [
                      Text(
                        "Bem-vindo",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      LoginForm(),
                      LoginCadastroInvite(),
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











