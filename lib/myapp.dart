import 'package:flutter/material.dart';
import 'package:lumen/pages/login/widgets/login_splash.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lumenu',
      home: LoginSplash(),
      debugShowCheckedModeBanner: false,
    );
  }
}