class ProfileCardModel {
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
}

class User {
  String? name;
  String? email;
  String? phone;

  User({this.name, this.email, this.phone});
}
