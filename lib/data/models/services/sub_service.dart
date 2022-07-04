import 'package:user_new/data/models/services/main_services.dart';
import 'package:user_new/data/models/services/working_time.dart';

class SubService {
  SubService({
    required this.warrantyTime,
    required this.workingTime,
    required this.deleted,
    required this.name,
    required this.description,
    required this.mainService,
    required this.icon,
    required this.createdAt,
    required this.updatedAt,
    required this.id,
  });

  int warrantyTime;
  List<WorkingTime> workingTime;
  bool deleted;
  String name;
  String description;
  MainService mainService;
  String icon;
  DateTime createdAt;
  DateTime updatedAt;
  int id;

  factory SubService.fromJson(Map<String, dynamic> json) => SubService(
        warrantyTime: json["warrantyTime"],
        workingTime: List<WorkingTime>.from(
            json["workingTime"].map((x) => WorkingTime.fromJson(x))),
        deleted: json["deleted"],
        name: json["name"],
        description: json["description"] == null ? null : json["description"],
        mainService: MainService.fromJson(json["mainService"]),
        icon: json["icon"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        id: json["id"],
      );
}
