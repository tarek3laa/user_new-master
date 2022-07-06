
import '../web_services/registrations.dart';
import '../models/user.dart';
import '../models/session.dart';

class RegistrationRepository {
  late final RegistrationOperations _registrationOperations;
  static final RegistrationRepository _instance = RegistrationRepository._();

  factory RegistrationRepository() => _instance;

  RegistrationRepository._() {
    _registrationOperations = RegistrationOperations();
  }

  Future<SessionData> signUp(User user) async {
    var response = await _registrationOperations.signUp(user);
    if (response.statusCode == 200)
      return Session.fromJson(response.data);
    else
      return ErrorSession.fromJson(response.data);
  }

  Future<SessionData> signIn(User user) async {
    var response = await _registrationOperations.signIn(user);
    if (response.statusCode == 200)
      return Session.fromJson(response.data);
    else
      return ErrorSession.fromJson(response.data);
  }

  Future<bool> sendCodeToUserPhone(String phone, countryKey) async {
    var statuesCode =
        await _registrationOperations.sendCodeToUserPhone(phone, countryKey);
    return statuesCode == 200;
  }

  Future<bool> sendCodeToUserEmail(String email) async {
    var statuesCode = await _registrationOperations.sendCodeToUserEmail(email);
    return statuesCode == 200;
  }

  Future<int> confirmCode(phone, countryKey, code) async {
    var statCode =
        await _registrationOperations.confirmCode(phone, countryKey, code);
    return (statCode != null) ? statCode : -1;
  }
}
