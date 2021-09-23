import 'package:flutter/material.dart';

class ButtonsList {
  static List<Widget> buttonsList() {
    return [
      TextButton(onPressed: () {}, child: Text('TextButton')),
      TextButton.icon(
          onPressed: () {},
          icon: Icon(Icons.info),
          label: Text('TextButton With Icon')),
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
      ElevatedButton.icon(
          onPressed: () {},
          icon: Icon(Icons.send),
          label: Text('ElevatedButton With Icon')),
      ElevatedButton.icon(
          onPressed: () {},
          icon: Icon(Icons.arrow_back),
          label: Text('ElevatedButton With Icon')),
      
      //
      //IconButton 直接使用的时候高亮渲染会有问题，需要配合Material嵌套使用
      //https://github.com/flutter/flutter/issues/30658
      //
      Material(
        child: BackButton(),
      ),
      Material(
          child: IconButton(
        onPressed: () {},
        icon: Icon(Icons.bookmark),
      ))
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
