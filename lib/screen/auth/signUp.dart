import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_new/bloc/cubit.dart';
import 'package:user_new/bloc/state.dart';
import 'package:user_new/business_logic_component/country/country_cubit.dart';
import 'package:user_new/business_logic_component/registrtion/registration_cubit.dart';
import 'package:user_new/componnet/componnetAuth.dart';
import 'package:user_new/constants/color.dart';
import 'package:user_new/data/models/country.dart';
import 'package:user_new/data/models/user.dart';
import 'package:user_new/data/repository/country_repository.dart';
import 'package:user_new/data/web_services/country_web_services.dart';

class SignUp extends StatefulWidget {
  SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  var userName = TextEditingController();

  var phone = TextEditingController();

  var password = TextEditingController();

  var passwordAgain = TextEditingController();

  var email = TextEditingController();

  List<Country> countries = [];
  CountryCubit countryCubit = CountryCubit();

  @override
  void initState() {
    countryCubit.getAllCountries();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(builder: (context, state) {
      AppCubit cubit = BlocProvider.of(context);
      double width = MediaQuery.of(context).size.width;
      GlobalKey<FormState> formKey = GlobalKey<FormState>();

      return Scaffold(
        backgroundColor: colorBlue,
        bottomNavigationBar: InkWell(
          onTap: () {
            if (formKey.currentState!.validate()) {
              User user = User(
                  type: 'CLIENT',
                  username: userName.text,
                  email: email.text,
                  phone: phone.text,
                  password: password.text,
                  country: 1);
              Navigator.pushNamed(context, "Otp_Next_SignUp", arguments: user);
            }
          },
          child: defaultContainer(text: "????????????", context: context),
        ),
        body: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SizedBox(
                  height: 55,
                ),
                arrowBack(context: context), // ?????? ????????????
                SizedBox(
                  height: 15,
                ),
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      fixoIcon(),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        '! ????????????\n?????? ???? ???????? ?????? ?????????? ????????????????????',
                        style: TextStyle(
                          fontSize: width / 17,
                          color: const Color(0xffffffff),
                          height: 1.2,
                        ),
                        textHeightBehavior:
                            TextHeightBehavior(applyHeightToFirstAscent: false),
                        textAlign: TextAlign.right,
                        softWrap: false,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      defaultNewTextFormField(
                          labelName: "?????? ????????????????",
                          labelStar: "*",
                          hint: "???????? ?????? ????????????????",
                          suffix: Icon(
                            Icons.person,
                            color: Colors.grey,
                          ),
                          textEditingController: userName,
                          validator: (String? value) {
                            if (value!.isEmpty) {
                              return "?????? ?????????? ?????? ???????????????? !";
                            }
                          }),

                      defaultNewTextFormField(
                          labelName: "?????? ????????????",
                          labelStar: "*",
                          hint: "???????? ?????? ????????????",
                          textInputType: TextInputType.number,
                          textEditingController: phone,
                          validator: (String? value) {
                            if (value!.isEmpty) {
                              return "?????? ?????????? ?????? ???????????? !";
                            }
                          }),

                      defaultNewTextFormField(
                          labelName: "???????????? ????????????????????",
                          labelStar: "*",
                          hint: "???????? ???????????? ????????????????????",
                          suffix: Icon(
                            Icons.email_rounded,
                            color: Colors.grey,
                          ),
                          textInputType: TextInputType.emailAddress,
                          textEditingController: email,
                          validator: (String? value) {
                            if (value!.isEmpty) {
                              return "?????? ?????????? ???????????? ???????????????????? !";
                            }
                          }),
                      //  new password TextFormField
                      defaultNewTextFormField(
                          textEditingController: password,
                          labelName: "???????? ????????????",
                          labelStar: "*",
                          hint: "???????? ???????? ????????????",
                          suffix: InkWell(
                            onTap: () {
                              cubit.changeForgetPassword1();
                            },
                            child: Icon(
                              cubit.forgetPassword1 == true
                                  ? Icons.visibility_off_rounded
                                  : Icons.visibility,
                              color: Colors.grey,
                              size: 20,
                            ),
                          ),
                          obscureText: cubit.forgetPassword1,
                          validator: (String? value) {
                            if (value!.isEmpty) {
                              return "?????? ?????????? ???????? ???????????? !";
                            }
                          }),
                      SizedBox(
                        height: 10,
                      ),

                      // Confirm the new password TextFormField
                      defaultNewTextFormField(
                          validator: (String? value) {
                            if (value!.isEmpty) {
                              return "?????? ?????????? ?????????? ???????? ???????????? !";
                            }
                          },
                          textEditingController: passwordAgain,
                          labelName: "?????????? ???????? ????????????",
                          labelStar: "*",
                          hint: "???????? ?????????? ???????? ????????????",
                          suffix: InkWell(
                              onTap: () {
                                cubit.changeForgetPassword2();
                              },
                              child: Icon(
                                cubit.forgetPassword2 == true
                                    ? Icons.visibility_off_rounded
                                    : Icons.visibility,
                                color: Colors.grey,
                                size: 20,
                              )),
                          obscureText: cubit.forgetPassword2),
                      SizedBox(
                        height: 15,
                      ),

                      //?????????????? ???????????? ???? ?????????? ?????????????????? ?????? ????????????
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text.rich(
                            TextSpan(
                              style: TextStyle(
                                fontSize: 15,
                                color: const Color(0xffffffff),
                                height: 1.2,
                              ),
                              children: [
                                TextSpan(
                                  text:
                                      '?????????????? ???????????? ???? ?????????? ?????????????????? ?????? ',
                                ),
                                TextSpan(
                                  text: '????????????\n',
                                  style: TextStyle(
                                    color: const Color(0xffffca34),
                                  ),
                                ),
                                TextSpan(
                                  text: '??',
                                ),
                                TextSpan(
                                  text: '??????????????',
                                  style: TextStyle(
                                    color: const Color(0xffffca34),
                                  ),
                                ),
                              ],
                            ),
                            textHeightBehavior: TextHeightBehavior(
                                applyHeightToFirstAscent: false),
                            textAlign: TextAlign.right,
                            softWrap: false,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          SizedBox(
                            width: 25,
                            child: Checkbox(
                                shape: CircleBorder(),
                                activeColor: Color(0xffF3BA35),
                                checkColor: Color(0xff182061),
                                value: cubit.AgreeToTheTerms,
                                onChanged: (bool? value) {
                                  cubit.changeRadioAgreeToTheTerms(value!);
                                }),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      );
    }, listener: (context, state) {
      if (state is DataStateChanged) {
        var dataState = state.state;
        if (dataState is CountryLoaded) countries = dataState.countries;
      }
    });
  }
}
