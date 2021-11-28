import 'package:flutter/material.dart';
import 'package:lumen/shared/values/custom_colors.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import 'home_list_model.dart';
import 'home_modal_add.dart';

FloatingActionButton getHomeFab(
    BuildContext context, List<HomeListModel> listModels, Function fncRefresh){

  return FloatingActionButton(
      child: const Text(
        "+",
        style: TextStyle(fontSize: 24),
      ),
      backgroundColor: CustomColors().getappBarMainColor(),
      onPressed: () async {
        return await showBarModalBottomSheet(
            context: context,
            builder: (context) => HomeModalAdd(listModels: listModels, fncRefresh: fncRefresh),
        );
      }
      );
}