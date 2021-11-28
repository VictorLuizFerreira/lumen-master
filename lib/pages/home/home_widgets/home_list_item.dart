import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:lumen/pages/home/home_widgets/home_list_model.dart';
import 'package:lumen/shared/values/custom_colors.dart';

class HomeListItem extends StatefulWidget {
  final HomeListModel? homeListModel;
  HomeListItem({this.homeListModel});


  @override
  _HomeListItemState createState() => _HomeListItemState();
}

class _HomeListItemState extends State<HomeListItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      child: Column(
        children: [
          Container(
            height: 15,
            decoration: BoxDecoration(
                color: CustomColors().getappBarMainColor(),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(7),
                  topRight: Radius.circular(7),
                ),
            ),
          ),
          Container(
            height: 42,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(7),
                bottomRight: Radius.circular(7),
              ),
            ),
            child: Container(
              padding: const EdgeInsets.all(4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset(widget.homeListModel!.assetIcon!),
                      const Padding(padding: EdgeInsets.only(left: 15)),
                      Text(
                          widget.homeListModel!.title!,
                          style: TextStyle(
                              color: CustomColors().getGradientMainColor(),
                              fontWeight: FontWeight.bold
                          ),
                      ),
                    ],
                  ),
                  Icon(
                    Icons.close,
                    color: Colors.red,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
