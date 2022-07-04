import 'package:carousel_indicator/carousel_indicator.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:user_new/business_logic_component/home_page/home_page_cubit.dart';
import 'package:user_new/constants/color.dart';
import 'package:user_new/data/models/city.dart';
import 'package:user_new/modelUi/carsoulUI.dart';
import 'package:user_new/modelUi/mainService.dart';
import 'package:user_new/screen/homePage/drawerScreen.dart';
import 'package:getwidget/getwidget.dart';

// الي فيها اختيار الخدمات
class HomeScreen extends StatelessWidget {

  final GlobalKey<ScaffoldState> scaffoldKey ;

   HomeScreen({required this.scaffoldKey}) ;
  final List<String> imageList = [
    "https://cdn.pixabay.com/photo/2017/12/03/18/04/christmas-balls-2995437_960_720.jpg",
    "https://cdn.pixabay.com/photo/2017/12/13/00/23/christmas-3015776_960_720.jpg",
    "https://cdn.pixabay.com/photo/2019/12/19/10/55/christmas-market-4705877_960_720.jpg",
    "https://cdn.pixabay.com/photo/2019/12/20/00/03/road-4707345_960_720.jpg",
    "https://cdn.pixabay.com/photo/2019/12/22/04/18/x-mas-4711785__340.jpg",
    "https://cdn.pixabay.com/photo/2016/11/22/07/09/spruce-1848543__340.jpg"
  ];
   @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
     print("$height");
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            width:width ,
            height: height*(90/height),
            padding: EdgeInsets.symmetric(horizontal: 10),
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
                // search on service
                Container(
                  alignment: Alignment.centerRight,
                  width: width*(259/width),
                  height: height*(39/height),
                  padding: EdgeInsets.only(bottom: 5,right: 10),

                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: TextFormField(
                      style: TextStyle(fontSize: 20,color: colorYellow),
                      cursorColor: colorBlue,
                      decoration: InputDecoration(
                        hintText: "ابحث باسم الخدمة",
                         hintStyle: TextStyle(
                           fontSize: 12,
                           color: const Color(0xff9194b7),
                           height: 0.8947368421052632,
                         ),
                        border: InputBorder.none
                      ),
                    ),
                  ),
                  color: const Color(0x45000000),
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
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SizedBox(height: 10,),
                // location & change Location
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'تغيير',
                      style: TextStyle(
                        fontSize: 18,
                        color: const Color(0xff182061),
                      ),
                      textHeightBehavior: TextHeightBehavior(applyHeightToFirstAscent: false),
                      textAlign: TextAlign.center,
                      softWrap: false,
                    ),
                  Row(children: [
                    // text for location
                    Text(
                      'المنزل',
                      style: TextStyle(
                        fontSize: 18,
                        color: const Color(0xff182061),
                      ),
                      textHeightBehavior: TextHeightBehavior(applyHeightToFirstAscent: false),
                      textAlign: TextAlign.center,
                      softWrap: false,
                    ),
                    SizedBox(width: 5,),
                    Image.asset("images/map pin.png",width: 13,height: 20,),
                  ],),

                ],),
                // text location Details
                Text(
                  'ميدان سفينكس , المعادي , القاهرة , مصر',
                  style: TextStyle(
                    fontSize: 15,
                    color: const Color(0xff737895),
                  ),
                  textHeightBehavior: TextHeightBehavior(applyHeightToFirstAscent: false),
                  textAlign: TextAlign.center,
                  softWrap: false,
                ),

                SizedBox(height: 20,),
                // اعلانات السوق
                ImageSlideshow(
                  width: double.infinity,
                  height: 108,
                  initialPage: 0,
                  indicatorColor: Colors.blue,
                  indicatorBackgroundColor: Colors.grey,
                  children: [
                    //todo list name is SlideImageList
                    ...SlideImageList2.map((e) {
                      return Container(
                        width: double.infinity,
                        height: 108,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(2),
                          color: Colors.yellow[300],

                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              width: width*(107/width),
                              height: height*(34/height),
                              child: Center(
                                child: Text(
                                  'تسوق الآن',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: const Color(0xffffffff),
                                    height: 1.0416666666666667,
                                  ),
                                  textHeightBehavior: TextHeightBehavior(applyHeightToFirstAscent: false),
                                  textAlign: TextAlign.center,
                                  softWrap: false,
                                ),
                              ),
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment(0.0, -1.0),
                                  end: Alignment(0.0, 1.0),
                                  colors: [const Color(0xff182061), const Color(0xff16267d)],
                                  stops: [0.0, 1.0],
                                ),
                                borderRadius: BorderRadius.circular(4.0),
                              ),
                            ),
                            Image.asset(e.Image,width: 80,height: 80,)


                        ],),
                      );
                    }).toList()

                  ],
                  onPageChanged: (value) {
                    print('Page changed: $value');
                  },
                  autoPlayInterval: 3000,
                  isLoop: true,
                ),
               SizedBox(height: 10,),
                // اعلانات
                GFItemsCarousel(
              itemHeight: 108,
              rowCount: 2,
              children:
              //todo list name is SlideImageList
              SlideImageList.map((e) {
                return Container(
                  margin: EdgeInsets.only(right: 10),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(e.Image),
                        fit: BoxFit.fill
                    ),
                  ),
                  width: width*(165/width),height: height*(108/height),);

              }).toList()
          ),


                // GridView => MainService
                GridView.count(
                  physics: NeverScrollableScrollPhysics(), // to disable GridView's scrolling
                  shrinkWrap: true,
                  crossAxisCount: 3,mainAxisSpacing: 5,childAspectRatio: 1,crossAxisSpacing: 5,children: [
                  ...mainServiceUIList.map((e){
                    return  Container(
                     height: 108,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                        Image.asset("${e.image}",width: 50,height: 32,),
                        SizedBox(height: 5,),
                        Text(e.name)
                      ],),
                      decoration: BoxDecoration(
                        color: const Color(0xffffffff),
                        borderRadius: BorderRadius.circular(4.0),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0x0f000000),
                            offset: Offset(0, 0),
                            blurRadius: 10,
                          ),
                        ],
                      ),
                    );
                  })

                ],),





            ],),
          ),
        ],
      ),
    );
  }
}
