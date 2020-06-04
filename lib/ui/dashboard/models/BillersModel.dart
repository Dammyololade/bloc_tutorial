import 'PackagesModel.dart';

class BillersResponse {
  int code;
  Data data;
  String message;
  bool success;

  BillersResponse({
    this.code,
    this.data,
    this.message,
    this.success,
  });

  factory BillersResponse.fromJson(Map<String, dynamic> json) => new BillersResponse(
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
  List<Biller> billers;

  Data({
    this.billers,
  });

  factory Data.fromJson(Map<String, dynamic> json) => new Data(
    billers: new List<Biller>.from(json["billers"].map((x) => Biller.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "billers": new List<dynamic>.from(billers.map((x) => x.toJson())),
  };
}

class Biller {
  int id;
  int serviceCategoryId;
  String name;
  bool activated;
  String iconUrl;
  String description;
  dynamic createdOn;
  dynamic updatedOn;
  List<ServicePackage> servicePackages;

  Biller({
    this.id,
    this.serviceCategoryId,
    this.name,
    this.activated,
    this.iconUrl,
    this.description,
    this.createdOn,
    this.updatedOn,
    this.servicePackages,
  });

  factory Biller.fromJson(Map<String, dynamic> json) => new Biller(
    id: json["id"],
    serviceCategoryId: json["service_category_id"],
    name: json["name"],
    activated: json["activated"],
    iconUrl: json["icon_url"],
    description: json["description"],
    createdOn: json["createdOn"],
    updatedOn: json["updatedOn"],
    servicePackages: json["servicePackages"] == null ? [] : new List<ServicePackage>.from(json["servicePackages"].map((x) => ServicePackage.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "service_category_id": serviceCategoryId,
    "name": name,
    "activated": activated,
    "icon_url": iconUrl,
    "description": description,
    "createdOn": createdOn,
    "updatedOn": updatedOn,
    "servicePackages": servicePackages == null ? [] : new List.from(servicePackages.map((x) => x.toJson())),
  };
}
