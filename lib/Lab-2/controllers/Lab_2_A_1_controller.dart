import 'package:advance_flutter_lab/Lab-2/models/Lab_2_A_1_model.dart';

class UserFavUnFavController{

  UserFavUnFavModel _model = UserFavUnFavModel();
  List<Map<String,dynamic>> get users => _model.users;

  void makeUserFavUnFav(String name,bool isUserFav){
    _model.makeUserFav(name, isUserFav);
  }
}