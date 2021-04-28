// To parse this JSON data, do
//
//     final data = dataFromJson(jsonString);

import 'dart:convert';

List<Data> dataFromJson(String str) =>
    List<Data>.from(json.decode(str).map((x) => Data.fromJson(x)));

String dataToJson(List<Data> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Data {
  Data({
    this.firstName,
    this.lastName,
    this.skill,
    this.experience,
  });

  String firstName;
  String lastName;
  String skill;
  String experience;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        firstName: json["first_name"],
        lastName: json["last_name"],
        skill: json["skill"],
        experience: json["experience"],
      );

  Map<String, dynamic> toJson() => {
        "first_name": firstName,
        "last_name": lastName,
        "skill": skill,
        "experience": experience,
      };
}
