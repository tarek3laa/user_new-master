import '../location.dart';
import '../services/problem_type.dart';
import 'answer.dart';

class Order {
  late List<ProblemType> problemType;
  List<Answer> answers;
  List<dynamic> images;
  bool isSpecial;
  String status;
  bool adminAssigned;
  bool canReject;
  List<dynamic> technicalsRejected;
  List<dynamic> adminRejected;
  bool noTechnicalFound;
  List<dynamic> cancelRequests;
  List<dynamic> additionalWork;
  List<dynamic> spareParts;
  bool adminInformed;
  bool companyInformed;
  bool commetionPayed;
  List<dynamic> paymentMethod;
  bool clientFinalPayed;
  bool reciedCalculated;
  int mainService;
  Location location;
  DateTime date;
  String description;
  String orderNumber;
  int user;
  int price;
  int totalPrice;
  String warrantyPaymentStatus;
  int id;
  double downPayment;

  late DateTime searchJobEndTime;
  late int technicalRate;
  late String technicalRateComment;
  late DateTime technicalRateDate;

  Order(
      {required this.answers,
      required this.images,
      required this.isSpecial,
      required this.status,
      required this.adminAssigned,
      required this.canReject,
      required this.technicalsRejected,
      required this.adminRejected,
      required this.noTechnicalFound,
      required this.cancelRequests,
      required this.additionalWork,
      required this.spareParts,
      required this.adminInformed,
      required this.companyInformed,
      required this.commetionPayed,
      required this.paymentMethod,
      required this.clientFinalPayed,
      required this.reciedCalculated,
      required this.mainService,
      required this.location,
      required this.date,
      required this.description,
      required this.orderNumber,
      required this.user,
      required this.price,
      required this.totalPrice,
      required this.warrantyPaymentStatus,
      required this.id,
      required this.downPayment});

  factory Order.fromJson(Map<String, dynamic> json) => Order(
      answers:
          List<Answer>.from(json["answers"].map((x) => Answer.fromJson(x))),
      images: List<dynamic>.from(json["images"].map((x) => x)),
      isSpecial: json["isSpecial"],
      status: json["status"],
      adminAssigned: json["adminAssigned"],
      canReject: json["canReject"],
      technicalsRejected:
          List<dynamic>.from(json["technicalsRejected"].map((x) => x)),
      adminRejected: List<dynamic>.from(json["adminRejected"].map((x) => x)),
      noTechnicalFound: json["noTechnicalFound"],
      cancelRequests: List<dynamic>.from(json["cancelRequests"].map((x) => x)),
      additionalWork: List<dynamic>.from(json["additionalWork"].map((x) => x)),
      spareParts: List<dynamic>.from(json["spareParts"].map((x) => x)),
      adminInformed: json["adminInformed"],
      companyInformed: json["companyInformed"],
      commetionPayed: json["commetionPayed"],
      paymentMethod: List<dynamic>.from(json["paymentMethod"].map((x) => x)),
      clientFinalPayed: json["clientFinalPayed"],
      reciedCalculated: json["reciedCalculated"],
      mainService: json["mainService"],
      location: Location.fromJson(json["location"]),
      date: DateTime.parse(json["date"]),
      description: json["description"],
      orderNumber: json["orderNumber"],
      user: json["user"],
      price: json["price"],
      totalPrice: json["totalPrice"],
      warrantyPaymentStatus: json["WarrantyPaymentStatus"],
      id: json["id"],
      downPayment: json['downPayment']);

  void addLateData(json) {
    searchJobEndTime = json['searchJobEndTime'];
    technicalRate = json['technicalRate'];
    technicalRateComment = json['technicalRateComment'];
    technicalRateDate = json['technicalRateDate'];
  }
}
