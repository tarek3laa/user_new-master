class Question {
  Question({
    required this.options,
    required this.parentOptions,
    required this.forOther,
    required this.hasTextInput,
    required this.hasTextInputImage,
    required this.textInputOptions,
    required this.services,
    required this.deleted,
    required this.name,
    required this.titleInsideTextInput,
    required this.parent,
    required this.createdAt,
    required this.updatedAt,
    required this.id,
  });

  List<Option> options;
  List<String> parentOptions;
  bool forOther;
  bool hasTextInput;
  bool hasTextInputImage;
  List<int> textInputOptions;
  List<int> services;
  bool deleted;
  String name;
  String titleInsideTextInput;
  int parent;
  DateTime createdAt;
  DateTime updatedAt;
  int id;

  factory Question.fromJson(Map<String, dynamic> json) => Question(
        options:
            List<Option>.from(json["options"].map((x) => Option.fromJson(x))),
        parentOptions: List<String>.from(json["parentOptions"].map((x) => x)),
        forOther: json["forOther"],
        hasTextInput: json["hasTextInput"],
        hasTextInputImage: json["hasTextInputImage"],
        textInputOptions:
            List<int>.from(json["textInputOptions"].map((x) => x)),
        services: List<int>.from(json["services"].map((x) => x)),
        deleted: json["deleted"],
        name: json["name"],
        titleInsideTextInput: json["titleInsideTextInput"],
        parent: json["parent"] == null ? null : json["parent"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        id: json["id"],
      );
}

class Option {
  Option({
    required this.name,
    required this.id,
  });

  String name;
  String id;

  factory Option.fromJson(Map<String, dynamic> json) => Option(
        name: json["name"],
        id: json["_id"],
      );
}
