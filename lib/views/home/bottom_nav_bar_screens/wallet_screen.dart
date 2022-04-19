import 'package:auction/utils/const.dart';
import 'package:auction/utils/widgets.dart';
import 'package:auction/views/home/bottom_nav_bar_screens/add_payment_method_screen.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({Key? key}) : super(key: key);

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("PAYMENT METHOD",style: TextStyle(color: Colors.black),),elevation: 0,backgroundColor: Colors.white ,leading: InkWell(
          onTap: (){
            Get.back();
          },
          child: Icon(Icons.arrow_back,color: Colors.black,)),),
      // appBar: CustomAppBar.appBar(title: 'PAYMENT METHOD'),
      body: SizedBox(
        height: height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CarouselSlider(
              options: CarouselOptions(
                  initialPage: index,
                  height: height * .22,
                  aspectRatio: 0,
                  onPageChanged: (int index, reason) {
                    this.index = index;
                    setState(() {});
                  }),
              items: List.generate(
                  3,
                  (index) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(20),
                              image: const DecorationImage(
                                image: NetworkImage('https://www.cimbanque.com'
                                    '/cim/'
                                    'images/'
                                    'cards/'
                                    'mastercard/'
                                    'mastercard-'
                                    'gold-350.png'),
                                fit: BoxFit.fill,
                              )),
                        ),
                      )),
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Container(
                  height: 8,
                  width: 8,
                  decoration: BoxDecoration(
                      color: index == 0
                          ? AppColors.blueColor
                          : AppColors.whiteColor,
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(
                          color: index == 0
                              ? AppColors.blueColor
                              : AppColors.greyColor)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Container(
                  height: 8,
                  width: 8,
                  decoration: BoxDecoration(
                      color: index == 1
                          ? AppColors.blueColor
                          : AppColors.whiteColor,
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(
                          color: index == 1
                              ? AppColors.blueColor
                              : AppColors.greyColor)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Container(
                  height: 8,
                  width: 8,
                  decoration: BoxDecoration(
                      color: index == 2
                          ? AppColors.blueColor
                          : AppColors.whiteColor,
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(
                          color: index == 2
                              ? AppColors.blueColor
                              : AppColors.greyColor)),
                ),
              ),
            ]),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 10),
              child: Column(
                children: [
                  customTextFormField(hintText: "Name on Card"),
                  customTextFormField(hintText: "Card Number"),
                  Row(
                    children: [
                      Expanded(
                          child: customTextFormField(hintText: "Exp Month")),
                      const SizedBox(width: 10),
                      Expanded(child: customTextFormField(hintText: "Exp Date"))
                    ],
                  ),
                  customTextFormField(hintText: ""),
                  extendedButton(
                      onTap: () {
                        Get.to(() => const AddPaymentMethodScreen());
                      },
                      buttonColor: AppColors.blueColor,
                      textColor: AppColors.whiteColor,
                      buttonText: "Add Card")
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
