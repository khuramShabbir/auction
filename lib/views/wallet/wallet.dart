import 'package:auction/controllers_providers/Dashboard/dashboard_provider.dart';
import 'package:auction/controllers_providers/Wallet/wallet_provider.dart';
import 'package:auction/utils/const.dart';
import 'package:auction/views/home/bottom_nav_bar_screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:math' as math;
import 'package:provider/provider.dart';

var walletProvider=Provider.of<WalletProvider>(Get.context!,listen: false);

class UserWallet extends StatefulWidget {
  const UserWallet({Key? key}) : super(key: key);

  @override
  State<UserWallet> createState() => _UserWalletState();
}

class _UserWalletState extends State<UserWallet> {


  @override
  void initState() {
    if(getUser()!=null){
    walletProvider.getWallet();
    walletProvider.getWalletHistory();
    }
    super.initState();

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: getAppBar("Wallet",isLeadingRequired: false),
      body: SizedBox(
        width: Get.width,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Consumer<WalletProvider>(builder: (context, data, child) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                Text(
                  'Your Wallet'.tr,
                  style: const TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w500,
                      fontSize: 17),
                ),
                const SizedBox(height: 20),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("SAR".tr,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: Get.height * 0.04)),
                    const SizedBox(width: 5),
                    Text(data.walletModel!=null? "${double.parse(data.walletModel!.result.amount.toString()).toInt()}":"0",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: Get.height * .08,
                            fontWeight: FontWeight.w900)),
                  ],
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Text(
                        "Transactions".tr,
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: Get.height * 0.025),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: data.getWalletHistoryResponse==null ? 0 : data.getWalletHistoryResponse!.result!.length,
                    itemBuilder: (BuildContext context, int index) {
                      var result = data.getWalletHistoryResponse!.result![index];

                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15.0),
                        child: Row(
                          children: [
                            Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                  color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("${result.reference}", style: const TextStyle(color: Colors.black,fontWeight: FontWeight.w500,fontSize: 17)),
                                  Text("${result.paymentDate}",style: TextStyle(color: Colors.grey))
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text("${result.status}",
                                      style: TextStyle(color: AppColors.blueColor,fontWeight: FontWeight.w500,fontSize: 17)),
                                  Text("SAR ${result.amountPaid}",
                                      style:
                                      const TextStyle(fontWeight: FontWeight.bold,color: Colors.black))
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                )

              ],
            );
          }),
        ),
      ),
    );
  }
}
