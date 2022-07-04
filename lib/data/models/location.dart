class Location {
  Location({
    required this.address,
    required this.longitude,
    required this.latitude,
    required this.buildingNumber,
    required this.floorNumber,
    required this.city,
    required this.region,
    required this.street,
    required this.flatNumber,
  });

  String address;
  double longitude;
  double latitude;
  int buildingNumber;
  int floorNumber;
  int city;
  String region;
  String street;
  int flatNumber;

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        address: json["address"],
        longitude: json["longitude"].toDouble(),
        latitude: json["latitude"].toDouble(),
        buildingNumber: json["buildingNumber"],
        floorNumber: json["floorNumber"],
        city: json["city"],
        region: json["region"],
        street: json["street"],
        flatNumber: json["flatNumber"],
      );

  Map<String, dynamic> toJson() => {
        "address": address,
        "longitude": longitude,
        "latitude": latitude,
        "buildingNumber": buildingNumber,
        "floorNumber": floorNumber,
        "city": city,
        "region": region,
        "street": street,
        "flatNumber": flatNumber,
      };
}
