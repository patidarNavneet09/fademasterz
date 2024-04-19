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
  int? specialistId;
  String? notetext;
  String? image;
  String? date;
  String? time;

  BookingSummaryArgument({
    this.price,
    this.specialistId,
    this.notetext,
    this.image,
    this.date,
    this.time,
  });

  factory BookingSummaryArgument.fromJson(Map<String, dynamic> json) =>
      BookingSummaryArgument(
        price: json["price"],
        specialistId: json["specialistId"],
        notetext: json["notetext"],
        image: json["image"],
        date: json["date"],
        time: json["time"],
      );

  Map<String, dynamic> toJson() => {
        "price": price,
        "specialistId": specialistId,
        "notetext": notetext,
        "image": image,
        "date": date,
        "time": time,
      };

  @override
  String toString() {
    return 'BookingSummaryArgument{price: $price, specialistId: $specialistId, notetext: $notetext, image: $image, date: $date, time: $time}';
  }
}
