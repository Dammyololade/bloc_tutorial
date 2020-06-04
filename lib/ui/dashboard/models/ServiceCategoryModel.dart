import 'BillersModel.dart';

class ServiceCategoryResponse {
  int code;
  Data data;
  String message;
  bool success;

  ServiceCategoryResponse({
    this.code,
    this.data,
    this.message,
    this.success,
  });

  factory ServiceCategoryResponse.fromJson(Map<String, dynamic> json) => new ServiceCategoryResponse(
    code: json["code"],
    data: Data.fromJson(json["data"]),
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

class Data {
  List<ServiceCategory> serviceCategories;

  Data({
    this.serviceCategories,
  });

  factory Data.fromJson(Map<String, dynamic> json) => new Data(
    serviceCategories: new List<ServiceCategory>.from(json["service_categories"].map((x) => ServiceCategory.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "service_categories": new List<dynamic>.from(serviceCategories.map((x) => x.toJson())),
  };
}

class ServiceCategory {
  int id;
  String name;
  bool activated;
  String description;
  String iconUrl;
  String serviceUrl;
  DateTime createdOn;
  DateTime updatedOn;
  List<Biller> billers;

  ServiceCategory({
    this.id,
    this.name,
    this.activated,
    this.description,
    this.iconUrl,
    this.serviceUrl,
    this.createdOn,
    this.updatedOn,
    this.billers
  });

  factory ServiceCategory.fromJson(Map<String, dynamic> json) => new ServiceCategory(
    id: json["id"],
    name: json["name"],
    activated: json["activated"],
    description: json["description"],
    iconUrl: json["icon_url"],
    serviceUrl: json["service_url"],
    createdOn: DateTime.parse(json["createdOn"]),
    updatedOn: DateTime.parse(json["updatedOn"]),
    billers: json["billers"] == null ? [] : List<Biller>.from(json["billers"].map((x) => Biller.fromJson(x))),

  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "activated": activated,
    "description": description,
    "icon_url": iconUrl,
    "service_url": serviceUrl,
    "createdOn": createdOn.toIso8601String(),
    "updatedOn": updatedOn.toIso8601String(),
    "billers": billers == null ? [] : new List.from(billers.map((x) => x.toJson())),
  };
}
