class Country {
  Country(
      {required this.countryCode,
      required this.countryKey,
      required this.name,
      required this.currency,
      required this.id,
      required this.logo});

  String countryCode;
  String countryKey;
  String name;
  String currency;
  int id;
  String logo;

  factory Country.fromJson(Map<String, dynamic> json) => Country(
      countryCode: json["countryCode"],
      countryKey: json["countryKey"],
      name: json["name"],
      currency: json["currency"],
      id: json["id"],
      logo: (json['logo'] != null) ? json['logo'] : '');

  Map<String, dynamic> toJson() => {
        "countryCode": countryCode,
        "countryKey": countryKey,
        "name": name,
        "currency": currency,
        "id": id,
      };
}

class Pair {
  Pair({
    required this.ar,
    required this.en,
  });

  String ar;
  String en;

  factory Pair.fromJson(Map<String, dynamic> json) => Pair(
        ar: json["ar"],
        en: json["en"],
      );

  Map<String, dynamic> toJson() => {
        "ar": ar,
        "en": en,
      };
}
