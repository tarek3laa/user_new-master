

import '../services/working_time.dart';

class MainService {
  int warrantyTime;
  List<WorkingTime> workingTime;
  bool deleted;
  String name;
  String icon;
  DateTime createdAt;
  DateTime updatedAt;
  int id;
  String description;
  int searchTime;
  int startSearchDistance;
  int endSearchDistance;
  int increaseSearchDistanceBy;
  int waitingTime;
  int adminWaitingTime;

  MainService({
    required this.warrantyTime,
    required this.workingTime,
    required this.deleted,
    required this.name,
    required this.icon,
    required this.createdAt,
    required this.updatedAt,
    required this.id,
    required this.description,
    required this.searchTime,
    required this.startSearchDistance,
    required this.endSearchDistance,
    required this.increaseSearchDistanceBy,
    required this.waitingTime,
    required this.adminWaitingTime,
  });

  factory MainService.fromJson(Map<String, dynamic> json) => MainService(
        warrantyTime: json["warrantyTime"],
        workingTime: List<WorkingTime>.from(
            json["workingTime"].map((x) => WorkingTime.fromJson(x))),
        deleted: json["deleted"],
        name: json["name"],
        icon: json["icon"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        id: json["id"],
        description: json["description"] == null ? null : json["description"],
        searchTime: json["searchTime"] == null ? null : json["searchTime"],
        startSearchDistance: json["startSearchDistance"] == null
            ? null
            : json["startSearchDistance"],
        endSearchDistance: json["endSearchDistance"] == null
            ? null
            : json["endSearchDistance"],
        increaseSearchDistanceBy: json["increaseSearchDistanceBy"] == null
            ? null
            : json["increaseSearchDistanceBy"],
        waitingTime: json["waitingTime"] == null ? null : json["waitingTime"],
        adminWaitingTime:
            json["adminWaitingTime"] == null ? null : json["adminWaitingTime"],
      );
}
