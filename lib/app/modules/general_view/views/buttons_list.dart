import 'package:flutter/material.dart';

class ButtonsList {
  static List<Widget> buttonsList() {
    return [
      ElevatedButton(
        onPressed: () {},
        child: Text('ElevatedButton'),
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.resolveWith(
                ButtonsList.resoulveButtonBackgroundColors),
            foregroundColor: MaterialStateProperty.resolveWith(
                ButtonsList.resoulveButtonForegroundColors),
            shadowColor: MaterialStateProperty.resolveWith(
                ButtonsList.resoulveButtonForegroundColors),
            shape: MaterialStateProperty.resolveWith(
                ButtonsList.resolveButtonShape),
            elevation: MaterialStateProperty.all(5)),
      ),
    ];
  }

  static OutlinedBorder resolveButtonShape(Set<MaterialState> states) {
    if (states.contains(MaterialState.pressed)) {
      return RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)));
    }
    return RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(5)));
  }

  static Color resoulveButtonShadowColors(Set<MaterialState> states) {
    if (states.contains(MaterialState.pressed)) {
      return Colors.grey;
    }
    return Colors.white;
  }

  static Color resoulveButtonForegroundColors(Set<MaterialState> states) {
    if (states.contains(MaterialState.pressed)) {
      return Colors.white;
    }
    return Colors.yellow;
  }

  static Color resoulveButtonBackgroundColors(Set<MaterialState> states) {
    if (states.contains(MaterialState.pressed)) {
      return Colors.red;
    }
    return Colors.red;
  }
}
