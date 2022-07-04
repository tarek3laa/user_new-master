class GeoLocation {
  GeoLocation({
    this.type,
    this.coordinates,
  });

  String? type;
  List<double>? coordinates;

  factory GeoLocation.fromJson(Map<String, dynamic> json) => GeoLocation(
    type: json["type"],
    coordinates: List<double>.from(json["coordinates"].map((x) => x.toDouble())),
  );

  Map<String, dynamic> toJson() => {
    "type": type,
    "coordinates": List<dynamic>.from(coordinates!.map((x) => x)),
  };
}
