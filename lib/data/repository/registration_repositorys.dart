import '../web_services/registrations.dart';
import '../models/user.dart';
import '../models/session.dart';

class RegistrationRepository {
  final RegistrationOperations registrationOperations;

  RegistrationRepository(this.registrationOperations);

  Future<Session> signUp(User user) async {
    var userData = await registrationOperations.signUp(user);
    return Session.fromJson(userData);
  }

  Future<Session> signIn(User user) async {
    var userData = await registrationOperations.signIn(user);
    return Session.fromJson(userData);
  }

  Future<bool> sendCodeToUserPhone(String phone, countryKey) async {
    var statuesCode =
        await registrationOperations.sendCodeToUserPhone(phone, countryKey);
    return statuesCode == 200;
  }

  Future<int> confirmCode(phone, countryKey, code) async {
    var statCode =
        await registrationOperations.confirmCode(phone, countryKey, code);
    return (statCode != null) ? statCode : -1;
  }

}
