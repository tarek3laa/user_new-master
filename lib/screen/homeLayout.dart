import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_new/bloc/cubit.dart';
import 'package:user_new/bloc/state.dart';
import 'package:user_new/screen/homePage/drawerScreen.dart';

import '../business_logic_component/home_page/home_page_cubit.dart';
import '../data/models/services/main_services.dart';
import '../data/models/slider.dart';
import 'homePage/home.dart';
import 'homePage/order.dart';
import 'homePage/wallet.dart';

class HomeLayout extends StatefulWidget {
  final session;

  HomeLayout({Key? key, required this.session}) : super(key: key);

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  HomePageCubit homePageCubit = HomePageCubit();

  @override
  void initState() {
    homePageCubit.getAllSliders();
    homePageCubit.getAllMainServices();
  }

  List<HomePageSlider> sliders = [];
  List<MainService> mainServices = [];

  @override
  Widget build(BuildContext context) {
    print(widget.session.token);
    return BlocConsumer<AppCubit, AppState>(builder: (context, state) {
      AppCubit cubit = BlocProvider.of(context);
      var scaffoldKey = GlobalKey<ScaffoldState>();
      List<Widget> bodyScreen = [
        WalletScreen(scaffoldKey: scaffoldKey),
        OrderScreen(),
        HomeScreen(scaffoldKey: scaffoldKey),
        HomeScreen(scaffoldKey: scaffoldKey),
        HomeScreen(scaffoldKey: scaffoldKey),
      ];

      return WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: Scaffold(
          key: scaffoldKey,
          endDrawer: DrawerScreen(),
          backgroundColor: Color(0xffF3F4F6),
          bottomNavigationBar: buildBlocBuilderBottomNavBar(),
          body: bodyScreen[cubit.indexBottomNavBar],
        ),
      );
    }, listener: (context, state) {
      if (state is DataStateChanged) {
        var dataState = state.state;
        if (dataState is SliderLoaded) {
          sliders = dataState.sliders;
        }
        if (dataState is MainServicesLoaded) {
          mainServices = dataState.mainServices;
          print(mainServices[0].description);
        }
      }
    });
  }

  // bottom Nav Bar
  BlocBuilder<AppCubit, AppState> buildBlocBuilderBottomNavBar() {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        AppCubit cubit = BlocProvider.of(context);
        return ConvexAppBar(
          style: TabStyle.fixed,

          height: 70,
          curveSize: 0,
          //  top: -150,
          backgroundColor: Color(0xffF3BA35),

          activeColor: Color(0xff182061),
          color: Color(0xff68551A),

          items: [
            TabItem(
                icon: ImageIcon(
                  AssetImage("images/ic-shopping-wallet.png"),
                  color: cubit.indexBottomNavBar == 0
                      ? Color(0xff182061)
                      : Color(0xff68551A),
                ),
                title: '??????????????'),
            TabItem(
                icon: ImageIcon(
                  AssetImage("images/inbox.png"),
                  color: cubit.indexBottomNavBar == 1
                      ? Color(0xff182061)
                      : Color(0xff68551A),
                ),
                title: '??????????????'),
            TabItem(
                icon: CircleAvatar(
                  radius: 50,
                  child: Image.asset(
                    "images/Layer 1.png",
                    width: 30,
                    height: 30,
                  ),
                  backgroundColor: Color(0xff182061),
                ),
                title: '????????????????'),
            TabItem(
                icon: ImageIcon(AssetImage("images/Subtraction 11.png"),
                    color: cubit.indexBottomNavBar == 3
                        ? Color(0xff182061)
                        : Color(0xff68551A)),
                title: '????????????'),
            TabItem(
                icon: ImageIcon(
                  AssetImage("images/home.png"),
                  color: cubit.indexBottomNavBar == 4
                      ? Color(0xff182061)
                      : Color(0xff68551A),
                ),
                title: '????????????????'),
          ],
          initialActiveIndex: cubit.indexBottomNavBar,
          //optional, default as 0
          onTap: (int i) {
            cubit.changeIndexBottomNavBar(i);
          },
        );
      },
    );
  }
}
