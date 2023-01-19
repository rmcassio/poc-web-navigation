import 'dart:core';

class PersonModel {
  final String name;
  final String number;
  final String city;

  PersonModel({
    required this.name,
    required this.number,
    required this.city,
  });

  factory PersonModel.fromJson({required Map<dynamic, dynamic> json}) {
    return PersonModel(
      name: json['name'],
      number: json['number'],
      city: json['city'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'number': number,
      'city': city,
    };
  }
}
