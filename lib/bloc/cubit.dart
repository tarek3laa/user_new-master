import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:user_new/bloc/state.dart';
import 'package:user_new/business_logic_component/country/country_cubit.dart';
import 'package:user_new/business_logic_component/registrtion/registration_cubit.dart';
import 'package:user_new/screen/homePage/home.dart';
import 'package:user_new/screen/homePage/order.dart';
import 'package:user_new/screen/homePage/wallet.dart';

class AppCubit extends Cubit<AppState> {
  final CountryCubit countryCubit;
  final RegistrationCubit registrationCubit;
  late final StreamSubscription countryStreamSubscription;
  late final StreamSubscription registrationStreamSubscription;

  AppCubit(this.countryCubit, this.registrationCubit) : super(InitialState()) {
    countryStreamSubscription =
        countryCubit.stream.listen((CountryState event) {
      if (event is CountryLoaded) {
        emit(DataStateChanged(event));
      }
    });

    registrationStreamSubscription = registrationCubit.stream.listen((event) {
      emit(DataStateChanged(event));
    });
  }

  // firstScreen
  bool languge = true;

  void changeLanguge() {
    languge = !languge;
    emit(LangugeState());
  }

  // login screen 3
  bool loginPassword = true;
  bool isChecked = false;

  void changeLoginPassword() {
    loginPassword = !loginPassword;
    emit(LoginPasswordState());
  }

  void changeRadio(bool value) {
    isChecked = value;
    emit(RadioButtonState());
  }

  // forget Password Enter New Password
  bool forgetPassword1 = true;
  bool forgetPassword2 = true;

  void changeForgetPassword1() {
    forgetPassword1 = !forgetPassword1;
    emit(ForgetPassword1State());
  }

  void changeForgetPassword2() {
    forgetPassword2 = !forgetPassword2;
    emit(ForgetPassword2State());
  }

  // signUp Cubit
  bool AgreeToTheTerms = false;

  void changeRadioAgreeToTheTerms(bool value) {
    AgreeToTheTerms = value;
    emit(RadioButtonAgreeToTheTermsState());
  }

  // bottom Navigation Bar Cubit
  int indexBottomNavBar = 0; // default is 0
  void changeIndexBottomNavBar(int i) {
    indexBottomNavBar = i;
    emit(IndexBottomNavBarState());
  }

  // location Details Screen
  bool checkBoxLocation = false;

  void changeCheckBoxLocation(bool value) {
    checkBoxLocation = value;
    emit(ChangeCheckBoxLocation());
  }

  @override
  Future<void> close() {
    countryStreamSubscription.cancel();
    registrationStreamSubscription.cancel();
    return super.close();
  }
}
