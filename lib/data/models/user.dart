import 'country.dart';
import 'geolocation.dart';

class User {
  User(
      {this.geoLocation,
      this.deleted,
      this.tokens,
      this.activated,
      this.rules,
      this.image,
      this.language,
      this.notification,
      this.socialMediaType,
      this.credit,
      this.verify,
      this.rate,
      this.numberOfRatedUsers,
      this.fixoEarnings,
      this.mainService,
      this.userState,
      this.appRateDate,
      required this.type,
      required this.username,
      required this.email,
      required this.phone,
      required this.country,
      this.shareCode,
      this.createdAt,
      this.updatedAt,
      this.id,
      this.password});

  GeoLocation? geoLocation;
  bool? deleted;
  List<dynamic>? tokens;
  bool? activated;
  List<dynamic>? rules;
  String? image;
  String? language;
  bool? notification;
  String? socialMediaType;
  int? credit;
  bool? verify;
  int? rate;
  int? numberOfRatedUsers;
  int? fixoEarnings;
  List<dynamic>? mainService;
  String? userState;
  DateTime? appRateDate;
  String type;
  String username;
  String email;
  String phone;
  Country country;
  String? shareCode;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? id;
  String? password;

  factory User.fromJson(Map<String, dynamic> json) => User(
      geoLocation: GeoLocation.fromJson(json["geoLocation"]),
      deleted: json["deleted"],
      tokens: List<dynamic>.from(json["tokens"].map((x) => x)),
      activated: json["activated"],
      rules: List<dynamic>.from(json["rules"].map((x) => x)),
      image: json["image"],
      language: json["language"],
      notification: json["notification"],
      socialMediaType: json["socialMediaType"],
      credit: json["credit"],
      verify: json["verify"],
      rate: json["rate"],
      numberOfRatedUsers: json["numberOfRatedUsers"],
      fixoEarnings: json["fixoEarnings"],
      mainService: List<dynamic>.from(json["mainService"].map((x) => x)),
      userState: json["userState"],
      appRateDate: DateTime.parse(json["appRateDate"]),
      type: json["type"],
      username: json["username"],
      email: json["email"],
      phone: json["phone"],
      country: Country.fromJson(json["country"]),
      shareCode: json["shareCode"],
      createdAt: DateTime.parse(json["createdAt"]),
      updatedAt: DateTime.parse(json["updatedAt"]),
      id: json["id"],
      password: '');

  Map<String, dynamic> toJson() => {
        "geoLocation": geoLocation!.toJson(),
        "deleted": deleted,
        "tokens": List<dynamic>.from(tokens!.map((x) => x)),
        "activated": activated,
        "rules": List<dynamic>.from(rules!.map((x) => x)),
        "image": image,
        "language": language,
        "notification": notification,
        "socialMediaType": socialMediaType,
        "credit": credit,
        "verify": verify,
        "rate": rate,
        "numberOfRatedUsers": numberOfRatedUsers,
        "fixoEarnings": fixoEarnings,
        "mainService": List<dynamic>.from(mainService!.map((x) => x)),
        "userState": userState,
        "appRateDate": appRateDate!.toIso8601String(),
        "type": type,
        "username": username,
        "email": email,
        "phone": phone,
        "country": country.toJson(),
        "shareCode": shareCode,
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
        "id": id,
      };

  Map<String, String> signUpJson() => {
        "username": username,
        "email": email,
        "phone": phone,
        "password": password!,
        "country": country.countryKey,
        "type": type
      };

  Map<String, String> signInJson() => {
        "phone": phone,
        "password": password!,
        "type": type,
        "country": country.countryKey,
      };
}
