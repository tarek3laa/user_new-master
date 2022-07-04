import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';

import '../../componnet/componnetAuth.dart';
class ForgetPassword_otb extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: InkWell( onTap: (){
        Navigator.pushNamed(context, "forgetPasswordEnterNewPassword");
      },child: defaultContainer(text: "متابعة",context: context),
      ),


        backgroundColor:Color(0xFF182061),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 55,),
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
              SizedBox(height: 47,),
                // logo fixo
              Container(
                  width:  123.13,
                  height: 109.19,
                  child: Image.asset("images/logoFixo.png",)),
              SizedBox(height: 42,),
              Text(
                'أدخل بريدك الإلكتروني لإرسال الكود',
                style: TextStyle(
                  fontSize: 20,
                  color: const Color(0xffffffff),
                  height: 1.2142857142857142,
                ),
                textHeightBehavior: TextHeightBehavior(applyHeightToFirstAscent: false),
                textAlign: TextAlign.right,
                softWrap: false,
              ),
              SizedBox(height: 49,),
              //todo otpTextFormField
              Center(
              child: OTPTextField(
                  //controller: otpController,
                  length: 4,
                  width: MediaQuery.of(context).size.width,
                  textFieldAlignment: MainAxisAlignment.spaceAround,
                  fieldWidth: 55,
                  fieldStyle: FieldStyle.underline,

                  otpFieldStyle:OtpFieldStyle(borderColor: Color(0xFF9EA1BC),enabledBorderColor: Color(0xFF9EA1BC),focusBorderColor: Color(0xFF9EA1BC),),
                  //outlineBorderRadius: 15,
                  keyboardType:TextInputType.number ,
                  style: TextStyle(fontSize: 20,color: Color(0xffF3BA35)),
                  onChanged: (pin) {
                    print("Changed: " + pin);
                  },
                  onCompleted: (pin) {
                    print("Completed: " + pin);
                  }),
            ),
              SizedBox(height: 30,),
               // timer 
              TweenAnimationBuilder<Duration>(

                  duration: Duration(seconds: 45),
                  tween: Tween(begin: Duration(seconds: 45), end: Duration.zero),
                  onEnd: () {
                    print('Timer ended');
                  },
                  builder: (BuildContext context, Duration value, Widget? child) {
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
              SizedBox(height: 10,),
              // text send Again
              InkWell(
                child: Text(
                  'إعادة إرسال الرمز',
                  style: TextStyle(
                    fontSize: 20,
                    color: const Color(0xffffca34),
                  ),
                  textHeightBehavior: TextHeightBehavior(applyHeightToFirstAscent: false),
                  textAlign: TextAlign.right,
                  softWrap: false,
                ),
              ),

              SizedBox(height: 49,),

            ],),
        ),
      );

  }
}
