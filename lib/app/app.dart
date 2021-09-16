import 'package:flutter/material.dart';
import 'package:flutter_demos/app/modules/main_app/main_page.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        brightness: Brightness.light,
      ),
      home: MyHomePage(title: 'Home Page'),
    );
  }
}
