class MyUser {
  int? id;
  String name;
  MyUser({this.id, required this.name});

  static MyUser fromMap(Map<String, dynamic> user) {
    return MyUser(id: user["id"], name: user["name"]);
  }

  static Map<String, dynamic> toMap(MyUser user) {
    return {"name": user.name};
  }
}
