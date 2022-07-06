import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_new/business_logic_component/country/country_cubit.dart';
import 'package:user_new/business_logic_component/home_page/home_page_cubit.dart';
import 'package:user_new/business_logic_component/registrtion/registration_cubit.dart';
import 'package:user_new/screen/router.dart';
import 'bloc/cubit.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    RegistrationCubit registrationCubit = RegistrationCubit();

    return MultiBlocProvider(
        providers: [
          BlocProvider<AppCubit>(
            create: (BuildContext context) =>
                AppCubit(CountryCubit(), registrationCubit,HomePageCubit()),
          ),
          BlocProvider<RegistrationCubit>(
              create: (BuildContext context) => registrationCubit),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(fontFamily: "Dubai-Medium"),
          onGenerateRoute: RouteGenerator.onGenerateRoute,
          initialRoute: '/',
        ));
  }
}
