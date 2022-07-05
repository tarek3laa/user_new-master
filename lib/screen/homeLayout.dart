import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_new/bloc/cubit.dart';
import 'package:user_new/bloc/state.dart';
import 'package:user_new/screen/homePage/drawerScreen.dart';

import 'homePage/home.dart';
import 'homePage/order.dart';
import 'homePage/wallet.dart';

class HomeLayout extends StatelessWidget {
  final session;

  const HomeLayout({Key? key, required this.session}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(session.token);
    return BlocConsumer<AppCubit, AppState>(
        builder: (context, state) {
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
        },
        listener: (context, state) {});
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
                title: 'المحفظة'),
            TabItem(
                icon: ImageIcon(
                  AssetImage("images/inbox.png"),
                  color: cubit.indexBottomNavBar == 1
                      ? Color(0xff182061)
                      : Color(0xff68551A),
                ),
                title: 'الطلبات'),
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
                title: 'المحادثة'),
            TabItem(
                icon: ImageIcon(AssetImage("images/Subtraction 11.png"),
                    color: cubit.indexBottomNavBar == 3
                        ? Color(0xff182061)
                        : Color(0xff68551A)),
                title: 'العروض'),
            TabItem(
                icon: ImageIcon(
                  AssetImage("images/home.png"),
                  color: cubit.indexBottomNavBar == 4
                      ? Color(0xff182061)
                      : Color(0xff68551A),
                ),
                title: 'الرئيسية'),
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
