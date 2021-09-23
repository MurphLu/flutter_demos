import 'package:flutter/material.dart';

class ColorUtil {
  static Color hexToColor(String hexString,
      {String? alphaChannel, Color? defaultColor}) {
    final _defaultColor = defaultColor ?? Colors.transparent;
    final _alphaChannel = alphaChannel ?? 'FF';
    if (hexString.isEmpty) return _defaultColor;
    var hex = hexString;
    if (hexString.startsWith('#')) {
      hex = hexString.substring(1);
    } else if (hexString.startsWith('0x')) {
      hex = hexString.substring(2);
    }
    if (hex.length == 3) {
      var temp = '';
      hex.split('').forEach((element) {
        temp = '$temp$element$element';
      });
      hex = '$_alphaChannel$temp';
    } else if (hex.length == 6) {
      hex = '$_alphaChannel$hex';
    } else if (hex.length == 8) {
      hex = hex;
    } else {
      return _defaultColor;
    }
    int val = int.tryParse(hex, radix: 16) ?? _defaultColor.value;
    return Color(val);
  }
}
