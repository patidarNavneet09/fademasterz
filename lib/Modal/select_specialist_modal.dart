// To parse this JSON data, do
//
//     final selectSpecialistResponse = selectSpecialistResponseFromJson(jsonString);

import 'dart:convert';

SelectSpecialistResponse selectSpecialistResponseFromJson(String str) =>
    SelectSpecialistResponse.fromJson(json.decode(str));

String selectSpecialistResponseToJson(SelectSpecialistResponse data) =>
    json.encode(data.toJson());

class SelectSpecialistResponse {
  bool? status;
  String? message;
  List<SpecialistTimeData>? data;

  SelectSpecialistResponse({
    this.status,
    this.message,
    this.data,
  });

  factory SelectSpecialistResponse.fromJson(Map<String, dynamic> json) =>
      SelectSpecialistResponse(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<SpecialistTimeData>.from(
                json["data"]!.map((x) => SpecialistTimeData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class SpecialistTimeData {
  int? id;
  String? time;

  SpecialistTimeData({
    this.id,
    this.time,
  });

  factory SpecialistTimeData.fromJson(Map<String, dynamic> json) =>
      SpecialistTimeData(
        id: json["id"],
        time: json["time"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "time": time,
      };

  @override
  String toString() {
    return 'SpecialistTimeData{id: $id, time: $time}';
  }
}
