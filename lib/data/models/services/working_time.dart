class WorkingTime {
  WorkingTime({
    required this.id,
    required this.day,
    required this.from,
    required this.to,
    required this.active,
    required this.technicalArriveTime,
  });

  String id;
  int day;
  int from;
  int to;
  bool active;
  int technicalArriveTime;

  factory WorkingTime.fromJson(Map<String, dynamic> json) => WorkingTime(
        id: json["_id"],
        day: json["day"],
        from: json["from"],
        to: json["to"],
        active: json["active"],
        technicalArriveTime: json["technicalArriveTime"],
      );
}
