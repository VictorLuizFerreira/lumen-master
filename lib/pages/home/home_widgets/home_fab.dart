import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import 'home_list_model.dart';
import 'home_modal_add.dart';

FloatingActionButton getHomeFab(
    BuildContext context, List<HomeListModel> listModels, Function fncRefresh){

  return FloatingActionButton(
      child: Text(
        "+",
        style: TextStyle(fontSize: 24),
      ),
      backgroundColor: Color(0xffF2D096),
      onPressed: (){
        showBarModalBottomSheet(
            context: context,
            builder: (context) => HomeModalAdd(listModels: listModels, fncRefresh: fncRefresh),
        );
      }
      );
}