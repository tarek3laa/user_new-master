import 'package:user_new/data/models/user.dart';

abstract class SessionData {}

class ErrorSession extends SessionData {
  int statuesCode;
  dynamic errors;

  ErrorSession(this.statuesCode, this.errors);

  factory ErrorSession.fromJson(json) => ErrorSession(json['errorCode'],json['errors']);
}


class Session extends SessionData {
  String token;
  User? user;

  Session(this.token, this.user);

  factory Session.fromJson(Map<String, dynamic> json) =>
      Session(json['token'], User.fromJson(json['user']));

}
