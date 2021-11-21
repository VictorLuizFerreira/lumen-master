import 'package:flutter/material.dart';
import 'package:lumen/learn_firebase.dart';
import 'package:lumen/pages/login/login_page.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: LoginPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

