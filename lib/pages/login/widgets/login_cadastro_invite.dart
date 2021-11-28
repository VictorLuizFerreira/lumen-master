import 'package:flutter/material.dart';
import 'package:lumen/pages/cadastro/cadastro_page.dart';
import 'package:lumen/shared/values/custom_colors.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class LoginCadastroInvite extends StatefulWidget {
  const LoginCadastroInvite({Key? key}) : super(key: key);

  @override
  _LoginCadastroInviteState createState() => _LoginCadastroInviteState();
}

class _LoginCadastroInviteState extends State<LoginCadastroInvite> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Padding(
          padding: EdgeInsets.only(
              bottom: 12
          ),
        ),

        const Padding(padding: EdgeInsets.only(bottom: 10)),

        const Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Divider(
            color: Colors.black,
          ),
        ),
        const Text(
          "Ainda não possui conta?",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 13
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: ElevatedButton(
            onPressed: () {
              showBarModalBottomSheet(
                  context: context,
                  builder: (context){
                    return const SignUpPage();
              },
              );
            },
            child: const Text(
              "Cadastrar-se",
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                      ),
                  ),
                backgroundColor: MaterialStateProperty.all(CustomColors().getActiveSecondaryButtonColor()),
                ),
          ),
        ),
      ],
    );
  }
}
