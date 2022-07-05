import 'package:flutter/material.dart';

import '../data/models/user.dart';
import 'Select _your_location.dart';
import 'auth/first_screen.dart';
import 'auth/forgetPasswordEnterNewPassword.dart';
import 'auth/forgetPasswordSendEmail.dart';
import 'auth/forgetPassword_otb.dart';
import 'auth/login.dart';
import 'auth/otp_Screen_Next_SignUp.dart';
import 'auth/signUp.dart';
import 'homeLayout.dart';
import 'locationDetails.dart';

class RouteGenerator {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (context) => FirstScreen());
      case 'signUp':
        return MaterialPageRoute(builder: (context) => SignUp());
      case 'loginScreen':
        return MaterialPageRoute(builder: (context) => LogIn());
      case 'forgetPasswordSendEmail':
        return MaterialPageRoute(
            builder: (context) => ForgetPasswordSendEmail());
      case 'forgetPassword_otb':
        return MaterialPageRoute(builder: (context) => ForgetPassword_otb());

      case 'forgetPasswordEnterNewPassword':
        return MaterialPageRoute(
            builder: (context) => ForgetPasswordEnterNewPassword());
      case 'Otp_Next_SignUp':
        return MaterialPageRoute(
            builder: (context) => Otp_Next_SignUp(user: args));

      case 'Select_your_location':
        return MaterialPageRoute(
            builder: (context) => Select_your_location(session: args));
      case 'LocationDetails':
        return MaterialPageRoute(builder: (context) => LocationDetails());
      case 'HomeLayout':
        return MaterialPageRoute(builder: (context) => HomeLayout(session: args));
      default:
        return _error();
    }
  }

  static Route<dynamic> _error() {
    return MaterialPageRoute(builder: (context) {
      return Scaffold();
    });
  }
}
