import 'package:flutter/material.dart';
import 'package:user_new/componnet/componnetAuth.dart';
import 'package:user_new/constants/color.dart';
import 'package:user_new/data/models/session.dart';

class Select_your_location extends StatelessWidget {
  final session;

  const Select_your_location({Key? key, required this.session})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(session.token);
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      bottomNavigationBar: InkWell(
        onTap: () {
          Navigator.pushNamed(context, "LocationDetails");
        },
        child: defaultContainer(text: "تأكيد", context: context),
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: height * (170 / height),
            child: Column(
              children: [
                SizedBox(
                  height: 55,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("      "),
                    Text(
                      'حدد موقعك',
                      style: TextStyle(
                        fontSize: 18,
                        color: const Color(0xffffca34),
                        height: 0.8518518518518519,
                      ),
                      textHeightBehavior:
                          TextHeightBehavior(applyHeightToFirstAscent: false),
                      textAlign: TextAlign.center,
                      softWrap: false,
                    ),
                    arrowBack(context: context)
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: width * (343 / width),
                  height: height * (40 / height),
                  padding: EdgeInsets.only(right: 20, bottom: 8),
                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: TextFormField(
                      style: TextStyle(fontSize: 18, color: colorYellow),
                      cursorColor: Color(0xff303b7d),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        suffixIcon: IconButton(
                            onPressed: () {},
                            icon: Image.asset("images/Path 78.png")),
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xff303b7d),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                )
              ],
            ),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment(-0.955, -0.013),
                end: Alignment(0.881, 0.0),
                colors: [const Color(0xff182061), const Color(0xff16267d)],
                stops: [0.0, 1.0],
              ),
            ),
          )
        ],
      ),
    );
  }
}
