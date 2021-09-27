import 'package:flutter/foundation.dart';

enum hello{
  how, are, you
}

extension helloExt on hello {
  String get rawValue => describeEnum(this);
}


