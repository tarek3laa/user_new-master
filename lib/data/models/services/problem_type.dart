import 'package:user_new/data/models/services/main_services.dart';
import 'package:user_new/data/models/services/sub_service.dart';

class ProblemType {
  ProblemType({
    required this.warrantyTime,
    required this.workingTime,
    required this.name,
    required this.hasWarranty,
    required this.subService,
    required this.id,
    required this.mainService,
  });

  // use it when trying to post an order
  ProblemType.problemType(
      {required this.id, required this.quantity, required this.isOther});

  late int warrantyTime;
  late List<dynamic> workingTime;
  late String name;
  late bool hasWarranty;
  late SubService subService;
  late int id;
  late MainService mainService;
  int quantity = 0;
  bool isOther = false;
  int price = 0;
  int offer = 0;
  int priceAfterOffer = 0;

  factory ProblemType.fromJson(Map<String, dynamic> json) => ProblemType(
        warrantyTime: json["warrantyTime"],
        workingTime: List<dynamic>.from(json["workingTime"].map((x) => x)),
        name: json["name"],
        hasWarranty: json["hasWarranty"] == null ? null : json["hasWarranty"],
        subService: SubService.fromJson(json["subService"]),
        id: json["id"],
        mainService: MainService.fromJson(json["mainService"]),
      );

  Map<String, dynamic> toJson() {
    return {'problemType': id, 'isOther': isOther, 'quantity': quantity};
  }

  void addLateFeature(Map<String, dynamic> json) {
    this.quantity = json['quantity'];
    this.price = json['price'];
    this.offer = json['offer'];
    this.priceAfterOffer = json['priceAfterOffer'];
    this.isOther = json['isOther'];
  }
}
