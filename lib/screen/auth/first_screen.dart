import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../../bloc/cubit.dart';
import '../../bloc/state.dart';





class FirstScreen extends StatelessWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppState>(builder: (context,state){
      AppCubit cubit =BlocProvider.of(context);
      return Scaffold(
      bottomNavigationBar: InkWell(
        onTap: (){
          Navigator.pushNamed(context, "loginScreen");
        },
        child: Container(
          height: 78,
          width: double.infinity,
          child: Center(
            child: Text(
              'متابعة',
              style: TextStyle(
                fontSize: 30,
                color: const Color(0xff182061),
              ),
              textHeightBehavior: TextHeightBehavior(applyHeightToFirstAscent: false),
              textAlign: TextAlign.center,
              softWrap: false,
            ),
          ),
          color: const Color(0xfff3ba35),
        ),
      ),

      body: Stack(
        alignment: AlignmentDirectional.topCenter,
        children: [
          //#F3BA35
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("images/Fixo-Start-page.gif"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            children: [
              SizedBox(height: 80,),
              Image.asset("images/logofirstScreen.png",width: 300,),
            ],
          ),
          Positioned(
            //height: 70,
            bottom: 50,
            child: Container(
              child: Column(
                children: <Widget>[
                  SizedBox(height: 30,),
                  InkWell(
                    onTap: () {
                      cubit.changeLanguge();
                    },
                    child: SizedBox(
                      height: 45,
                      width: 281,
                      child: Container(
                        padding: EdgeInsets.only(right: 12.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(color:cubit.languge==true? Colors.white:Colors.white.withOpacity(0), spreadRadius: 3),
                            ],
                            border: Border.all(color: Colors.white)),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(""),

                              Text(
                                'العربية',
                                style: TextStyle(


                                  fontSize: 22,
                                  // height: 2,
                                  color:cubit.languge==true? Color(0xFF182061):Colors.white,
                                ),
                                textAlign: TextAlign.right,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  InkWell(
                    onTap: () {
                      cubit.changeLanguge();
                    },
                    child: SizedBox(
                      height: 45,
                      width: 281,
                      child: Container(
                        padding: EdgeInsets.only(right: 12.0),
                        alignment: AlignmentDirectional.centerStart,
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(color:cubit.languge==false? Colors.white:Colors.white.withOpacity(0), spreadRadius: 3),
                            ],
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.white)
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(""),

                            Text(
                              'ENGLISH',
                              style: TextStyle(

                                fontFamily: 'abuhijlahlight',

                                fontSize: 15,
                                // height: 2,
                                color:cubit.languge==false? Color(0xFF182061):Colors.white,
                              ),
                            ),

                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 25),
                  Text(
                    'يمكنك تغيير هذه اللغة في أي وقت من خلال إعدادات\n\nالحساب لديك',
                    style: TextStyle(
                      fontSize: 15,
                      color: const Color(0xffe0e1ea),
                      height: .9,
                    ),
                    textHeightBehavior: TextHeightBehavior(applyHeightToFirstAscent: false),
                    textAlign: TextAlign.center,
                    softWrap: false,
                  )
                ],
              ),
            ),
          ),


        ],
      ),
    );}, listener: (context,state){});
  }
}




//  Container(
//               margin: EdgeInsets.all(25),
//               child: ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                     primary: Color(0xFFF3BA35),
//                     fixedSize: Size.fromWidth(100),
//                     padding: EdgeInsets.all(10)),
//                 child: Text("Press Here"),
//                 onPressed: () {
//                   //Code Here
//                 },
//               )),




// child: Text(
//                 'Join now! Only...',
//                 style: Theme.of(context)
//                     .textTheme
//                     .body1
//                     .copyWith(fontWeight: FontWeight.w600),
//               ),