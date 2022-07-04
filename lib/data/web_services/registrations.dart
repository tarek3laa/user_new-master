import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

import '../../constants/strings.dart';
import '../models/user.dart';

class RegistrationOperations {
  var headers = {'Accept-Language': 'en'};
  var dio;

  RegistrationOperations() {
    dio = Dio();
  }

  Future<Map<String, dynamic>> signUp(User user) async {
    var formData = FormData.fromMap(user.signUpJson());
    Response<dynamic> response =
        await dio.post(baseUrl + 'signup', data: formData);
    return response.data;
  }

  Future<Map<String, dynamic>> signIn(User user) async {
    var data = user.signInJson();
    Response<dynamic> response = await dio.post(baseUrl + 'signin', data);
    return response.data;
  }

  Future<int?> sendCodeToUserPhone(String phone, countryKey) async {
    var data = {'phone': phone, 'country': countryKey};
    Response<dynamic> response =
        await dio.post(baseUrl + 'verifyPhone', data: data);
    return response.statusCode;
  }

  Future<int?> confirmCode(phone, countryKey, code) async {
    var data = {'phone': phone, 'country': countryKey, 'code': code};
    Response<dynamic> response =
        await dio.put(baseUrl + 'confirmPhoneCode', data);
    return response.statusCode;
  }
}
