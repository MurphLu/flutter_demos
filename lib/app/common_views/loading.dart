import 'package:flutter/material.dart';

class LoadingView extends StatelessWidget {
  final String? text;

  LoadingView(this.text, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
          child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Color(0x99000000),
                borderRadius: BorderRadius.all(Radius.circular(5)),
              ),
              height: 150,
              width: 150,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  CircularProgressIndicator(
                      valueColor:
                          AlwaysStoppedAnimation<Color>(Color(0xffffffff))),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    text ?? '数据加载中...',
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ))),
    );
  }
}
