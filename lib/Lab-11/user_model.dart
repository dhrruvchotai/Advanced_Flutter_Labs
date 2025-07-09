class UserModel {
  String id;
  String name;
  String city;

  UserModel({required this.id, required this.name, required this.city});

  static UserModel fromMap(Map<String, dynamic> user) {
    return UserModel(id: user["id"], name: user["name"], city: user["city"]);
  }

  static Map<String, dynamic> toMap(UserModel user) {
    return {"id": user.id, "name": user.name, "city": user.city};
  }
}
