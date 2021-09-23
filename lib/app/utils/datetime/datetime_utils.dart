import 'package:flutter_demos/app/utils/string/string_utils.dart';
import 'package:intl/intl.dart';

class DateTimeUtils {
  static String formattedTimerCountDown(
      {required int seconds, bool forceShowHour = false}) {
    int day = seconds ~/ 3600 ~/ 24;
    int hour = seconds % (3600 * 24) ~/ 3600;
    int minute = seconds % 3600 ~/ 60;
    int second = seconds % 60;
    String hourStr = StringUtils.prefixInteger(num: hour);
    String minuteStr = StringUtils.prefixInteger(num: minute);
    String secondStr = StringUtils.prefixInteger(num: second);

    if (day != 0) {
      return '$day天$hourStr:$minuteStr:$secondStr';
    } else if (hour != 0 || forceShowHour) {
      return '$hourStr:$minuteStr:$secondStr';
    } else if (minute != 0) {
      return '$minuteStr:$secondStr';
    } else if (second != 0) {
      return '$secondStr';
    } else {
      return '';
    }
  }

  static String currentDateString() {
    return DateFormat('yyyy-MM-dd').format(DateTime.now());
  }

  static String currentDateTimeString() {
    return DateFormat('yyyy-MM-dd HH:mm:ss.SSS').format(DateTime.now());
  }
}
