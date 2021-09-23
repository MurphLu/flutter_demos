import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demos/app/modules/general_view/views/general_views.dart';

class GeneralViewPage extends StatelessWidget {
  GeneralViewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('通用控件'),
      ),
      body: Container(
        child: CustomScrollView(
          slivers: [
            _section(title: '文本', widgets: TextViewsList.textWidgets()),
            _section(title: '按钮', widgets: ButtonsList.buttonsList()),
            _section(title: '输入框', widgets: InputsList.inputWidgets()),
            SliverToBoxAdapter(
              child: Container(
                child: SizedBox(height: 40,)
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _section({required String title, required List<Widget> widgets}) {
    return SliverToBoxAdapter(
        child: Padding(
      padding: EdgeInsets.all(5),
      child: Container(
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
              border: Border.all(color: Color(0x66000000)),
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(5)),
              boxShadow: [
                BoxShadow(
                    color: Colors.black26,
                    offset: Offset(1, 1),
                    blurRadius: 5,
                    spreadRadius: 0.1)
              ]),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 5,),
              Container(
                height: 1,
                width: double.infinity,
                color: Colors.black12,
              ),
              SizedBox(height: 5,),
              Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: widgets),
            ],
          )),
    ));
  }
}
