import 'package:dio/dio.dart';

import '../../constants/strings.dart';
import '../models/user.dart';

class RegistrationOperations {
  var headers = {'Accept-Language': 'en'};
  late Dio dio;
  static final RegistrationOperations _instance = RegistrationOperations._();

  RegistrationOperations._() {
    dio = Dio();
  }

  factory RegistrationOperations() => _instance;

  Future<Response<dynamic>> signUp(User user) async {
    var formData = FormData.fromMap(user.signUpJson());
    Response<dynamic> response;
    try {
      response = await dio.post(baseUrl + 'signup', data: formData);
    } on DioError catch (e) {
      response = e.response!;
    }

    return response;
  }

  Future<Response<dynamic>> signIn(User user) async {
    var data = user.signInJson();

    Response<dynamic> response;
    try {
      response = await dio.post(baseUrl + 'signin', data: data);
    } on DioError catch (e) {
      response = e.response!;
    }
    return response;
  }

  Future<int?> sendCodeToUserPhone(String phone, countryKey) async {
    var data = {'phone': phone, 'country': countryKey};
    Response<dynamic> response;
    try {
      response = await dio.post(baseUrl + 'verifyPhone', data: data);
    } on DioError catch (e) {
      response = e.response!;
      print(response.statusCode);
      print(response.data);
    }
    return response.statusCode;
  }

  Future<int?> confirmCode(phone, countryKey, code) async {
    var data = {'phone': phone, 'country': countryKey, 'code': code};
    Response<dynamic> response =
        await dio.put(baseUrl + 'confirmPhoneCode', data: data);
    return response.statusCode;
  }

  Future<int?> sendCodeToUserEmail(String email) async {
    var data = {'email': email, 'type': 'CLIENT'};
    Response<dynamic> response =
        await dio.post(baseUrl + 'forgetPassword', data: data);
    return response.statusCode;
  }

  Future<int?> confirmEmailCode(email, code) async {
    var data = {'email': email, 'code': code, 'type': 'CLIENT'};
    Response<dynamic> response =
        await dio.put(baseUrl + 'confirmationCode', data: data);
    return response.statusCode;
  }

  Future<dynamic> changePassword(email, newPassword) async {
    var data = {'email': email, 'newPassword': newPassword, 'type': 'CLIENT'};
    Response<dynamic> response =
        await dio.put(baseUrl + 'confirmationchange', data: data);

    return response;
  }
}
