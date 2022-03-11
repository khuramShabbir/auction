import 'dart:convert';

import 'package:auction/api_services.dart';
import 'package:auction/controllers_providers/auth_provider.dart';
import 'package:auction/models/auction/GetAllAuctions.dart';
import 'package:auction/models/wallet/WalletModel.dart';
import 'package:auction/utils/const.dart';
import 'package:auction/utils/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:auction/models/auction/GetAllAuctions.dart' as r;

AuctionProvider auctionProvider =
    Provider.of<AuctionProvider>(Get.context!, listen: false);

class AuctionProvider extends ChangeNotifier {
  GetAllAuctions? allAuctions;
  WalletModel? walletModel;
  double? walletAmount;
  String? nameOnCard;
  String cardNumber = "";
  String? expMonth;
  String? expDate;
  bool isAuctionLoaded = false;
  int carId=0;

  getAuction() async {
    String body = await ApiServices.simpleGet(ApiServices.GET_AUCTION);
    if (body.isEmpty) return;
    allAuctions = getAllAuctionsFromJson(body);
    isAuctionLoaded = true;
    notifyListeners();
  }

  getWallet(r.Result result) async {
    String body = await ApiServices.simplePost("${ApiServices.GET_WALLET}${getUser().result!.id.toString()}");
    if (body.isEmpty) {
      showToast(msg: "Some thing went wrong! please try again later");
      return;
    }

    walletModel = walletModelFromJson(body);
    walletAmount = walletModel!.result.amount;
    if (walletAmount! < 10) {
       CustomWidget.addWalletBottomSheet();
      return;
    }

  }

  // bidding() async {
  //
  //   String body = await ApiServices.simplePost(ApiServices.BIDDING);
  //   if(body.isEmpty){
  //     showToast(msg:"Some thingWent wrong! try again later");
  //
  //   } showToast(msg:"Bidding has been placed successfully.");
  //   logger.e(body);
  // }
}
