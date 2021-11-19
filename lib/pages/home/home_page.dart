import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.menu, color: Colors.black87,
        ),
        title: Text(
            "Lumenu",
             style: TextStyle(
                 color: Colors.black87
             )
        ),
        backgroundColor: Colors.white),
        body: Center(child: Container(
          color: Colors.white,
          child: Text(
            "teste",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.black87),
            ),
          ),
        ),
    );
  }
}
