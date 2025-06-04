class UserSignUpModel{

  bool validateNameFormat(String nameValue){
    if(!RegExp(r'^[a-z,A-z]+$').hasMatch(nameValue)){
      return false;
    }
    return true;
  }

  bool validateEmailFormat(String emailValue){
    if(!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(emailValue)){
      return false;
    }
    return true;
  }

}