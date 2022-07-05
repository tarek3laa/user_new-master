import 'package:dio/dio.dart';

import '../../constants/strings.dart';

class CountryWebServices {
  var headers = {'Accept-Language': 'en'};
  var dio;
  static CountryWebServices _instance = CountryWebServices._();

  CountryWebServices._() {
    dio = Dio();
  }

  factory CountryWebServices() => _instance;

  Future<List<dynamic>> getAllCountries() async {
    print('object');
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
