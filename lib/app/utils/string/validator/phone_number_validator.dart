class PhoneNumberValidator {
  static final RegExp chinaMobilePhoneRegExp =
      RegExp(r'^1([3456789])[0-9]{9}$');
  static bool isValidMobilePhone(String input) {
    return chinaMobilePhoneRegExp.hasMatch(input);
  }
}
