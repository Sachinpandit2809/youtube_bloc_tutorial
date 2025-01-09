import 'dart:core';

class Validation {
  static bool validateEmail(String value) {
    bool emailValid =
        RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value);

    return emailValid;
  }
}
