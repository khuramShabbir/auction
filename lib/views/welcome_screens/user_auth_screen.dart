import 'package:auction/controllers_providers/auth_provider.dart';
import 'package:auction/utils/const.dart';
import 'package:auction/views/user_credentials_screens/login_screen.dart';
import 'package:auction/views/user_credentials_screens/signup_screen.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
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
            body: StaticKPadding.kPadding(child:  Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CarouselSlider(
                  options: CarouselOptions(
                      height: height * .5,
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
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 25),
                            child: Text(textListHeadline[index],
                                style: StaticTextStyles.headingStyle),
                          ),
                          const SizedBox(height: 20),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 25),
                            child: Text(subTitleTextList[index],
                                style:
                                StaticTextStyles.normalGreyTextStyle),
                          ),
                          const SizedBox(height: 20),
                        ],
                      )),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    dots(
                        color: index == 0
                            ? StaticColors.orangeColor
                            : StaticColors.lightOrangeColor,
                        radius: index == 0 ? 5.0 : 3.0),
                    dots(
                        color: index == 1
                            ? StaticColors.orangeColor
                            : StaticColors.lightOrangeColor,
                        radius: index == 1 ? 5.0 : 3.0),
                    dots(
                        color: index == 2
                            ? StaticColors.orangeColor
                            : StaticColors.lightOrangeColor,
                        radius: index == 2 ? 5.0 : 3.0),
                  ],
                ),
                const SizedBox(height: 20),
                extendedButton(
                    onTap: () {
                      Get.to(() => const SignUpScreen());
                    },
                    buttonColor: StaticColors.blueColor,
                    buttonText: "Sign Up",
                    textColor: StaticColors.whiteColor),
                extendedButton(
                    onTap: () {
                      Get.to(() => const LoginScreen());
                    },
                    buttonText: "Login",
                    buttonColor: StaticColors.lightOrangeColor,
                    textColor: StaticColors.blackColor),
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

  Widget dots({required color, required radius}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 3),
      child: CircleAvatar(
        radius: radius,
        backgroundColor: color,
      ),
    );
  }
}
