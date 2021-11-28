import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lumen/shared/values/custom_colors.dart';

import '../login_page.dart';

class LoginSplash extends StatefulWidget {
  const LoginSplash({Key? key}) : super(key: key);

  @override
  _LoginSplashState createState() => _LoginSplashState();
}

class _LoginSplashState extends State<LoginSplash> {

  bool _isVisible = false;

  _LoginSplashState() {
    Timer(const Duration(milliseconds: 2000), () {
      setState(() {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => const LoginPage()),
                (route) => false);
      });
    });

    Timer(const Duration(milliseconds: 10), () {
      setState(() {
        _isVisible = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: Visibility(
        visible: _isVisible,
        child: const Center(
          child: SizedBox(
            height: 200.0,
            width: 200.0,
            child: Center(
              child: ClipRect(
                child: Image(
                  image: AssetImage('assets/logo.png'),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
