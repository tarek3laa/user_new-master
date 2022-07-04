import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:user_new/data/models/country.dart';
import 'package:user_new/data/repository/country_repository.dart';

import '../../data/models/city.dart';

part 'country_state.dart';

class CountryCubit extends Cubit<CountryState> {
  final CountryRepository countryRepository;

  CountryCubit(this.countryRepository) : super(CountryInitial());

  void getAllCountries() => countryRepository
      .getAllCountries()
      .then((value) => emit(CountryLoaded(value)));

  void getAllCities() => countryRepository
      .getAllCities()
      .then((value) => emit(CityLoaded(value)));

}
