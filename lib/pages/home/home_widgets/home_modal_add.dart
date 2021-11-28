import 'package:flutter/material.dart';
import 'package:lumen/shared/values/custom_colors.dart';

import 'home_list_model.dart';


class HomeModalAdd extends StatefulWidget {
  final List<HomeListModel>? listModels;
  final Function? fncRefresh;
  const HomeModalAdd({this.listModels, this.fncRefresh});

  @override
  _HomeModalAddState createState() => _HomeModalAddState();
}

class _HomeModalAddState extends State<HomeModalAdd> {
  final TextEditingController _nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.8,
      child: Padding(
        padding: const EdgeInsets.all(40),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                  "Adicionar Restaurante",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: "Qual o nome do restaurante?"),
              ),
              const Padding(padding: EdgeInsets.only(bottom: 35)),
              ElevatedButton(
                  onPressed: (){
                    addInList();
                  },
                  child: const Text("Adicionar"),
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(CustomColors().getappBarMainColor())
                  ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  addInList(){
    HomeListModel hml = HomeListModel(
        assetIcon: "assets/icons/faustoemanu.png",
        title: _nameController.text);
    setState(() {
      widget.listModels!.add(hml);
    });
    widget.fncRefresh!();
    Navigator.pop(context);
  }
}
