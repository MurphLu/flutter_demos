
class RegGenerators {
  static RegExp numbers = RegExp(r"^[0-9]+$");
  static RegExp lowerCaseLetter = RegExp(r"^[a-z]+$");
  static RegExp upperCaseLetter = RegExp(r"^[A-Z]+$");
  static RegExp lettersAndNumber = RegExp(r"^[A-Za-z0-9]+$");
  static RegExp charactorsOnly = RegExp(r"^[\p{L} .'-]+$", unicode: true);
  static RegExp charactorAndNumber = RegExp(r"^[\d\p{L} .'-]+$", unicode: true);
}