

import 'ResponseModel.dart';

class PackagesResponse extends ResponseModel{
  int code;
  _Data data;
  String message;
  bool success;

  PackagesResponse({
    this.code,
    this.data,
    this.message,
    this.success,
  });

  factory PackagesResponse.fromJson(Map<String, dynamic> json) => new PackagesResponse(
    code: json["code"],
    data: _Data.fromJson(json["data"]),
    message: json["message"],
    success: json["success"],
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "data": data.toJson(),
    "message": message,
    "success": success,
  };
}

class _Data {
  List<ServicePackage> servicePackages;

  _Data({
    this.servicePackages,
  });

  factory _Data.fromJson(Map<String, dynamic> json) => new _Data(
    servicePackages: new List<ServicePackage>.from(json["service_packages"].map((x) => ServicePackage.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "service_packages": new List<dynamic>.from(servicePackages.map((x) => x.toJson())),
  };
}

class ServicePackage {
  int id;
  int billerId;
  String name;
  int amount;
  bool activated;
  String description;
  DateTime createdOn;
  String iconUrl;
  DateTime updatedOn;

  ServicePackage({
    this.id,
    this.billerId,
    this.name,
    this.amount,
    this.activated,
    this.description,
    this.createdOn,
    this.iconUrl,
    this.updatedOn,
  });

  factory ServicePackage.fromJson(Map<String, dynamic> json) => new ServicePackage(
    id: json["id"],
    billerId: json["biller_id"],
    name: json["name"],
    amount: json["amount"],
    activated: json["activated"],
    description: json["description"],
    createdOn: DateTime.parse(json["createdOn"]),
    iconUrl: json["icon_url"],
    updatedOn: DateTime.parse(json["updatedOn"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "biller_id": billerId,
    "name": name,
    "amount": amount,
    "activated": activated,
    "description": description,
    "createdOn": createdOn.toIso8601String(),
    "icon_url": iconUrl,
    "updatedOn": updatedOn.toIso8601String(),
  };
}
