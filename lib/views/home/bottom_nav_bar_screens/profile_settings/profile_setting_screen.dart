import 'package:auction/controllers_providers/auth_provider.dart';
import 'package:auction/utils/const.dart';
import 'package:auction/utils/widgets.dart';
import 'package:auction/views/home/bottom_nav_bar_screens/profile_settings/profile_editting_screen.dart';
import 'package:auction/views/welcome_screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ProfileSettingScreen extends StatefulWidget {
  const ProfileSettingScreen({Key? key}) : super(key: key);

  @override
  _ProfileSettingScreenState createState() => _ProfileSettingScreenState();
}

class _ProfileSettingScreenState extends State<ProfileSettingScreen> {


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar.appBar(title: "Settings"),
        body: StaticKPadding.kPadding(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                profileModules(
                    onTap: () {setState(() {
                     Get.to(()=>const ProfileEditingScreen());
                    });},
                    title: 'Profile',
                    leading: SvgPicture.asset('assets/SvgAssets/Profile.svg',
                        color: StaticColors.blackColor)),
                profileModules(
                    onTap: () {},
                    title: 'Notifications',
                    leading: SvgPicture.asset('assets/SvgAssets/notification.svg',
                        color: StaticColors.blackColor)),
                profileModules(
                    onTap: () {},
                    title: 'Your wallet',
                    leading: SvgPicture.asset('assets/SvgAssets/Wallet.svg',
                        color: StaticColors.blackColor)),
                profileModules(
                  onTap: () {},
                  title: 'Login Setting',
                  leading: SvgPicture.asset('assets/SvgAssets/loginSetting.svg',
                      color: StaticColors.blackColor),
                ),
                profileModules(
                    onTap: () {},
                    title: 'Service Centre',
                    leading: SvgPicture.asset('assets/SvgAssets/callServices.svg',
                        color: StaticColors.blackColor)),
                WhiteSpacer.verticalSpace(20),
                InkWell(
                  onTap: ()async {
                    await boxStorage.erase();

                    Get.offAll(const SplashScreen());
                  },
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: SvgPicture.asset(
                        'assets/SvgAssets/logOut.svg',
                        color: StaticColors.blackColor,
                      ),
                    ),
                    width: 55,
                    height: 55,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: StaticColors.whiteColor,
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 10,
                              spreadRadius: 1,
                              color: StaticColors.greyColor.withOpacity(.1))
                        ]),
                  ),
                ),
                WhiteSpacer.verticalSpace(20),
                Text(
                  "Log Out",
                  style: StaticTextStyles.subTitleStyleBlack,
                )
              ],
            )
            ),
      ),
    );
  }


}


