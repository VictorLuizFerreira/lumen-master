import 'package:flutter/material.dart';

class CustomColors{
  Color _activePrimaryButtonColor = Color.fromARGB(255, 204, 105, 0);
  Color _activeSecondaryButtonColor = Color.fromARGB(255, 230, 230, 230);
  Color _gradientMainColor = Color.fromARGB(255, 204, 105, 0);
  Color _gradientSecondColor = Color.fromARGB(255, 241, 207, 146);

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
}