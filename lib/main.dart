import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_new/business_logic_component/country/country_cubit.dart';
import 'package:user_new/business_logic_component/registrtion/registration_cubit.dart';
import 'package:user_new/data/models/user.dart';
import 'package:user_new/data/repository/country_repository.dart';
import 'package:user_new/data/repository/registration_repositorys.dart';
import 'package:user_new/data/web_services/country_web_services.dart';
import 'package:user_new/screen/Select%20_your_location.dart';
import 'package:user_new/screen/auth/first_screen.dart';
import 'package:user_new/screen/auth/forgetPasswordEnterNewPassword.dart';
import 'package:user_new/screen/auth/forgetPasswordSendEmail.dart';
import 'package:user_new/screen/auth/forgetPassword_otb.dart';
import 'package:user_new/screen/auth/login.dart';
import 'package:user_new/screen/auth/otp_Screen_Next_SignUp.dart';
import 'package:user_new/screen/auth/signUp.dart';
import 'package:user_new/screen/homeLayout.dart';
import 'package:user_new/screen/locationDetails.dart';

import 'bloc/cubit.dart';
import 'bloc/state.dart';
import 'data/web_services/registrations.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    RegistrationOperations registrationOperations = RegistrationOperations();
    RegistrationRepository registrationRepository =
        RegistrationRepository(registrationOperations);
    RegistrationCubit registrationCubit =
        RegistrationCubit(registrationRepository);

    return MultiBlocProvider(
        providers: [
          BlocProvider<AppCubit>(
            create: (BuildContext context) =>
                AppCubit(CountryCubit(CountryRepository(CountryWebServices()))),
          ),
          BlocProvider<RegistrationCubit>(
              create: (BuildContext context) => registrationCubit),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(fontFamily: "Dubai-Medium"),
          routes: {
            "signUp": (context) => SignUp(),
            "loginScreen": (context) => LogIn(),
            "forgetPasswordSendEmail": (context) => ForgetPasswordSendEmail(),
            "forgetPassword_otb": (context) => ForgetPassword_otb(),
            "forgetPasswordEnterNewPassword": (context) =>
                ForgetPasswordEnterNewPassword(),
            "Otp_Next_SignUp": (context) => Otp_Next_SignUp(),
            "Select_your_location": (context) => Select_your_location(),
            "LocationDetails": (context) => LocationDetails(),
            "HomeLayout": (context) => HomeLayout(),
          },
          home: FirstScreen(),
        ));
  }
}
