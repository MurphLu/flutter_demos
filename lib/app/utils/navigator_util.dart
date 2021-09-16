import 'package:flutter/material.dart';

pushBuilder({required BuildContext context, required WidgetBuilder builder}){
  Navigator.of(context).push(MaterialPageRoute(builder: builder));
}