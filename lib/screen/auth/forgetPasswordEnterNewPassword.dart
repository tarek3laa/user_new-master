import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/cubit.dart';
import '../../bloc/state.dart';
import '../../componnet/componnetAuth.dart';

class ForgetPasswordEnterNewPassword extends StatelessWidget {
  const ForgetPasswordEnterNewPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
        builder: (context, state) {
          AppCubit cubit = BlocProvider.of(context);
          return Scaffold(
            bottomNavigationBar: InkWell(
              onTap: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, "loginScreen", (route) => false);
              },
              child: Container(
                width: double.infinity,
                height: 78,
                child: Center(
                    child: Text(
                  "حفظ",
                  style: TextStyle(
                    fontSize: 30,
                    color: const Color(0xff182061),
                  ),
                )),
                decoration: BoxDecoration(
                  color: const Color(0xfff3ba35),
                  borderRadius: BorderRadius.circular(0.0),
                ),
              ),
            ),
            backgroundColor: Color(0xFF182061),
            body: Container(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 55,
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("              "),
                        Text(
                          'نسيت كلمة المرور',
                          style: TextStyle(
                            fontSize: 20,
                            color: const Color(0xffffffff),
                          ),
                        ),
                        arrowBack(context: context)
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    fixoIcon(width: 123, height: 109),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      'أدخل كلمة المرور الجديدة',
                      style: TextStyle(
                        fontSize: 20,
                        color: const Color(0xffffffff),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),

                    //  new password TextFormField
                    defaultNewTextFormField(
                        labelName: "كلمة المرور الجديدة",
                        labelStar: "*",
                        hint: "ادخل كلمة المرور الجديدة",
                        horizontal: 15,
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
                        obscureText: cubit.forgetPassword1),
                    SizedBox(
                      height: 10,
                    ),

                    // Confirm the new password TextFormField
                    defaultNewTextFormField(
                        labelName: "تأكيد كلمة المرور الجديدة",
                        labelStar: "*",
                        hint: "ادخل تأكيد كلمة المرور الجديدة",
                        horizontal: 15,
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
                  ],
                ),
              ),
            ),
          );
        },
        listener: (context, state) {});
  }
}
