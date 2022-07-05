import 'package:flutter/material.dart';
import 'package:user_new/data/models/country.dart';

Widget arrowBack({required BuildContext context, double right = 10}) => InkWell(
    onTap: () {
      Navigator.maybePop(context);
    },
    child: Padding(
      padding: EdgeInsets.only(right: right),
      child: Image.asset(
        "images/left-arrow.png",
        width: 22,
        height: 16,
      ),
    ));

Widget fixoIcon({
  double width = 80,
  double height = 72,
}) =>
    Image.asset(
      "images/logo.png",
      width: width,
      height: height,
    );

// textFormField
defaultNewTextFormField(
        {required String labelName,
        required String labelStar,
        required String hint,
        Widget? suffix,
        TextDirection textDirection = TextDirection.rtl,
        validator,
        TextEditingController? textEditingController,
        bool obscureText = false,
        TextInputType textInputType = TextInputType.name,
        double? horizontal = 0,
        Color labelTextColor = Colors.white}) =>
    Directionality(
      textDirection: textDirection,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: horizontal!),
        child: TextFormField(
          style: TextStyle(fontSize: 20, color: Color(0xffFFCA34)),
          validator: validator,
          controller: textEditingController,
          obscureText: obscureText,
          keyboardType: textInputType,
          decoration: InputDecoration(
            label: Row(
              children: [
                Text(
                  labelName,
                  style: TextStyle(fontSize: 16, color: labelTextColor),
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  labelStar,
                  style: TextStyle(fontSize: 15, color: Color(0xffFFCA34)),
                ),
              ],
            ),
            hintText: hint,
            hintStyle: TextStyle(
              fontSize: 14,
              color: const Color(0xff9ea1bc),
            ),
            suffixIcon: Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: suffix,
            ),
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Color(0xFF9B9FBB))),
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Color(0xFF9B9FBB))),
          ),
        ),
      ),
    );
// Container default ex. bottomSheet

defaultContainer({
  required String text,
  required BuildContext context,
  String? pushName,
  double height = 78,
  EdgeInsetsGeometry? marginEdgeInsetsGeometry,
  EdgeInsetsGeometry? paddingEdgeInsetsGeometry,
}) =>
    Container(
      width: double.infinity,
      height: height,
      margin: marginEdgeInsetsGeometry,
      padding: paddingEdgeInsetsGeometry,
      child: Center(
          child: Text(
        text,
        style: TextStyle(
          fontSize: 30,
          color: const Color(0xff182061),
        ),
      )),
      decoration: BoxDecoration(
        color: const Color(0xfff3ba35),
        borderRadius: BorderRadius.circular(0.0),
      ),
    );
