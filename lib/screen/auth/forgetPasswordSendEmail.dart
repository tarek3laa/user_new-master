import 'package:flutter/material.dart';

import '../../componnet/componnetAuth.dart';

class ForgetPasswordSendEmail extends StatelessWidget {
  TextEditingController email = TextEditingController();

  ForgetPasswordSendEmail({Key? key}) : super(key: key);

  var FormStateKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff182061),
      bottomNavigationBar: InkWell(
        onTap: () {
          if (FormStateKey.currentState!.validate()) {}

          Navigator.pushNamed(context, "forgetPassword_otb");
        },
        child: defaultContainer(text: "متابعة", context: context),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: FormStateKey,
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
                'أدخل بريدك الإلكتروني المسجل لإرسال الكود',
                style: TextStyle(
                  fontSize: 18,
                  color: const Color(0xffffffff),
                ),
                textHeightBehavior:
                    TextHeightBehavior(applyHeightToFirstAscent: false),
                textAlign: TextAlign.right,
                softWrap: false,
              ),
              SizedBox(
                height: 20,
              ),
              defaultNewTextFormField(
                  labelName: "البريد الإلكتروني المسجل",
                  labelStar: "*",
                  hint: " ادخل البريد الإلكتروني المسجل",
                  horizontal: 15,
                  suffix: Icon(
                    Icons.email,
                    color: Colors.grey,
                  ),
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return "يجب ادخال البريد الإلكتروني المسجل ";
                    }
                  },
                  textEditingController: email),
            ],
          ),
        ),
      ),
    );
  }
}
