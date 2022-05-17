import 'package:auction/FCM.dart';
import 'package:auction/controllers_providers/Dashboard/dashboard_provider.dart';
import 'package:auction/utils/const.dart';
import 'package:auction/views/home/bottom_nav_bar_screens/home_screen.dart';
import 'package:auction/views/home/bottom_nav_bar_screens/my_cars_screens.dart';
import 'package:auction/views/home/bottom_nav_bar_screens/profile_settings/profile_setting_screen.dart';
import 'package:auction/views/home/shopping_cart_screen.dart';
import 'package:auction/views/wallet/wallet.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'bottom_nav_bar_screens/all_cars_screen.dart';
import 'package:get/get.dart';


PersistentTabController persistentTabController =
    PersistentTabController(initialIndex: 0);

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({Key? key}) : super(key: key);

  @override
  _DashBoardScreenState createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {

  List<PersistentBottomNavBarItem> itemList() {
    return [


      PersistentBottomNavBarItem(
        activeColorPrimary: AppColors.whiteColor,
        activeColorSecondary: AppColors.blackColor,
        inactiveColorPrimary: AppColors.blueColor,
        icon: SvgPicture.asset(
          'assets/SvgAssets/Home.svg',
          color: dashBoardProvider.index == 0 ? AppColors.blueColor : null,
        ),
        title: "Home",
      ),
      PersistentBottomNavBarItem(
        activeColorPrimary: AppColors.whiteColor,
        activeColorSecondary: AppColors.blackColor,
        icon: SvgPicture.asset(
          'assets/SvgAssets/Search.svg',
          color: dashBoardProvider.index == 1 ? AppColors.blueColor : null,
        ),
        title: "Search",
      ),
      PersistentBottomNavBarItem(
        activeColorPrimary: AppColors.whiteColor,
        activeColorSecondary: AppColors.blackColor,
        icon: SvgPicture.asset(
          'assets/SvgAssets/Paper.svg',
          color: dashBoardProvider.index == 2 ? AppColors.blueColor : null,
        ),
        title: "My Cars",
      ),
      PersistentBottomNavBarItem(
        activeColorPrimary: AppColors.whiteColor,
        activeColorSecondary: AppColors.blackColor,
        icon: SvgPicture.asset(
          'assets/SvgAssets/Wallet.svg',
          color: dashBoardProvider.index == 3 ? AppColors.blueColor : null,
        ),
        title: "Wallet",
      ),
      PersistentBottomNavBarItem(
        activeColorPrimary: AppColors.whiteColor,
        activeColorSecondary: AppColors.blackColor,
        icon: SvgPicture.asset(
          'assets/SvgAssets/Profile.svg',
          color: dashBoardProvider.index == 4 ? AppColors.blueColor : null,
        ),
        title: "Profile",
      ),


    ];
  }
  List <Widget> listScreen = [
      HomeScreen(),
      AllCarsScreen(false),
      MyCarsScreen(),
      UserWallet(),
      ProfileSettingScreen(),
      ShoppingCartScreen(),
    ];

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    FCM();
  }
  @override
  Widget build(BuildContext contexts) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context,constraints) {
          return Consumer<DashBoardProvider>(
            builder: (BuildContext context, value, Widget? child) {
              return context.height > 600 && kIsWeb ?
               SizedBox(

                 height: height,
                 width: width,
                 child: listScreen[value.index!],
               )
                  :
              PersistentTabView(
                context,
                controller: persistentTabController,
                screens: listScreen,
                items: itemList(),
                selectedTabScreenContext: (context) {

                },
                confineInSafeArea: true,
                backgroundColor: Colors.white,
                handleAndroidBackButtonPress: true,
                resizeToAvoidBottomInset: true,
                stateManagement: true,
                onItemSelected: (index) {
                  value.index = index;
                 value.notifyListeners();
                },
                hideNavigationBarWhenKeyboardShows: true,
                decoration: NavBarDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  colorBehindNavBar: Colors.white,
                ),
                popAllScreensOnTapOfSelectedTab: true,
                popActionScreens: PopActionScreensType.all,
                itemAnimationProperties: const ItemAnimationProperties(
                  duration: Duration(milliseconds: 500),
                  curve: Curves.ease,
                ),
                screenTransitionAnimation: const ScreenTransitionAnimation(
                  animateTabTransition: true,
                  curve: Curves.ease,
                  duration: Duration(milliseconds: 500),
                ),
                navBarStyle: NavBarStyle
                    .style7,
              );
            },
          );
        }
      ),
    );
  }
}
