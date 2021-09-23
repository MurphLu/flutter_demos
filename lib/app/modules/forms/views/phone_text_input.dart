import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_demos/app/utils/string/formatter/phone_number_text_formatter.dart';
import 'package:flutter_demos/app/utils/string/validator/phone_number_validator.dart';

class PhoneTextInput extends StatelessWidget {
  final String spliter;
  final ValueChanged<String> onChanged;
  PhoneTextInput({String? spliter, required ValueChanged<String> onChanged}) 
  : this.spliter = spliter ?? ' ', this.onChanged = onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: '电话',
        hintText: '电话',
        errorStyle: TextStyle(fontSize: 0),
      ),
      validator: (value) {
        final val = value?.replaceAll(spliter, '') ?? '';
        if(PhoneNumberValidator.isValidMobilePhone(val)) {
          return null;
        } else {
          return '';
        }
      },
      keyboardType: TextInputType.number,
      inputFormatters: [
        LengthLimitingTextInputFormatter(11 + spliter.length * 2),
        FilteringTextInputFormatter.allow(RegExp(r'[-0-9]')),
        PhoneNumberTextInputFormatter(splitter: spliter),
      ],
      onChanged: (value){
        onChanged(value.replaceAll(spliter, ''));
      },
    );
  }
}
