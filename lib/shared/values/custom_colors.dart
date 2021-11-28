import 'package:flutter/material.dart';

class CustomColors{
  final Color _activePrimaryButtonColor = const Color.fromARGB(255, 204, 105, 0);
  final Color _activeSecondaryButtonColor = const Color.fromARGB(255, 230, 230, 230);
  final Color _gradientMainColor = const Color.fromARGB(255, 204, 105, 0);
  final Color _gradientSecondColor = const Color.fromARGB(255, 241, 207, 146);
  final Color _appBarMainColor = const Color(0xffF2D096);

  Color getActivePrimaryButtonColor(){
    return _activePrimaryButtonColor;
  }

  Color getActiveSecondaryButtonColor(){
    return _activeSecondaryButtonColor;
  }


  Color getGradientMainColor() {
    return _gradientMainColor;
  }

  Color getGradientSecondColor() {
    return _gradientSecondColor;
  }

  Color getappBarMainColor(){
    return _appBarMainColor;
  }
}