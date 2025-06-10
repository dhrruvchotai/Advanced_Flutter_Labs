class UserSignUpModel {
  bool validateNameFormat(String nameValue) {
    if (!RegExp(r'^[a-z,A-z]+$').hasMatch(nameValue)) {
      return false;
    }
    return true;
  }

  bool validateEmailFormat(String emailValue) {
    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(emailValue)) {
      return false;
    }
    return true;
  }

  bool validatePhoneNumberFromat(String phoneNumValue) {
    if (!RegExp('r').hasMatch(phoneNumValue)) {
      return false;
    }
    return true;
  }

  bool validatePasswordFormat(String passwordValue) {
    if (!RegExp(
      r'^(?=.[A-Z])(?=.[a-z])(?=.\d)(?=.[!@#\$&*~]).{8,}$',
    ).hasMatch(passwordValue)) {
      return false;
    }
    return true;
  }
}
