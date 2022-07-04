class Privacy {
  Privacy({
    required this.target,
    required this.title,
    required this.text,
    required this.type,
    required this.id,
  });

  String target;
  String title;
  String text;
  String type;
  int id;

  factory Privacy.fromJson(Map<String, dynamic> json) => Privacy(
        target: json["target"],
        title: json["title"],
        text: json["text"],
        type: json["type"],
        id: json["id"],
      );
}
