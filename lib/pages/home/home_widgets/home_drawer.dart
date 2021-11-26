import 'package:flutter/material.dart';
import 'package:lumen/shared/values/custom_colors.dart';

Drawer getHomeDrawer(){
  return Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: [
        UserAccountsDrawerHeader(
            decoration: BoxDecoration(color: CustomColors().getappBarMainColor()),
            accountName: Text("Victor Luiz Ferreira"),
            accountEmail: Text("victor.lf@sempreceub.com"),
          currentAccountPicture: CircleAvatar(
            backgroundColor: Colors.white,
            child: Text(
              "VF",
              style: TextStyle(fontSize: 40),
            ),
          ),
        ),

        ListTile(
          leading: Icon(
              Icons.settings,
              color: CustomColors().getappBarMainColor()
          ),
          title: Text(
              "Configurações",
              ),
        ),
        ListTile(
          leading: Icon(
              Icons.arrow_back_sharp,
              color: CustomColors().getappBarMainColor()
          ),
          title: Text(
            "Sair",
          ),
        )
      ],
    ),
  );
}