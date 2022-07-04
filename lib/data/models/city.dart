import 'country.dart';

class City {
  City({
    required this.name,
    required this.country,
    required this.createdAt,
    required this.updatedAt,
    required this.id,
  });


  String name;
  Country country;
  DateTime createdAt;
  DateTime updatedAt;
  int id;

  factory City.fromJson(Map<String, dynamic> json) => City(
    name: json["name"],
    country: Country.fromJson(json["country"]),
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    id: json["id"],
  );
}