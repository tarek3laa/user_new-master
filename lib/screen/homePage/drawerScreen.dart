import 'package:flutter/material.dart';
class DrawerScreen extends StatelessWidget {
   DrawerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Drawer(
      backgroundColor: Color(0xffF3F4F6),
      child: SingleChildScrollView(
        child: Column(
          children: [
            // just logo don't care about it
            Container(
              width: double.infinity,
              height: height*(134/height),
              padding: EdgeInsets.all(20),
              child: Image.asset("images/Layer 2.png",width:width*(106/width) ,height: height*(94/height),),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment(0.788, 0.141),
                  end: Alignment(-0.805, 0.175),
                  colors: [const Color(0xff182061), const Color(0xff16267d)],
                  stops: [0.0, 1.0],
                ),
              ),
            ),
            SizedBox(height: 10,),
            buildDrawerComponnet(width, height,"حسابي","images/Icon_user.png"),
            SizedBox(height: 10,),
            buildDrawerComponnet(width, height,"سوق فكسو","images/Icon_user.png"),
            SizedBox(height: 10,),
            buildDrawerComponnet(width, height,"العناوين المحفوظة","images/Icon awesome-map-marker-alt.png"),
            SizedBox(height: 10,),
            buildDrawerComponnet(width, height,"الدعم والمساندة","images/Icon awesome-headphones.png"),
            SizedBox(height: 10,),
            buildDrawerComponnet(width, height,"من نحن","images/Icon_attention_circle.png"),
            SizedBox(height: 10,),
            buildDrawerComponnet(width, height,"اتفاقية المستخدم","images/Icon awesome-handshake.png"),
            SizedBox(height: 10,),
            buildDrawerComponnet(width, height,"شارك وإكسب رصيد","images/Icon awesome-share-alt.png"),
            SizedBox(height: 10,),
            buildDrawerComponnet(width, height,"سجل كمزود خدمة","images/Icon awesome-user-tie.png"),

            SizedBox(height: 10,),
            buildDrawerComponnet(width, height,"سجل كتاجر","images/Icon awesome-user-tag.png"),


          ],
        ),
      ),
    );
  }

  Widget buildDrawerComponnet(double width, double height,String name ,String image) {
    return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: width*(239/width),
              height: height*(43/height),
              alignment: Alignment.centerRight,
               padding: EdgeInsets.only(right: 10),
              child: Text(
              name,
              style: TextStyle(
    fontSize: 16,
    color: const Color(0xff182061),
    ),
    textAlign: TextAlign.center,
    softWrap: false,
    ),
              decoration: BoxDecoration(
                color: const Color(0xffffffff),
                borderRadius: BorderRadius.circular(8.0),
                border: Border.all(width: 1.0, color: const Color(0xffffffff)),
              ),
            ),
            SizedBox(width: 10,),
            Container(
              width: width*(43/width),
              height: height*(43/height),
              child: IconButton(icon: Image.asset(image),onPressed: (){},),
              decoration: BoxDecoration(
                color: const Color(0xffffffff),
                borderRadius: BorderRadius.circular(8.0),
                border: Border.all(width: 1.0, color: const Color(0xffffffff)),
              ),
            )
          ],
        );
  }
}
