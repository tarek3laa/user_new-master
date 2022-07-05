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
    Response<dynamic> response =
        await dio.post(baseUrl + 'verifyPhone', data: data);
    return response.statusCode;
  }

  Future<int?> confirmCode(phone, countryKey, code) async {
    var data = {'phone': phone, 'country': countryKey, 'code': code};
    Response<dynamic> response =
        await dio.put(baseUrl + 'confirmPhoneCode', data: data);
    return response.statusCode;
  }
}
