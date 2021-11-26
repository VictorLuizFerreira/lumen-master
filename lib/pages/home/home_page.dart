import 'package:flutter/material.dart';
import 'package:lumen/pages/home/home_widgets/home_appbar.dart';
import 'package:lumen/pages/home/home_widgets/home_content.dart';
import 'package:lumen/pages/home/home_widgets/home_drawer.dart';

import 'home_widgets/home_fab.dart';
import 'home_widgets/home_list_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<HomeListModel> listModels = [
    HomeListModel(title: "Fausto e Manuel", assetIcon: "assets/icons/faustoemanu.png"),
    HomeListModel(title: "Capricho Gaúcho", assetIcon: "assets/icons/caprichogaucho.png"),
    HomeListModel(title: "Os Pimentas", assetIcon: "assets/icons/ospimentas.png")
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getHomeAppBar(),
      drawer: getHomeDrawer(),
      floatingActionButton: getHomeFab(context, listModels, refreshPage),
      body: HomePageContent(listModels: listModels,
      ),
    );
  }

  refreshPage(){
    setState(() {

    });
  }
}
