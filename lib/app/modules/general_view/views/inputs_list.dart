import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputsList {
  static List<Widget> inputWidgets() {
    return [
      Text('普通文本框'),
      TextField(
        decoration: InputDecoration(
            labelText: '文本框',
            hintText: '文本框',
            helperText: 'helperText',
            // errorText: null ?? 'errorText',
            hintStyle: TextStyle(color: Colors.grey, fontSize: 10),

            floatingLabelBehavior: FloatingLabelBehavior.auto
            ),
            
      ),
      Text('文本框错误提示'),
      TextField(
        decoration: InputDecoration(
            labelText: 'TextField with error',
            hintText: '文本框',
            helperText: 'helperText',
            errorText: null ?? 'errorText',
            hintStyle: TextStyle(color: Colors.grey, fontSize: 10),
            floatingLabelBehavior: FloatingLabelBehavior.auto,
            suffix: Icon(Icons.info),
            ),
      ),
      CupertinoSearchTextField(),
      TextField(
        inputFormatters: [
          LengthLimitingTextInputFormatter(11),
          FilteringTextInputFormatter.digitsOnly,
          PhoneNumberFormatter(),
        ],
        onChanged: (v){
          print(v);
        },
        decoration: InputDecoration(
            labelText: '文本框',
            hintText: '文本框',
            helperText: 'helperText',
            // errorText: null ?? 'errorText',
            hintStyle: TextStyle(color: Colors.grey, fontSize: 10),
            floatingLabelBehavior: FloatingLabelBehavior.auto
            ),)
    ];
  }
}

class PhoneNumberFormatter implements TextInputFormatter {

  String splitter;

  PhoneNumberFormatter({String? splitter}) : this.splitter = splitter ?? '-';

  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    final newText = newValue.text;
    if(newText.length <= 3) {
      return newValue;
    } else if(newText.length < 7) {
      final formattedStr = '${newText.substring(0,3)}$splitter${newText.substring(3,newText.length)}';
      return TextEditingValue(
        text: formattedStr,
        selection: TextSelection.collapsed(offset: formattedStr.length));
    } else {
      final formattedStr = '${newText.substring(0,3)}$splitter${newText.substring(3,7)}$splitter${newText.substring(7,newText.length)}';
      return TextEditingValue(
        text: formattedStr,
        selection: TextSelection.collapsed(offset: formattedStr.length));
    }
    return newValue;
  }
  
}
