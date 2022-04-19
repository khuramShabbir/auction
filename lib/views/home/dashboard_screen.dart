import 'package:auction/controllers_providers/Dashboard/dashboard_provider.dart';
import 'package:auction/utils/const.dart';
import 'package:auction/views/home/bottom_nav_bar_screens/home_screen.dart';
import 'package:auction/views/home/bottom_nav_bar_screens/my_cars_screens.dart';
import 'package:auction/views/home/bottom_nav_bar_screens/profile_settings/profile_setting_screen.dart';

import 'package:auction/views/home/bottom_nav_bar_screens/wallet_screen.dart';
import 'package:auction/views/wallet/wallet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'bottom_nav_bar_screens/all_cars_screen.dart';


PersistentTabController persistentTabController =
    PersistentTabController(initialIndex: 0);

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({Key? key}) : super(key: key);

  @override
  _DashBoardScreenState createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  int? index = 0;

  List<PersistentBottomNavBarItem> itemList() {
    return [


      PersistentBottomNavBarItem(
        activeColorPrimary: AppColors.whiteColor,
        activeColorSecondary: AppColors.blackColor,
        inactiveColorPrimary: AppColors.blueColor,
        icon: SvgPicture.asset(
          'assets/SvgAssets/Home.svg',
          color: index == 0 ? AppColors.blueColor : null,
        ),
        title: "Home",
      ),
      PersistentBottomNavBarItem(
        activeColorPrimary: AppColors.whiteColor,
        activeColorSecondary: AppColors.blackColor,
        icon: SvgPicture.asset(
          'assets/SvgAssets/Search.svg',
          color: index == 1 ? AppColors.blueColor : null,
        ),
        title: "Search",
      ),
      PersistentBottomNavBarItem(
        activeColorPrimary: AppColors.whiteColor,
        activeColorSecondary: AppColors.blackColor,
        icon: SvgPicture.asset(
          'assets/SvgAssets/Paper.svg',
          color: index == 2 ? AppColors.blueColor : null,
        ),
        title: "My Cars",
      ),
      PersistentBottomNavBarItem(
        activeColorPrimary: AppColors.whiteColor,
        activeColorSecondary: AppColors.blackColor,
        icon: SvgPicture.asset(
          'assets/SvgAssets/Wallet.svg',
          color: index == 3 ? AppColors.blueColor : null,
        ),
        title: "Wallet",
      ),
      PersistentBottomNavBarItem(
        activeColorPrimary: AppColors.whiteColor,
        activeColorSecondary: AppColors.blackColor,
        icon: SvgPicture.asset(
          'assets/SvgAssets/Profile.svg',
          color: index == 4 ? AppColors.blueColor : null,
        ),
        title: "Profile",
      ),


    ];
  }

  List<Widget> listScreen() {
    return [
       HomeScreen(),
       AllCarsScreen(false),
       MyCarsScreen(),
        UserWallet(),
       // WalletScreen(),
       ProfileSettingScreen(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<DashBoardProvider>(
      builder: (BuildContext context, value, Widget? child) {
        return PersistentTabView(
          context,
          controller: persistentTabController,
          screens: listScreen(),
          items: itemList(),
          selectedTabScreenContext: (context) {

            },
          confineInSafeArea: true,
          backgroundColor: Colors.white,
          handleAndroidBackButtonPress: true,
          resizeToAvoidBottomInset: true,
          stateManagement: true,
          onItemSelected: (index) {
            this.index = index;
            setState(() {});
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
}
