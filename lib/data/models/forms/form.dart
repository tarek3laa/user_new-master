class Form {
  Form({
    required this.name,
    required this.createdAt,
    required this.updatedAt,
    required this.id,
  });

  String name;
  DateTime createdAt;
  DateTime updatedAt;
  int id;

  factory Form.fromJson(Map<String, dynamic> json) => Form(
    name: json["name"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "id": id,
  };
}