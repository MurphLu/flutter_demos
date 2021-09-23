import 'package:flutter/material.dart';
import 'package:flutter_demos/app/modules/forms/forms.dart';
import 'package:flutter_demos/app/modules/general_view/general_views_page.dart';
import 'package:flutter_demos/app/utils/navigator_util.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Map<String, WidgetBuilder>> list = [
    {"通用组件": (_) => GeneralViewPage()},
    {"表单": (_) => Forms()},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
          child: ListView.builder(
              itemCount: list.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                    onTap: () {
                      pushBuilder(
                          context: context, builder: list[index].values.first);
                    },
                    child: Container(
                      color: Color(0xFF64363C),
                      height: 50,
                      child: Container(
                        alignment: Alignment(-0.9, 0.0),
                        child: Text(
                          list[index].keys.first,
                          style: TextStyle(color: Color(0xFF64363C ^ 0x00FFFFFF)),
                        ),
                      ),
                    ));
              })),
    );
  }
}
