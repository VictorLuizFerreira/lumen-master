import 'package:flutter/material.dart';

AppBar getHomeAppBar(){
  return AppBar(
    title: Text("Restaurantes"),
    centerTitle: true,
    backgroundColor: Color(0xffF2D096),
    actions: [
      IconButton(
        icon: Icon(
        Icons.search,
        color: Colors.white,
      ), onPressed: () {  },
      ),
    ],
  );
}