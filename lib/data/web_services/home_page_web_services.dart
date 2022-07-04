import 'package:dio/dio.dart';
import 'package:user_new/data/models/location.dart';
import 'package:user_new/data/models/order/answer.dart';
import 'package:user_new/data/models/services/problem_type.dart';

import '../../constants/strings.dart';

class HomePageWebServices {
  var headers;
  var dio;

  HomePageWebServices(token) {
    dio = Dio();
    headers = {'Accept-Language': 'en', 'Authorization': 'Bearer $token'};
  }

  // Future<List<dynamic>>getAllSouqSliders(){
  //
  // }
  Future<List<dynamic>> getAllSliders() async {
    Response response = await dio.get(baseUrl + 'slider');
    return response.data['data'];
  }

  Future<List<dynamic>> getAllMainServices({city}) async {
    Response response = await dio.get(baseUrl + 'mainService',
        queryParameters: (city == null) ? null : {'city': city});

    return response.data['data'];
  }

  Future<List<dynamic>> getAllSubService({mainService}) async {
    var response = await dio.get(baseUrl + 'subService',
        queryParameters:
            (mainService == null) ? null : {'mainService': mainService});

    return response.data['data'];
  }

  Future<List<dynamic>> getAllProblemType({kwargs}) async {
    var response =
        await dio.get(baseUrl + 'problemType', queryParameters: kwargs);

    return response.data['data'];
  }

  Future<List<dynamic>> getAllQuestion({kwargs}) async {
    var response =
        await dio.get(baseUrl + 'questions', queryParameters: kwargs);

    return response.data['data'];
  }

  Future<dynamic> createOrder(
      List<Answer> answers,
      List<ProblemType> problemType,
      Location location,
      mainService,
      description,
      List<String> images) async {
    var data = {
      'answers': answers.map((e) => e.toJson()),
      'problemType': problemType.map((e) => e.toJson()),
      'location': location.toJson(),
      'mainService': mainService,
      'description': description,
    };
    if (images.length != 0) data.addAll({'images': images});

    var response = await dio.post(baseUrl + 'order', data = data);
    return response.data;
  }

  Future<dynamic> getProblemTypeById(id) async {
    var response = await dio.get(baseUrl + 'problemType/$id');
    return response.data;
  }

  Future<dynamic> downPayment(orderNumber, method) async {
    var data = {"paymentMethod": method};
    var response =
        await dio.put(baseUrl + 'order/$orderNumber/down-payment', data = data);
    return response.data['order'];
  }

  Future<dynamic> retry(orderNumber, date) async {
    var data = {'date': date};
    var response =
        await dio.put(baseUrl + 'order/$orderNumber/retry', data = data);
    return response.data;
  }

  Future<dynamic> exit(orderNumber) async {
    var response = await dio.put(baseUrl + 'order/$orderNumber/exit');
    return response.data;
  }

  Future<dynamic> rate(orderNumber, rate, comment) async {
    var data = {'rate': rate, 'comment': comment};
    var response =
        await dio.post(baseUrl + 'order/$orderNumber/rate', data = data);
    return response;
  }

  //TODO(6)get technical rate

  Future<List<dynamic>> getAllOrder({kwargs}) async {
    var response = await dio.get(baseUrl + 'order', queryParameters: kwargs);
    return response.data['data'];
  }

  Future<dynamic> formAnswer(
      {phone,
      email,
      firstName,
      lastName,
      formId,
      countryId,
      title,
      text}) async {
    var data = {
      'phone': phone,
      'email': email,
      'firstName': firstName,
      'lastName': lastName,
      'form': formId,
      'country': countryId,
      'title': title,
      'text': text
    };
    Response response = await dio.post(baseUrl + 'forms-answer', data = data);
    return response;
  }

  Future<dynamic> getPrivacy({kwargs}) async {
    Response response =
        await dio.get(baseUrl + 'privacy', queryParameters: kwargs);
    return response.data['data'];
  }

  Future<dynamic> uploadImage(path) async {
    var formData =
        FormData.fromMap({'image': await MultipartFile.fromFile(path)});
    Response response =
        await dio.post(baseUrl + 'admin/uploadImage', data: formData);
    return response.data;
  }
}
