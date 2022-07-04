import 'package:dio/dio.dart';

import '../../constants/strings.dart';

class CountryWebServices {
  var headers = {'Accept-Language': 'en'};
  var dio;

  CountryWebServices() {
    dio = Dio();
  }

  Future<List<dynamic>> getAllCountries() async {
    Response response = await dio.get(baseUrl + 'country');
    return response.data['data'];
  }
  Future<List<dynamic>> getAllCities() async {
    Response response = await dio.get(baseUrl + 'city');
    return response.data['data'];
  }
  Future<List<dynamic>> getAllRegions() async {
    Response response = await dio.get(baseUrl + 'region');
    return response.data['data'];
  }
}
