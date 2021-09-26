import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AssetsUtil {
  static String _assetsImagePrefix = 'assets/images/';
  static String _assetsMockFilePrefix = 'assets/mock/';

  static AssetImage assetImage({required String imageName}) {
    return AssetImage(_imagePathWith(imageName: imageName));
  }

  static Future<dynamic> loadJson({required String fileName}) async {
    final json = await rootBundle.loadString(_mockJsonPathWith(fileName: fileName));
    return jsonDecode(json);
  }

  static String _imagePathWith({required String imageName}) {
    return '$_assetsImagePrefix$imageName';
  }

  static String _mockJsonPathWith({required String fileName}) {
    return '$_assetsMockFilePrefix$fileName';
  }
}