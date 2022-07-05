import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:user_new/data/models/country.dart';
import 'package:user_new/data/repository/country_repository.dart';

import '../../data/models/city.dart';

part 'country_state.dart';

class CountryCubit extends Cubit<CountryState> {
  late final CountryRepository _countryRepository;
  static CountryCubit _instance = CountryCubit._();

  CountryCubit._() : super(CountryInitial()) {
    _countryRepository = CountryRepository();
  }

  factory CountryCubit() => _instance;

  void getAllCountries() => _countryRepository
      .getAllCountries()
      .then((value) => emit(CountryLoaded(value)));

  void getAllCities() => _countryRepository
      .getAllCities()
      .then((value) => emit(CityLoaded(value)));
}
