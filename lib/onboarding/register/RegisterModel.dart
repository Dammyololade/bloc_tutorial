class RegisterModel {
  bool success;
  String message;
  RegisterData data;

  RegisterModel({
    this.success,
    this.message,
    this.data,
  });

  factory RegisterModel.fromJson(Map<String, dynamic> json) => RegisterModel(
    success: json["success"],
    message: json["message"],
    data: RegisterData.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "data": data.toJson(),
  };
}

class RegisterData {
  String id;
  DateTime createdAt;
  String name;
  String avatar;

  RegisterData({
    this.id,
    this.createdAt,
    this.name,
    this.avatar,dart
  });

  factory RegisterData.fromJson(Map<String, dynamic> json) => RegisterData(
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