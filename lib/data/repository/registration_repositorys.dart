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

  Future<Session> signUp(User user) async {
    var userData = await _registrationOperations.signUp(user);
    return Session.fromJson(userData);
  }

  Future<Session> signIn(User user) async {
    var userData = await _registrationOperations.signIn(user);
    Session session;

    session = Session.fromJson(userData);

    return session;
  }

  Future<bool> sendCodeToUserPhone(String phone, countryKey) async {
    var statuesCode =
        await _registrationOperations.sendCodeToUserPhone(phone, countryKey);
    return statuesCode == 200;
  }

  Future<int> confirmCode(phone, countryKey, code) async {
    var statCode =
        await _registrationOperations.confirmCode(phone, countryKey, code);
    return (statCode != null) ? statCode : -1;
  }
}
