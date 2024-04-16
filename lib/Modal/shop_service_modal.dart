// To parse this JSON data, do
//
//     final shopServiceModal = shopServiceModalFromJson(jsonString);

import 'dart:convert';

ShopServiceResponse shopServiceResponseFromJson(String str) =>
    ShopServiceResponse.fromJson(json.decode(str));

String shopServiceResponseToJson(ShopServiceResponse data) =>
    json.encode(data.toJson());

class ShopServiceResponse {
  bool? status;
  String? message;
  List<ShopServiceDataModel>? data;

  ShopServiceResponse({
    this.status,
    this.message,
    this.data,
  });

  factory ShopServiceResponse.fromJson(Map<String, dynamic> json) =>
      ShopServiceResponse(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<ShopServiceDataModel>.from(
                json["data"]!.map((x) => ShopServiceDataModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class ShopServiceDataModel {
  int? id;
  String? name;
  String? duration;
  String? price;
  bool? selected;

  ShopServiceDataModel({
    this.id,
    this.name,
    this.duration,
    this.price,
    this.selected,
  });

  factory ShopServiceDataModel.fromJson(Map<String, dynamic> json) =>
      ShopServiceDataModel(
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
    return 'Datum{id: $id, name: $name, duration: $duration, price: $price}';
  }
}
