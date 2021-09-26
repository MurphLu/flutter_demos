import 'package:flutter/material.dart';

class BasicAnimation extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _BasicAnimationState();
}

class _BasicAnimationState extends State<BasicAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    animation = Tween<double>(begin: 1, end: 200).animate(controller)
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    print(animation.value);
    return Container(
      height: 300,
      width: double.infinity,
      color: Colors.green,
      child: Stack(
        children: [
          Positioned(
              left: animation.value,
              child: Container(
                color: Colors.white,
                height: animation.value,
                width: animation.value,
              )),
          Positioned(
            bottom: 10,
            left: 10,
            child: ElevatedButton(
                onPressed: () {
                  controller.forward(from: 0);
                },
                child: Text('action')),
          )
        ],
      ),
    );
  }
}
