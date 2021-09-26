import 'package:flutter/material.dart';
import 'package:flutter_demos/app/modules/animations/views/basic_animation.dart';

class AnimationsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('动画'),),
      body: Container(
        child: BasicAnimation(),
      ),
    );
  }
}