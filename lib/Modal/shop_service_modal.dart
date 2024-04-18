// To parse this JSON data, do
//
//     final shopServiceResponse = shopServiceResponseFromJson(jsonString);

import 'dart:convert';

ShopServiceResponse shopServiceResponseFromJson(String str) =>
    ShopServiceResponse.fromJson(json.decode(str));

String shopServiceResponseToJson(ShopServiceResponse data) =>
    json.encode(data.toJson());

class ShopServiceResponse {
  bool? status;
  String? message;
  ServiceData? data;

  ShopServiceResponse({
    this.status,
    this.message,
    this.data,
  });

  factory ShopServiceResponse.fromJson(Map<String, dynamic> json) =>
      ShopServiceResponse(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null ? null : ServiceData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data?.toJson(),
      };

  @override
  String toString() {
    return 'ShopServiceResponse{status: $status, message: $message, data: $data}';
  }
}

class ServiceData {
  List<Service>? services;
  int? totalPages;

  ServiceData({
    this.services,
    this.totalPages,
  });

  factory ServiceData.fromJson(Map<String, dynamic> json) => ServiceData(
        services: json["services"] == null
            ? []
            : List<Service>.from(
                json["services"]!.map((x) => Service.fromJson(x))),
        totalPages: json["total_pages"],
      );

  Map<String, dynamic> toJson() => {
        "services": services == null
            ? []
            : List<dynamic>.from(services!.map((x) => x.toJson())),
        "total_pages": totalPages,
      };
}

class Service {
  int? id;
  String? name;
  String? duration;
  String? price;
  bool? selected;

  Service({this.id, this.name, this.duration, this.price, this.selected});

  factory Service.fromJson(Map<String, dynamic> json) => Service(
        id: json["id"],
        name: json["name"],
        duration: json["duration"],
        price: json["price"],
        selected: json["selected"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "duration": duration,
        "price": price,
        "selected": selected,
      };

  @override
  String toString() {
    return 'Service{id: $id, name: $name, duration: $duration, price: $price, selected: $selected}';
  }
}
