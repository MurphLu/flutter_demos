class StringUtils {
  static String prefixInteger({required int num, int minLength = 2}) {
    var target = '$num';
    while(target.length < minLength) {
      target = '0$target';
    }
    return target;
  }
}