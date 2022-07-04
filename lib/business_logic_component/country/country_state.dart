part of 'country_cubit.dart';

@immutable
abstract class CountryState {}

class CountryInitial extends CountryState {}

class CountryLoaded extends CountryState {
  final List<Country> countries;

  CountryLoaded(this.countries);
}

class CityLoaded extends CountryState {
  final List<City> cities;

  CityLoaded(this.cities);
}
