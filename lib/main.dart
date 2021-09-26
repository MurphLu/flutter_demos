import 'package:flutter/material.dart';
import 'package:flutter_demos/app/app.dart';
import 'package:flutter_demos/app/config/app_injection.dart';
import 'package:flutter_demos/app/service/di/dart_injection.dart';

void main() {
  startDartIn(appModules);
  runApp(MyApp());
}
