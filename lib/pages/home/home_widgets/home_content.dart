import 'package:flutter/material.dart';
import 'package:lumen/shared/values/custom_colors.dart';

import 'home_list_item.dart';
import 'home_list_model.dart';

class HomePageContent extends StatefulWidget {
  final List<HomeListModel>? listModels;
  const HomePageContent({this.listModels});

  @override
  _HomePageContentState createState() => _HomePageContentState();
}

class _HomePageContentState extends State<HomePageContent> {


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
      padding: const EdgeInsets.symmetric(
          vertical: 50,
          horizontal: 20
      ),
      child: ListView.builder(
        itemCount: widget.listModels!.length,
        itemBuilder: (context, index){
          return HomeListItem(
            homeListModel: widget.listModels![index],
          );
        },
      ),
    );
  }
}
