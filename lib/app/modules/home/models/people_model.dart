import '_export_model.dart';

class PeopleModel {
  int? id;
  String? name;
  String? birthYear;
  String? eyeColor;
  String? gender;
  String? hairColor;
  String? height;
  String? mass;
  String? skinColor;
  String? url;

  PeopleModel({
    this.id,
    this.name,
    this.birthYear,
    this.eyeColor,
    this.gender,
    this.hairColor,
    this.height,
    this.mass,
    this.skinColor,
    this.url,
  });

  factory PeopleModel.fromMap(Map<String, dynamic> map) => PeopleModel(
        id: map['id'],
        name: map['name'],
        birthYear: map['birth_year'],
        eyeColor: map['eye_color'],
        gender: map['gender'],
        hairColor: map['hair_color'],
        height: map['height'],
        mass: map['mass'],
        skinColor: map['skin_color'],
        url: map['url'],
      );
}
