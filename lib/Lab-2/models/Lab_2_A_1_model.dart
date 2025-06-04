class UserFavUnFavModel{

  List<Map<String,dynamic>> get users => _users;

  List<Map<String,dynamic>> _users = [
    {"name" : "Dhruv","isFav" : true},
    {"name" : "Meet","isFav" : false},
    {"name" : "Mann","isFav" : true},
    {"name" : "Vandan","isFav" : false}
  ];

  void makeUserFav(String name,bool isUserFav){
    int indexOfUser = _users.indexWhere((element) => element["name"] == name,);
    _users[indexOfUser]["isFav"] = isUserFav;
  }
}