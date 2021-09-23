import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_demos/app/modules/forms/views/phone_text_input.dart';

class Forms extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('表单'),
        ),
        body: SingleChildScrollView(
          child: Container(
              padding: EdgeInsets.all(30),
              child: GestureDetector(
                onTap: () {
                  print('aaa');
                  FocusScope.of(context).requestFocus(FocusNode());
                },
                child: Form(
                  key: _formKey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                            labelText: '姓名',
                            hintText: '姓名',
                            errorStyle: TextStyle(fontSize: 1)),
                        validator: (value) {
                          return null;
                        },
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(20),
                          FilteringTextInputFormatter.allow(RegExp(r"^[\p{L} .'-]+$", unicode: true)),
                        ],
                      ),
                      PhoneTextInput(
                        spliter: '-',
                        onChanged: (val) {
                          print(val);
                        },
                      ),
                      DropdownButtonFormField(
                          value: 1,
                          onChanged: (val) {
                            print(val);
                          },
                          items: [
                            DropdownMenuItem(value: 1, child: Text('1')),
                            DropdownMenuItem(value: 2, child: Text('2')),
                            DropdownMenuItem(value: 3, child: Text('3')),
                            DropdownMenuItem(value: 4, child: Text('4')),
                            DropdownMenuItem(value: 5, child: Text('5')),
                            DropdownMenuItem(value: 6, child: Text('6')),
                            DropdownMenuItem(value: 7, child: Text('7')),
                            DropdownMenuItem(value: 8, child: Text('8')),
                          ]),
                      InputDatePickerFormField(
                          fieldLabelText: '请输入日期',
                          firstDate: DateTime.fromMicrosecondsSinceEpoch(0),
                          lastDate: DateTime.now()),
                      CupertinoTextFormFieldRow(
                        placeholder: 'text',
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.green)),
                      ),
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: ElevatedButton(
                          child: Text('提交'),
                          onPressed: () {
                            if (_formKey.currentState?.validate() ?? false) {
                              print('verified');
                            } else {
                              print('invalied');
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              )),
        ));
  }
}

class PhoneNumberTextInputFormatter implements TextInputFormatter {
  String splitter;

  PhoneNumberTextInputFormatter({String? splitter})
      : this.splitter = splitter ?? ' ';
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    String newText = '';
    print(oldValue.text);
    print(newValue.text);
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
      print('${val.length} val-length');
      if (val.length == 0) {
        newText = val;
      } else if (val.substring(val.length - 1) == splitter) {
        newText = val.substring(0, val.length - 1);
      } else {
        newText = val;
      }
    }
    // print(newText);
    print(newText.length);
    return TextEditingValue(
        text: newText,
        selection: TextSelection.collapsed(offset: newText.length));
  }
}

class TextValidators {
  static final RegExp chinaMobilePhoneRegExp =
      RegExp(r'^1([3456789])[0-9]{9}$');
  static bool isValidMobilePhone(String input) {
    return chinaMobilePhoneRegExp.hasMatch(input);
  }
}
