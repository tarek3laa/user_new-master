import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_new/business_logic_component/country/country_cubit.dart';
import 'package:user_new/business_logic_component/registrtion/registration_cubit.dart';
import 'package:user_new/data/models/country.dart';
import 'package:user_new/data/models/user.dart';

import '../../bloc/cubit.dart';
import '../../bloc/state.dart';
import '../../componnet/componnetAuth.dart';
import '../../data/models/session.dart';

class LogIn extends StatefulWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  CountryCubit countryCubit = CountryCubit();
  RegistrationCubit registrationCubit = RegistrationCubit();
  List<Country> countries = [];

  @override
  void initState() {
    countryCubit.getAllCountries();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(builder: (context, state) {
      AppCubit cubit = BlocProvider.of(context);
      var phone = TextEditingController();
      var password = TextEditingController();
      var FormStateKey = GlobalKey<FormState>();

      return WillPopScope(
        onWillPop: () async {
          Navigator.maybePop(context);
          return false;
        },
        child: Scaffold(
          backgroundColor: Color(0xff182061),
          body: SingleChildScrollView(
            child: Form(
              key: FormStateKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SizedBox(
                    height: 55,
                  ),
                  arrowBack(context: context),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Image.asset(
                          "images/logo.png",
                          width: 81,
                          height: 72,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          "مرحباً بعودتك",
                          style: TextStyle(
                            fontSize: 28,
                            color: const Color(0xffffffff),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),

                        Text(
                          'تسجيل الدخول',
                          style: TextStyle(
                            fontSize: 20,
                            color: const Color(0xffffffff),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),

                        // Enter Phone Number
                        defaultNewTextFormField(
                            labelName: "رقم الجوال",
                            labelStar: "*",
                            hint: "ادخل رقم الجوال",
                            textInputType: TextInputType.number,
                            textEditingController: phone,
                            validator: (String? value) {
                              if (value!.isEmpty) {
                                return "يجب ادخال رقم الجوال";
                              }
                            }),

                        SizedBox(
                          height: 10,
                        ),

                        // Enter Password
                        defaultNewTextFormField(
                            labelName: "كلمة المرور",
                            labelStar: "*",
                            hint: "ادخل كلمة المرور",
                            suffix: IconButton(
                              onPressed: () {
                                cubit.changeLoginPassword();
                              },
                              icon: Icon(
                                cubit.loginPassword == true
                                    ? Icons.visibility_off_rounded
                                    : Icons.visibility,
                                size: 20,
                                color: Colors.grey,
                              ),
                            ),
                            obscureText: cubit.loginPassword,
                            textEditingController: password,
                            validator: (String? value) {
                              if (value!.isEmpty) {
                                return "يجب ادخال كلمة المرور ";
                              }
                            }),

                        SizedBox(
                          height: 10,
                        ),
                        // remember me
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              'تذكرني',
                              style: TextStyle(
                                fontSize: 18,
                                color: const Color(0xffffca34),
                              ),
                            ),
                            SizedBox(
                              width: 25,
                              child: Checkbox(
                                  shape: CircleBorder(),
                                  activeColor: Color(0xffF3BA35),
                                  checkColor: Color(0xff182061),
                                  value: cubit.isChecked,
                                  onChanged: (bool? value) {
                                    cubit.changeRadio(value!);
                                  }),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),

                        // button signIn
                        InkWell(
                          onTap: () {
                            if (FormStateKey.currentState!.validate()) {
                              User user = User(
                                  type: 'CLIENT',
                                  phone: phone.text,
                                  password: password.text,
                                  country: 1);
                              cubit.indexBottomNavBar = 4;
                              registrationCubit.signIn(user);
                            }
                          },
                          child: Container(
                            width: double.infinity,
                            height: 56,
                            child: Center(
                              child: Text(
                                'دخول',
                                style: TextStyle(
                                  fontSize: 22,
                                  color: const Color(0xff182061),
                                ),
                              ),
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xfff3ba35),
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),

                        // forgetPasswordTextButton
                        Center(
                          child: InkWell(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, "forgetPasswordSendEmail");
                            },
                            child: Text(
                              'نسيت كلمة المرور ؟',
                              style: TextStyle(
                                fontSize: 19,
                                color: const Color(0xffe0e1ea),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        //todo not Have Account
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.pushNamed(context, "signUp");
                              },
                              child: Text(
                                'تسجيل جديد',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: const Color(0xffFFCA34),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 3,
                            ),
                            Text(
                              'لا أمتلك حساب ؟',
                              style: TextStyle(
                                fontSize: 18,
                                color: const Color(0xffe0e1ea),
                              ),
                            ),
                          ],
                        ),

                        SizedBox(
                          height: 10,
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                                child: Container(
                              height: .8,
                              color: Colors.grey,
                            )),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'او من خلال',
                              style: TextStyle(
                                fontSize: 18,
                                color: const Color(0xffcccdd9),
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Expanded(
                                child: Container(
                              height: .8,
                              color: Colors.grey,
                            )),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),

                        // choice facebook or gmail
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            //todo facebook Button
                            InkWell(
                              onTap: () {},
                              child: Image.asset(
                                "images/Group 36956.png",
                                width: 116,
                                height: 47,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            //todo gmail Button
                            InkWell(
                              onTap: () {},
                              child: Image.asset(
                                "images/Group 36957.png",
                                width: 116,
                                height: 47,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }, listener: (context, state) {
      if (state is DataStateChanged) {
        var dataState = state.state;
        if (dataState is CountryLoaded) countries = dataState.countries;

        if (dataState is SessionLoaded) {
          Session session = dataState.session;
          print(session.token);
          Navigator.pushNamedAndRemoveUntil(
              context, "HomeLayout", (route) => false,
              arguments: session);
        } else if (dataState is ErrorSessionState) {
          print(dataState.errorSession.statuesCode);
          print(dataState.errorSession.errors);
        }
      }
    });
  }
}
