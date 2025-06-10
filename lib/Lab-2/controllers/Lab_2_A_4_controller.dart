import 'package:advance_flutter_lab/Lab-2/models/Lab_2_A_2_3_model.dart';
import 'package:advance_flutter_lab/Lab-2/models/Lab_2_A_4_model.dart';

class ProfileCardController {
  UserSignUpModel _userSignUpModel = UserSignUpModel();

  String? validateName(String? nameValue) {
    if (nameValue == null || nameValue.isEmpty) {
      return "Please enter name!";
    }
    if (!_userSignUpModel.validateNameFormat(nameValue)) {
      return "Please enter valid name - only characters are allowed!";
    }
    return null;
  }

  String? validateEmail(String? emailValue) {
    if (emailValue == null || emailValue.isEmpty) {
      return 'Please enter email!';
    } else if (!_userSignUpModel.validateEmailFormat(emailValue)) {
      return 'Please enter valid email!';
    }
    return null;
  }

  String? validatePhoneNumber(String? phoneNumValue) {
    if (phoneNumValue == null || phoneNumValue.isEmpty) {
      return 'Please enter phone number!';
    }
    if (_userSignUpModel.validatePhoneNumberFromat(phoneNumValue)) {
      return "Please enter valid phone number!";
    }
    return null;
  }
}

class UserController {
  static User _user = User();

  static User get user => _user;

  void setUserDetails({String? name, String? email, String? phone}) {
    user.name = name;
    user.email = email;
    user.phone = phone;
  }
}
