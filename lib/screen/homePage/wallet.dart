import 'package:flutter/material.dart';

import '../../constants/color.dart';
class WalletScreen extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey ;

  const WalletScreen( {required this.scaffoldKey}) ;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return 
      SingleChildScrollView(
        child: Column(
        children: [
          // drawer & Notification Number
          Container(
            width: width,
            height: height*(90/height),
            padding: EdgeInsets.only(right: 10,bottom: 10,left: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                //todo text notification Number
                Padding(
                  padding: const EdgeInsets.only(bottom: 12.0),
                  child: Stack(
                    alignment: Alignment.topRight,
                    children: [
                      Container(
                          margin: EdgeInsets.only(right: 7),
                          child: Image.asset("images/notification.png",width: 25,height: 25,)),

                      //todo text notification Number
                      CircleAvatar(radius: 9,backgroundColor: colorYellow,child: Text(
                        '4',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 12,
                          color: const Color(0xff182061),
                          height: 1.8333333333333333,
                        ),
                        textHeightBehavior: TextHeightBehavior(applyHeightToFirstAscent: false),
                        softWrap: false,
                      ),)

                    ],
                  ),
                ),
                // Drawer
                Padding(
                  padding: const EdgeInsets.only(bottom: 12.0),
                  child: InkWell(
                      onTap: (){
                        scaffoldKey.currentState!.openEndDrawer();
                      },
                      child: Image.asset("images/Icon_menu.png",width: 25,height: 25,)),
                ),

              ],),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment(-0.955, -0.013),
                end: Alignment(0.881, 0.0),
                colors: [const Color(0xff182061), const Color(0xff16267d)],
                stops: [0.0, 1.0],
              ),
            ),
          ),
          SizedBox(height: 40,),
          // wallet Logo
          Image.asset("images/wallet (1).png",width: width*(142/width),height: height*(128/height),),
          SizedBox(height: 20,),
          Text(
            'رصيدك الحالي',
            style: TextStyle(
              fontSize: 18,
              color: const Color(0xff182061),
            ),
            textAlign: TextAlign.center,
            softWrap: false,
          ),
          SizedBox(height: 20,),
          // todo number of Your current balance
          Container(
            width: width*(297/width),
            height: height*(43/height),
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Text(
                'درهم',
                style: TextStyle(
                  fontSize: 18,
                  color: const Color(0xffe8333a),
                  height: 1,
                ),
                textHeightBehavior: TextHeightBehavior(applyHeightToFirstAscent: false),
                textAlign: TextAlign.center,
                softWrap: false,
              ),
              SizedBox(width: 5,),
              Text(
                '70',
                style: TextStyle(
                  fontSize: 18,
                  color: const Color(0xffe8333a),
                  height: 1.4375,
                ),
                textHeightBehavior: TextHeightBehavior(applyHeightToFirstAscent: false),
                textAlign: TextAlign.center,
                softWrap: false,
              )
            ],),
            decoration: BoxDecoration(
              color: const Color(0xffffffff),
              borderRadius: BorderRadius.circular(4.0),
            ),
          ),
          SizedBox(height: 15,),
          // gift credit and recharge the balance
          Container(
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //todo recharge the balance
                Container(
                  width: width*(139/width),
                  height: height*(125/height),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    Image.asset("images/Subtraction 10.png",width: width*(40/width),height: height*(37/height),),
                    SizedBox(height: 10,),
                    Text(
                      'شحن رصيد',
                      style: TextStyle(
                        fontSize: 14,
                        color: const Color(0xff182061),
                      ),
                      textAlign: TextAlign.center,
                      softWrap: false,
                    )
                  ],),
                  decoration: BoxDecoration(
                    color: const Color(0xffffffff),
                    borderRadius: BorderRadius.circular(4.0),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0x17182061),
                        offset: Offset(0, 5),
                        blurRadius: 18,
                      ),
                    ],
                  ),
                ),
                SizedBox(width: width*(19/width),),
                //todo gift credit
                Container(
                  width: width*(139/width),
                  height: height*(125/height),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("images/Icon ionic-ios-gift.png",width: width*(44/width),height: height*(48/height),),
                      SizedBox(height: 5,),
                      Text(
                        'إهداء رصيد',
                        style: TextStyle(
                          fontSize: 14,
                          color: const Color(0xff182061),
                        ),
                        textAlign: TextAlign.center,
                        softWrap: false,
                      )
                    ],),

                  decoration: BoxDecoration(
                    color: const Color(0xffffffff),
                    borderRadius: BorderRadius.circular(4.0),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0x17182061),
                        offset: Offset(0, 5),
                        blurRadius: 18,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 15,),
          // todo Operations details
          Container(
            width: width*(297/width),
            height: height*(43/height),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'تفاصيل العمليات',
                  style: TextStyle(
                    fontSize: 18,
                    color: const Color(0xff182061),
                  ),
                  textAlign: TextAlign.center,
                  softWrap: false,
                ),
                SizedBox(width: 5,),
                Image.asset("images/Icon_doc.png",width: width*(17/width),height: height*(20/height),)
              ],
            ),
            decoration: BoxDecoration(
              color: const Color(0xffffffff),
              borderRadius: BorderRadius.circular(4.0),
              boxShadow: [
                BoxShadow(
                  color: const Color(0x17182061),
                  offset: Offset(0, 5),
                  blurRadius: 18,
                ),
              ],
            ),
          ),

          SizedBox(height: 12,),
          // todo Card management
          Container(
            width: width*(297/width),
            height: height*(43/height),
            child: Center(
              child: Text(
                'إدارة البطاقات',
                style: TextStyle(
                  fontSize: 18,
                  color: const Color(0xff182061),
                ),
                textAlign: TextAlign.center,
                softWrap: false,
              ),
            ),
            decoration: BoxDecoration(
              color: const Color(0xfff3ba35),
              borderRadius: BorderRadius.circular(4.0),
              boxShadow: [
                BoxShadow(
                  color: const Color(0x17182061),
                  offset: Offset(0, 5),
                  blurRadius: 18,
                ),
              ],
            ),
          ),
          SizedBox(height: 20,),




        ],
    ),
      );
  }
}
