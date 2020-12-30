import 'dart:convert';

UserModel userModelFromJson(dynamic str) =>
    UserModel.fromJson(json.decode(str));

dynamic userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  int brandID;
  String name;
  String phoneNumber;
  String email;
  String message;

  UserModel(
      {this.brandID, this.email, this.message, this.name, this.phoneNumber});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      brandID: 5,
      name: json["name"],
      phoneNumber: json["phoneNumber"],
      email: json["email"],
      message: json["message"],
    );
  }

  Map<String, dynamic> toJson() => {
        "brandID": 5,
        "name": name,
        "phoneNumber": phoneNumber,
        "email": email,
        "message": message,
      };
}
