import 'package:dio/dio.dart';
import 'package:user_new/data/models/privacy.dart';
import 'package:user_new/data/models/services/main_services.dart';
import 'package:user_new/data/models/services/problem_type.dart';
import 'package:user_new/data/models/services/question.dart';
import 'package:user_new/data/models/services/sub_service.dart';
import 'package:user_new/data/web_services/home_page_web_services.dart';

import '../data_utils.dart';
import '../models/location.dart';
import '../models/order/answer.dart';
import '../models/order/order.dart';
import '../models/slider.dart';

class HomePageRepository {
  final HomePageWebServices homePageWebServices;

  HomePageRepository(this.homePageWebServices);

  Future<List<Slider>> getAllSliders() async {
    var data = await homePageWebServices.getAllSliders();
    return data.map((e) => Slider.fromJson(e)).toList();
  }

  Future<List<MainService>> getAllMainServices({city}) async {
    var data = await homePageWebServices.getAllMainServices(city: city);
    return data.map((e) => MainService.fromJson(e)).toList();
  }

  Future<List<SubService>> getAllSubServices({mainService}) async {
    var data =
        await homePageWebServices.getAllSubService(mainService: mainService);
    return data.map((e) => SubService.fromJson(e)).toList();
  }

  Future<List<ProblemType>> getAllProblemType({kwargs}) async {
    var data = await homePageWebServices.getAllProblemType(kwargs: kwargs);
    return data.map((e) => ProblemType.fromJson(e)).toList();
  }

  Future<List<Question>> getAllQuestion({kwargs}) async {
    var data = await homePageWebServices.getAllQuestion(kwargs: kwargs);
    return data.map((e) => Question.fromJson(e)).toList();
  }

  Future<Order> createOrder(List<Answer> answers, List<ProblemType> problemType,
      Location location, mainService, description, images) async {
    var data = await homePageWebServices.createOrder(
        answers, problemType, location, mainService, description, images);

    Order order = Order.fromJson(data);
    order.problemType = await getProblemTypes(data['problemType'], this);
    return order;
  }

  Future<ProblemType> getProblemTypeById(id) async {
    var json = await homePageWebServices.getProblemTypeById(id);
    return ProblemType.fromJson(json);
  }

  Future<Order> downPayment(orderNumber, method) async {
    var json = await homePageWebServices.downPayment(orderNumber, method);
    Order order = Order.fromJson(json);
    order.problemType = await getProblemTypes(json['problemType'], this);
    return order;
  }

//TODO(2) retry request
//TODO(3) exit request

  Future<List<Order>> getAllOrder({kwargs}) async {
    var data = await homePageWebServices.getAllOrder(kwargs: kwargs);
    List<Order> orders = [];
    data.forEach((element) async {
      Order order = Order.fromJson(element);
      order.problemType = await getProblemTypes(element['problemType'], this);
      orders.add(order);
    });
    return orders;
  }

  Future<bool> formAnswer(
      {phone,
      email,
      firstName,
      lastName,
      formId,
      countryId,
      title,
      text}) async {
    Response response = await homePageWebServices.formAnswer(
        phone: phone,
        email: email,
        firstName: firstName,
        lastName: lastName,
        formId: formId,
        countryId: countryId,
        title: title,
        text: text);

    return response.statusCode == 200;
  }

  Future<Order> rate(orderNumber, rate, comment) async {
    Response response =
        await homePageWebServices.rate(orderNumber, rate, comment);
    Order order = Order.fromJson(response.data['order']);
    order.addLateData(response.data['order']);
    return order;
  }

  Future<Privacy> getPrivacy({kwargs}) async {
    var json = await homePageWebServices.getPrivacy(kwargs: kwargs);
    return Privacy.fromJson(json);
  }

  Future<String> uploadImage(path) async {
    var json = await homePageWebServices.uploadImage(path);
    return json['link'];
  }
}
