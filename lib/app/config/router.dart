import 'package:flutter/material.dart';
import 'package:flutter_demos/app/modules/general_view/general_views_page.dart';

const ROUTE_GENERAL_VIEW = 'route_gengeral_view';
class AppRouter {
  factory AppRouter() => _instance;

  static AppRouter instance() => _instance;

  static final AppRouter _instance = AppRouter._();

  AppRouter._();

  Map<String, WidgetBuilder> routes = {
    ROUTE_GENERAL_VIEW: (_) => GeneralViewPage(),
  };
}