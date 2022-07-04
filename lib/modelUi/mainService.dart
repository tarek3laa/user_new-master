import 'package:user_new/data/models/services/main_services.dart';

class MainServiceUi {
 final String id;
 final String name;
 final String image;

  MainServiceUi({required this.name,required this.image,required this.id});

}
List<MainServiceUi> mainServiceUIList = [
 MainServiceUi(name: "تكييف", image: "images/XMLID_124_.png", id: "m1"),
 MainServiceUi(name: "كهرباء", image: "images/electric-danger-sign.png", id: "m2"),
 MainServiceUi(name: "السباكة", image: "images/plumber.png", id: "m3"),
 MainServiceUi(name: "نقاش", image: "images/paint-roller.png", id: "m4"),
 MainServiceUi(name: "مقاول", image: "images/electrician.png", id: "m5"),
 MainServiceUi(name: "نجارة", image: "images/screwdriver (1).png", id: "m6"),
 MainServiceUi(name: "كهرباء", image: "images/electric-danger-sign.png", id: "m7"),
 MainServiceUi(name: "غسالات", image: "images/washing-machine.png", id: "m8"),
 MainServiceUi(name: "تنظيف", image: "images/mop.png", id: "m9"),

];
