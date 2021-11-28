import 'package:flutter/material.dart';
import 'package:lumen/shared/values/custom_colors.dart';

Drawer getHomeDrawer(){
  return Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: [
        UserAccountsDrawerHeader(
            decoration: BoxDecoration(color: CustomColors().getappBarMainColor()),
            accountName: const Text("Victor Luiz Ferreira"),
            accountEmail: const Text("victor.lf@sempreceub.com"),
          currentAccountPicture: const CircleAvatar(
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
          title: const Text(
              "Configurações",
              ),
        ),
        ListTile(
          leading: Icon(
              Icons.arrow_back_sharp,
              color: CustomColors().getappBarMainColor()
          ),
          title: const Text(
            "Sair",
          ),
        )
      ],
    ),
  );
}