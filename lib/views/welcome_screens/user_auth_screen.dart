import 'package:auction/controllers_providers/auth_provider.dart';
import 'package:auction/utils/const.dart';
import 'package:auction/views/user_credentials_screens/login_screen.dart';
import 'package:auction/views/user_credentials_screens/signup_screen.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import '../../utils/const.dart';
import '../../utils/widgets.dart';

class UserAuthScreen extends StatefulWidget {
  const UserAuthScreen({Key? key}) : super(key: key);

  @override
  State<UserAuthScreen> createState() => _UserAuthScreenState();
}

class _UserAuthScreenState extends State<UserAuthScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (BuildContext context, data, Widget? child) {
        return SafeArea(
          child: Scaffold(
            body: StaticKPadding.kPadding(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
              Expanded(
                child: Column(children: [
                  Expanded(
                    child: CarouselSlider(
                      options: CarouselOptions(
                          height: height * .7,
                          viewportFraction: 1,
                          onPageChanged:
                              (int index, CarouselPageChangedReason reason) {
                            this.index = index;
                            setState(() {});
                          }),
                      items: List.generate(
                          textListHeadline.length,
                              (index) => Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              SvgPicture.asset(svgAssetsList[index]),
                              Padding(
                                padding:
                                const EdgeInsets.symmetric(horizontal: 25),
                                child: Text(textListHeadline[index],
                                    style: AppTextStyles.headingStyle),
                              ),
                              const SizedBox(height: 20),
                              Padding(
                                padding:
                                const EdgeInsets.symmetric(horizontal: 25),
                                child: Text(subTitleTextList[index],
                                    style:
                                    AppTextStyles.normalGreyTextStyle),
                              ),
                              const SizedBox(height: 20),
                            ],
                          )),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      dots(
                          color: index == 0
                              ? AppColors.blueColor
                              : AppColors.lightOrangeColor,
                          radius: index == 0 ? 5.0 : 3.0),
                      dots(
                          color: index == 1
                              ? AppColors.blueColor
                              : AppColors.lightOrangeColor,
                          radius: index == 1 ? 5.0 : 3.0),
                      dots(
                          color: index == 2
                              ? AppColors.blueColor
                              : AppColors.lightOrangeColor,
                          radius: index == 2 ? 5.0 : 3.0),
                    ],
                  ),

                ],),
              ),
                extendedButton(
                    onTap: () {
                      Get.to(() => const SignUpScreen());
                    },
                    buttonColor: AppColors.blueColor,
                    buttonText: "Sign Up",
                    textColor: AppColors.whiteColor),
                extendedButton(
                    onTap: () {
                      Get.to(() => const LoginScreen());
                    },
                    buttonText: "Login",
                    buttonColor: AppColors.orangeColor,
                    textColor: AppColors.whiteColor),
              ],
            )),
          ),
        );
      },
    );
  }

  int index = 0;

  List<String> textListHeadline = [
    "Gain total Control of your money",
    "Know where your money goes",
    "Planning ahead",
  ];

  List<String> subTitleTextList = [
    "Become Your Own Money Manager and make every cent count",
    "Track your transaction easily with categories and financial report",
    "Setup your budget for each category so you in control",
  ];

  List<String> svgAssetsList = [
    "assets/SvgAssets/Car finance.svg",
    "assets/SvgAssets/Vehicle Sale-cuate.svg",
    "assets/SvgAssets/Online ads-pana.svg"
  ];

  Widget dots({required color, required radius}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 3),
      child: Container(
        width: 15,
        height: 15,
        decoration: BoxDecoration(
            border: Border.all(color: AppColors.orangeColor, width: 3),
            borderRadius: BorderRadius.circular(100)),
        child: CircleAvatar(
          radius: radius,
          backgroundColor: color,
        ),
      ),
    );
  }
}
