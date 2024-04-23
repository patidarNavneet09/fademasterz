// To parse this JSON data, do
//
//     final bookingSummaryArgument = bookingSummaryArgumentFromJson(jsonString);

import 'dart:convert';

BookingSummaryArgument bookingSummaryArgumentFromJson(String str) =>
    BookingSummaryArgument.fromJson(json.decode(str));

String bookingSummaryArgumentToJson(BookingSummaryArgument data) =>
    json.encode(data.toJson());

class BookingSummaryArgument {
  String? price;
  String? shopId;
  String? specialistId;
  String? serviceId;
  String? notetext;
  String? image;
  String? date;
  String? time;

  BookingSummaryArgument({
    this.price,
    this.shopId,
    this.specialistId,
    this.serviceId,
    this.notetext,
    this.image,
    this.date,
    this.time,
  });

  factory BookingSummaryArgument.fromJson(Map<String, dynamic> json) =>
      BookingSummaryArgument(
        price: json["price"],
        shopId: json["shopId"],
        specialistId: json["specialistId"],
        serviceId: json["serviceId"],
        notetext: json["notetext"],
        image: json["image"],
        date: json["date"],
        time: json["time"],
      );

  Map<String, dynamic> toJson() => {
        "price": price,
        "shopId": shopId,
        "specialistId": specialistId,
        "serviceId": serviceId,
        "notetext": notetext,
        "image": image,
        "date": date,
        "time": time,
      };

  @override
  String toString() {
    return 'BookingSummaryArgument{price: $price, shopId: $shopId, specialistId: $specialistId, serviceId: $serviceId, notetext: $notetext, image: $image, date: $date, time: $time}';
  }
}
