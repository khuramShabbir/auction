import 'package:auction/controllers_providers/Auth/auth_provider.dart';
import 'package:auction/controllers_providers/Wallet/wallet_provider.dart';
import 'package:auction/utils/const.dart';
import 'package:auction/views/coupon/CouponRevealScreen.dart';
import 'package:auction/views/home/bottom_nav_bar_screens/profile_settings/profile_editting_screen.dart';
import 'package:auction/views/home/bottom_nav_bar_screens/wallet_screen.dart';
import 'package:auction/views/wallet/wallet.dart';
import 'package:auction/views/welcome_screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class ProfileSettingScreen extends StatefulWidget {
  const ProfileSettingScreen({Key? key}) : super(key: key);

  @override
  _ProfileSettingScreenState createState() => _ProfileSettingScreenState();
}

class _ProfileSettingScreenState extends State<ProfileSettingScreen> {
  @override
  void initState() {
    walletProvider.getWallet();
    walletProvider.getWalletHistory();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Settings",
            style: TextStyle(color: Colors.black),
          ),
          actions: [
            Consumer<WalletProvider>(builder: (builder, data, child) {
              return Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Row(
                    children: [
                      StaticAssets.walletSvg,
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        data.walletModel == null
                            ? "0 SAR"
                            : "${double.parse(data.walletModel!.result.amount.toString()).toInt()} SAR",
                        style: TextStyle(color: Colors.black),
                      )
                    ],
                  ));
            })
          ],
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        body: StaticKPadding.kPadding(
            child: SingleChildScrollView(
              child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
              profileModules(
                  onTap: () {
                    setState(() {
                      Get.to(() => const ProfileEditingScreen());
                    });
                  },
                  title: 'Profile',
                  leading: SvgPicture.asset('assets/SvgAssets/Profile.svg',
                      color: AppColors.blackColor)),
              profileModules(
                  onTap: () {},
                  title: 'Notifications',
                  leading: SvgPicture.asset('assets/SvgAssets/notification.svg',
                      color: AppColors.blackColor)),
              profileModules(
                  onTap: () {
                    Get.to(const WalletScreen());
                  },
                  title: 'Your wallet',
                  leading: SvgPicture.asset('assets/SvgAssets/Wallet.svg',
                      color: AppColors.blackColor)),
              profileModules(
                  onTap: () {
                    Get.to(const CouponRevealScreen());
                  },
                  title: 'Your Coupons',
                  leading: SvgPicture.asset('assets/SvgAssets/coupon_icon.svg',
                      color: AppColors.blackColor)),
              profileModules(
                onTap: () {},
                title: 'Login Setting',
                leading: SvgPicture.asset('assets/SvgAssets/loginSetting.svg',
                    color: AppColors.blackColor),
              ),
              profileModules(
                  onTap: () {},
                  title: 'Service Centre',
                  leading: SvgPicture.asset('assets/SvgAssets/callServices.svg',
                      color: AppColors.blackColor)),
              WhiteSpacer.verticalSpace(20),
              InkWell(
                onTap: () async {
                  await boxStorage.erase();

                  Get.offAll(const SplashScreen());
                },
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: SvgPicture.asset(
                      'assets/SvgAssets/logOut.svg',
                      color: AppColors.blackColor,
                    ),
                  ),
                  width: 55,
                  height: 55,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: AppColors.whiteColor,
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 10,
                            spreadRadius: 1,
                            color: AppColors.greyColor.withOpacity(.1))
                      ]),
                ),
              ),
              WhiteSpacer.verticalSpace(20),
              Text(
                "Log Out",
                style: AppTextStyles.subTitleStyleBlack,
              )
          ],
        ),
            )),
      ),
    );
  }

  Widget profileModules(
      {required leading, required String title, required onTap}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: InkWell(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(50)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 55,
                width: 55,
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: leading,
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: AppColors.whiteColor,
                    boxShadow: [
                      BoxShadow(
                          color: AppColors.greyColor.withOpacity(.1),
                          blurRadius: 10,
                          spreadRadius: 1)
                    ]),
              ),
              WhiteSpacer.horizontalSpace(30),
              Text(title, style: AppTextStyles.subTitleStyleBlack),
              const Expanded(child: SizedBox()),
              const Icon(Icons.keyboard_arrow_right)
            ],
          ),
        ),
      ),
    );
  }
}
