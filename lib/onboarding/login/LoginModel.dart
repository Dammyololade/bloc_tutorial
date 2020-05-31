/// description: 
/// project: flutter_bloc_tutorial
/// @package: onboarding.login
/// @author: dammyololade
/// created on: 30/05/2020

class LoginModel {
  bool success;
  String message;
  LoginData data;

  LoginModel({
    this.success,
    this.message,
    this.data,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
    success: json["success"],
    message: json["message"],
    data: LoginData.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "data": data.toJson(),
  };
}

class LoginData {
  String id;
  DateTime createdAt;
  String name;
  String avatar;

  LoginData({
    this.id,
    this.createdAt,
    this.name,
    this.avatar,
  });

  factory LoginData.fromJson(Map<String, dynamic> json) => LoginData(
    id: json["id"],
    createdAt: DateTime.parse(json["createdAt"]),
    name: json["name"],
    avatar: json["avatar"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "createdAt": createdAt.toIso8601String(),
    "name": name,
    "avatar": avatar,
  };
}
