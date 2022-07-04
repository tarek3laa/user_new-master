import 'package:user_new/data/models/user.dart';

class Session {
  String token;
  User user;

  Session(this.token, this.user);

  factory Session.fromJson(Map<String, dynamic> json) =>
      Session(json['token'], User.fromJson(json['user']));


}
