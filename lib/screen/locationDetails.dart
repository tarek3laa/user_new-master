import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_new/bloc/cubit.dart';
import 'package:user_new/bloc/state.dart';

import '../componnet/componnetAuth.dart';
class LocationDetails extends StatelessWidget {
  const LocationDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return BlocConsumer<AppCubit,AppState>(builder: (context,state){
      AppCubit cubit = BlocProvider.of(context);
      return Scaffold(
        bottomNavigationBar: InkWell( onTap: (){
          cubit.indexBottomNavBar=4;
          Navigator.pushNamedAndRemoveUntil(context, "HomeLayout", (route) => false);
        },child: defaultContainer(text: "حفظ",context: context),
        ),

        backgroundColor: Color(0xffF3F4F6),
        body: 
        SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: width,
                height:height*(110/height) ,
                child: Column(children: [
                  SizedBox(height: 55,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("      "),
                      Text(
                        'عنوان جديد',
                        style: TextStyle(
                          fontSize: 18,
                          color: const Color(0xffffca34),
                          height: 0.8518518518518519,
                        ),
                        textHeightBehavior: TextHeightBehavior(applyHeightToFirstAscent: false),
                        textAlign: TextAlign.center,
                        softWrap: false,
                      ),
                      arrowBack(context: context)

                    ],),

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
              SizedBox(height: 22,),

              Container(
                width: width,
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: [
                    //todo address home or work =>  false is work , true is home

                    Container(child:
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,

                          children: [
                            Row(
                              children: [
                                Text(
                                  'العمل',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: cubit.checkBoxLocation==false? Color(0xffcc9d1a):Color(0xff737895),
                                  ),
                                  textAlign: TextAlign.center,
                                  softWrap: false,
                                )  ,
                                SizedBox(width: 5,),

                                CircleAvatar(
                                  radius: 12,
                                  backgroundColor:cubit.checkBoxLocation==false? Color(0xffF3BA35):Colors.white.withOpacity(0),

                                  child: CircleAvatar(
                                    radius: 10,
                                    backgroundColor: Colors.white,
                                    child: Checkbox(
                                      // side: MaterialStateBorderSide.resolveWith(
                                      //       (states) => BorderSide(width: 1.5, color: Colors.white),
                                      // ),
                                        shape: CircleBorder(),

                                        activeColor: Color(0xffF3BA35),
                                        checkColor: Color(0xffF3BA35),
                                        value:  cubit.checkBoxLocation==false?true:false, onChanged: (bool? value){
                                      cubit.changeCheckBoxLocation(false);
                                    }),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(width:30,),
                            Row(
                              children: [
                                Text(
                                  'المنزل',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: cubit.checkBoxLocation==true? Color(0xffcc9d1a):Color(0xff737895),
                                  ),
                                  textAlign: TextAlign.center,
                                  softWrap: false,
                                ),
                                SizedBox(width: 5,),
                                CircleAvatar(
                                  radius: 12,
                                  backgroundColor:cubit.checkBoxLocation==true? Color(0xffF3BA35):Colors.white.withOpacity(0),

                                  child: CircleAvatar(
                                    radius: 10,
                                    backgroundColor: Colors.white,
                                    child: Checkbox(
                                      // side: MaterialStateBorderSide.resolveWith(
                                      //       (states) => BorderSide(width: 1.5, color: Colors.white),
                                      // ),
                                        shape: CircleBorder(),
                                        hoverColor: Colors.black,
                                        activeColor: Color(0xffF3BA35),
                                        checkColor: Color(0xffF3BA35),
                                        value: cubit.checkBoxLocation==true?true:false, onChanged: (bool? value){
                                      cubit.changeCheckBoxLocation(true);
                                    }),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(width:30,),
                            Row(
                              children: [
                                Text("*",style: TextStyle(color: Colors.amber,fontSize: 15),),
                                SizedBox(width:5 ,),
                                Text(
                                  'اسم العنوان',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: const Color(0xff36393b),
                                  ),
                                  textAlign: TextAlign.center,
                                  softWrap: false,
                                )

                              ],
                            ),

                          ],),
                        SizedBox(height: 5,),
                        Container(color: Colors.grey,width: double.infinity,height: 1,)
                      ],
                    ),),
                    SizedBox(height: 5,),

                    defaultNewTextFormField(labelName: "أختر المدينة", labelStar: "*", hint: "دبي",labelTextColor: Color(0xff36393B),suffix: Icon(Icons.arrow_drop_down_outlined,color: Colors.grey,)),
                    defaultNewTextFormField(labelName: "أختر المنطقة", labelStar: "*", hint: "منطقة دبي",labelTextColor: Color(0xff36393B),),
                    defaultNewTextFormField(labelName: "الشارع", labelStar: "*", hint: "ادخل اسم الشارع",labelTextColor: Color(0xff36393B),),
                    defaultNewTextFormField(labelName: "المبنى", labelStar: "*", hint: "ادخل رقم او اسم المبنى",labelTextColor: Color(0xff36393B),),
                    defaultNewTextFormField(labelName: "الدور", labelStar: "*", hint: "منطقة دبي",labelTextColor: Color(0xff36393B),),
                    defaultNewTextFormField(labelName: "رقم الشقة", labelStar: "*", hint: "ادخل رقم الشقة",labelTextColor: Color(0xff36393B),),
                    SizedBox(height: 30,)

                  ],
                ),
              ),


            ],
          ),
        ),
      );
    }, listener: (context,state){});
  }
}
