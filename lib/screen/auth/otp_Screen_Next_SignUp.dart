import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';
import 'package:user_new/bloc/cubit.dart';
import 'package:user_new/bloc/state.dart';
import 'package:user_new/business_logic_component/registrtion/registration_cubit.dart';
import 'package:user_new/componnet/componnetAuth.dart';
import 'package:user_new/constants/color.dart';
import 'package:user_new/data/models/session.dart';

import '../../data/models/user.dart';

class Otp_Next_SignUp extends StatefulWidget {
  final user;

  Otp_Next_SignUp({Key? key, required this.user}) : super(key: key);

  @override
  State<Otp_Next_SignUp> createState() => _Otp_Next_SignUpState();
}

class _Otp_Next_SignUpState extends State<Otp_Next_SignUp> {
  RegistrationCubit registrationCubit = RegistrationCubit();
  bool code_confirmed = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {
        var dataState;
        if (state is DataStateChanged) {
          dataState = state.state;
          if (dataState is CodeConfirmed) {
            code_confirmed = true;
          }
          if (dataState is SessionLoaded) {
            Session session = dataState.session;
            print(session.token);
            if (session.user != null) {
              Navigator.pushReplacementNamed(context, "Select_your_location",
                  arguments: session);
            }
          }
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: colorBlue,
          bottomNavigationBar: InkWell(
            onTap: () {
              if (code_confirmed) {
                registrationCubit.signUp(widget.user);
              }
            },
            child: defaultContainer(text: "متابعة", context: context),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SizedBox(
                height: 55,
              ),
              arrowBack(context: context),
              SizedBox(
                height: 30,
              ),
              Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    fixoIcon(),
                    SizedBox(
                      height: 20,
                    ),

                    Text(
                      'أدخل الكود المرسل على جوالك',
                      style: TextStyle(
                        fontSize: 18,
                        color: const Color(0xffffffff),
                        height: 1.2142857142857142,
                      ),
                      textHeightBehavior:
                          TextHeightBehavior(applyHeightToFirstAscent: false),
                      textAlign: TextAlign.right,
                      softWrap: false,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    // otp TextFormField
                    Center(
                      child: OTPTextField(
                          //  controller: otpController,

                          length: 4,
                          width: MediaQuery.of(context).size.width,
                          textFieldAlignment: MainAxisAlignment.spaceBetween,
                          fieldWidth: 60,
                          fieldStyle: FieldStyle.underline,
                          otpFieldStyle: OtpFieldStyle(
                            borderColor: Color(0xFF9EA1BC),
                            enabledBorderColor: Color(0xFF9EA1BC),
                            focusBorderColor: Color(0xFF9EA1BC),
                          ),
                          //outlineBorderRadius: 15,
                          keyboardType: TextInputType.number,
                          style:
                              TextStyle(fontSize: 20, color: Color(0xffF3BA35)),
                          onChanged: (pin) {
                            print("Changed: " + pin);
                          },
                          onCompleted: (pin) {
                            registrationCubit.codeConfirmation(
                                widget.user.phone, '1', pin);
                            print("Completed: " + pin);
                          }),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    // timer
                    TweenAnimationBuilder<Duration>(
                        duration: Duration(seconds: 45),
                        tween: Tween(
                            begin: Duration(seconds: 45), end: Duration.zero),
                        onEnd: () {
                          print('Timer ended');
                        },
                        builder: (BuildContext context, Duration value,
                            Widget? child) {
                          final minutes = value.inMinutes;
                          final seconds = value.inSeconds % 60;
                          return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              child: Text('$minutes:$seconds',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Color(0xffFFFFFF),
                                      fontWeight: FontWeight.w500,
                                      fontSize: 18)));
                        }),
                    // send code again
                    InkWell(
                      onTap: () {
                        registrationCubit.sendCodeToUserPhone(
                            widget.user.phone, '1');
                      },
                      child: Text(
                        'إعادة إرسال الرمز',
                        style: TextStyle(
                          fontSize: 15,
                          color: const Color(0xffffca34),
                          decoration: TextDecoration.underline,
                          height: 3.0,
                        ),
                        textHeightBehavior:
                            TextHeightBehavior(applyHeightToFirstAscent: false),
                        textAlign: TextAlign.right,
                        softWrap: false,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }

  @override
  void initState() {
    registrationCubit.sendCodeToUserPhone(widget.user.phone, '1');
  }
}
