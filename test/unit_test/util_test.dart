import 'package:flutter/material.dart';
import 'package:flutter_demos/app/utils/colors/color_ext.dart';
import 'package:flutter_demos/app/utils/test_enum.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testEnumExtensions();
  testColorUtils();
}

void testEnumExtensions() {
  test('test enum extensions', () {
    final result = hello.are.rawValue;
    expect(result, 'are');
  });
}

void testColorUtils(){
  test('color hex', (){
    final result = ColorUtil.hexToColor('#AAA');
    expect(result.value, 0xFFAAAAAA);
    final result2 = ColorUtil.hexToColor('#999999');
    expect(result2.value, 0xFF999999);
    final result3 = ColorUtil.hexToColor('#FF999999');
    expect(result3.value, 0xFF999999);
  });
}
