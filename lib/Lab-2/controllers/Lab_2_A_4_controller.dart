import 'package:advance_flutter_lab/Lab-2/models/Lab_2_A_4_model.dart';

class ProfileCardController {
  ProfileCardModel _profileCardModel = ProfileCardModel();

  String? validateName(String? nameValue) {
    if (nameValue == null || nameValue.isEmpty) {
      return "Please enter name!";
    }
    if (!_profileCardModel.validateNameFormat(nameValue)) {
      return "Please enter valid name - only characters are allowed!";
    }
    return null;
  }

  String? validateEmail(String? emailValue) {
    if (emailValue == null || emailValue.isEmpty) {
      return 'Please enter email!';
    } else if (!_profileCardModel.validateEmailFormat(emailValue)) {
      return 'Please enter valid email!';
    }
    return null;
  }

  String? validatePhoneNumber(String? phoneNumValue) {
    if (phoneNumValue == null || phoneNumValue.isEmpty) {
      return 'Please enter phone number!';
    }
    if (_profileCardModel.validatePhoneNumberFromat(phoneNumValue)) {
      return "Please enter valid phone number!";
    }
    return null;
  }

  String? validateLocation(String? locationValue) {
    if (locationValue == null || locationValue.isEmpty) {
      return 'Please enter location!';
    }
    return null;
  }
}

class UserController {
  static User _user = User();

  static User get user => _user;

  void setUserDetails({
    String? name,
    String? email,
    String? phone,
    String? location,
  }) {
    user.name = name;
    user.email = email;
    user.phone = phone;
    user.location = location;
  }
}
