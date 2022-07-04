abstract class AppState {}

class InitialState extends AppState {}

class LangugeState extends AppState {}

class LoginPasswordState extends AppState {}

class RadioButtonState extends AppState {}

class RadioButtonAgreeToTheTermsState extends AppState {}

class ForgetPassword1State extends AppState {}

class ForgetPassword2State extends AppState {}

class IndexBottomNavBarState extends AppState {}

class ChangeCheckBoxLocation extends AppState {}

class CheckBoxHomeState extends AppState {}

class DataStateChanged extends AppState {
  dynamic state;
  DataStateChanged(this.state);
}
