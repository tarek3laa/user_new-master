import 'package:user_new/data/models/country.dart';
import 'package:user_new/data/web_services/country_web_services.dart';

import '../../constants/strings.dart';
import '../models/city.dart';

class CountryRepository {
  late final CountryWebServices _countryWebServices;

  CountryRepository._() {
    _countryWebServices = CountryWebServices();
  }

  static CountryRepository _instance = CountryRepository._();

  factory CountryRepository() => _instance;

  Future<List<Country>> getAllCountries() async {
    final countriesData = await _countryWebServices.getAllCountries();
    return countriesData.map((country) => Country.fromJson(country)).toList();
  }

  Future<List<City>> getAllCities() async {
    final countriesData = await _countryWebServices.getAllCities();
    return countriesData.map((city) => City.fromJson(city)).toList();
  }
}
