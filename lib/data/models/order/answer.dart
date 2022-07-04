class Answer {
  int question;
  Name name;
  String answer;
  Name selectedOption;
  String selectedOptionId;
  List<dynamic> images;

  Answer({
    required this.question,
    required this.name,
    required this.answer,
    required this.selectedOption,
    required this.selectedOptionId,
    required this.images,
  });

  factory Answer.fromJson(Map<String, dynamic> json) => Answer(
        question: json["question"],
        name: Name.fromJson(json["name"]),
        answer: json["answer"],
        selectedOption: Name.fromJson(json["selectedOption"]),
        selectedOptionId: json["selectedOptionId"],
        images: List<dynamic>.from(json["images"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "question": question,
        "name": name.toJson(),
        "answer": answer,
        "selectedOption": selectedOption,
        "selectedOptionId": selectedOptionId,
        "images": List<dynamic>.from(images.map((x) => x)),
      };
}

class Name {
  Name({
    required this.en,
    required this.ar,
  });

  String en;
  String ar;

  factory Name.fromJson(Map<String, dynamic> json) => Name(
        en: json["en"],
        ar: json["ar"],
      );

  Map<String, dynamic> toJson() => {
        "en": en,
        "ar": ar,
      };
}
