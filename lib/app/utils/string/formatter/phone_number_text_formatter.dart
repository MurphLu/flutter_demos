import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PhoneNumberTextInputFormatter implements TextInputFormatter {
  String splitter;

  PhoneNumberTextInputFormatter({String? splitter})
      : this.splitter = splitter ?? ' ';
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    String newText = '';
    if (oldValue.text.length < newValue.text.length) {
      String val = newValue.text.replaceAll(splitter, '');
      if (val.length < 4) {
        newText = val;
      } else if (val.length <= 7) {
        newText = '${val.substring(0, 3)}$splitter${val.substring(3)}';
      } else {
        newText =
            '${val.substring(0, 3)}$splitter${val.substring(3, 7)}$splitter${val.substring(7)}';
      }
    } else {
      String val = newValue.text;
      if (val.length == 0) {
        newText = val;
      } else if (val.substring(val.length - 1) == splitter) {
        newText = val.substring(0, val.length - 1);
      } else {
        newText = val;
      }
    }
    return TextEditingValue(
        text: newText,
        selection: TextSelection.collapsed(offset: newText.length));
  }
}