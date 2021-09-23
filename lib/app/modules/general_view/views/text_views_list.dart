import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class TextViewsList {
  static List<Widget> textWidgets() {
    return [
      Text("普通"),
      Text(
        '添加样式',
        textAlign: TextAlign.center,
        style: TextStyle(
          height: 1.2,
          fontSize: 23,
          color: Colors.grey,
        ),
      ),
      Text.rich(TextSpan(
          text: '混合样式，并且可以通过添加手势来指定不同样式点击之后触发的事件',
          style: TextStyle(color: Colors.green, fontSize: 13),
          children: [
            TextSpan(
              text: ' \n',
            ),
            TextSpan(
              text: ' 样式一',
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  print('样式一事件');
                },
              style: TextStyle(
                color: Colors.blue,
                fontSize: 15,
              ),
            ),
            TextSpan(
              text: ' 样式二',
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  print('样式二事件');
                },
              style: TextStyle(
                color: Colors.orange,
                fontSize: 30,
              ),
            ),
            TextSpan(
              text: ' 样式三',
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  print('样式三事件');
                },
              style: TextStyle(color: Colors.red, fontSize: 19),
            ),
          ])),
      Text(
        '上划线+虚线+绿色',
        style: TextStyle(
          decoration: TextDecoration.overline,
          decorationStyle: TextDecorationStyle.dashed, //划线样式
          decorationColor: Colors.green //划线颜色
          ),
      ),
      Text(
        '删除线',
        style: TextStyle(decoration: TextDecoration.lineThrough),
      ),
      Text(
        '下划线',
        style: TextStyle(decoration: TextDecoration.underline),
      ),
      Text(
        '倾斜',
        style: TextStyle(fontStyle: FontStyle.italic),
      ),
      Text(
        '最大行数，及超过最大显示数量之后日和显示，\n低价位卡了解到卡拉胶宽带连接撒开了多久就坎德雷瓦接口来等级考试拉家带口拉萨放假看论文安居客端午节安康里的达瓦',
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      )
    ];
  }
}
