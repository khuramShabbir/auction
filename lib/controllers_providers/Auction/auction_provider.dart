import 'dart:io';

import 'package:auction/ApiServices/api_services.dart';
import 'package:auction/controllers_providers/Auth/auth_provider.dart';

import 'package:auction/models/BankAccountModel/bank_account_model.dart';
import 'package:auction/models/GetPaymentEvidenceModel/get_payment_evidence_model.dart';
import 'package:auction/models/GetPaymentEvidenceModel/post_evidence-model.dart';
import 'package:auction/models/auction/GetAllAuctions.dart';
import 'package:auction/models/auction/auction_by_user.dart';
import 'package:auction/models/wallet/WalletModel.dart';
import 'package:auction/utils/const.dart';
import 'package:auction/utils/widgets.dart';
import 'package:auction/models/auction/auction_by_user.dart' as user_auction;

import 'package:auction/views/home/create_campaign_Screens/payment_complete_screen.dart';
import 'package:auction/views/home/create_campaign_Screens/sold_car_detail_screen.dart';
import 'package:auction/views/payment_method_screens/web_view_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:auction/models/auction/GetAllAuctions.dart' as r;

AuctionProvider auctionProvider = Provider . of < AuctionProvider > (Get.context!, listen: false);

class AuctionProvider extends ChangeNotifier {
  GetAllAuctions? allAuctions;
  WalletModel? walletModel;
  BankAccountModel? bankAccount;
  AuctionByUserModel? auctionByUser;
  GetPaymentEvidenceModel? getPaymentEvidenceModel;
  PostPaymentEvidenceModel? paymentEvidence;
  double? walletAmount;
  String? nameOnCard;
  String cardNumber = "";
  String? expMonth;
  String? expDate;
  XFile? xFile;
  bool isAuctionLoaded = false;
  bool isAuctionByUserLoaded = false;
  bool isBankDetailLoaded = false;
  static TextEditingController biddingController = TextEditingController();
  getAuction() async {
    logger.e("${ApiServices.GET_AUCTION}?userId=${getUser().result!.id}");
    String body = await ApiServices.simpleGet("${ApiServices.GET_AUCTION}?userId=${getUser().result!.id}");
    if (body.isEmpty) return;
    allAuctions = getAllAuctionsFromJson(body);
    isAuctionLoaded=false;
    notifyListeners();
    isAuctionLoaded = true;
    notifyListeners();
  }
  getWallet(r.Result? result) async {
    if(result!.alreadyBid){
      payBid(result);
    }
    else {
    String body = await ApiServices.simplePost(
        "${ApiServices.GET_WALLET}${getUser().result!.id.toString()}");
    if (body.isEmpty) {
      showToast(msg: "Some thing went wrong! please try again later");
      return;
    }
    walletModel = walletModelFromJson(body);
    walletAmount = walletModel!.result.amount;
    if (result.downPayment == 0) {
      showToast(msg: "Can't be bid at this car");
      return;
    }
    else if (walletAmount! >= result.downPayment) {

        payBid(result);
      //biddingAmountBottomSheet(result);
      return;
    }
    var resultBool= await Get.to(() => PaymentWebView(initUrl: "https://auction.cp.deeps.info/Home/Payment?userId=${getUser().result!.id}&amount=${double.parse((double.parse(result.downPayment.toString())*100).toString()).toInt()}"));
    if(resultBool==true){
      payBid(result);
    }
    }
  }
  void payBid(r.Result result) async {
    biddingController.text=(double.parse(result.bidding.biddingAmount.toString()) + double.parse(result.bidIncrement.toString())).toString();
    String body = await ApiServices.simplePost("Bidding/Bid?userId=${getUser().result!.id}&carId=${result.carInformationId}&amount=${biddingController.text}&lastUserId=${result.user.userId}");
    getAuction();
  }
  getAuctionByUser() async {
    auctionByUser =null;
    isAuctionByUserLoaded = false;
    notifyListeners();

    String body = await ApiServices.simpleGet("Auction/get-Auctions-by-user?userId=${getUser().result!.id}");
    // logger.e(body);
    if (body.isEmpty) return;

    auctionByUser = auctionByUserModelFromJson(body);
    isAuctionByUserLoaded = true;
    notifyListeners();
  }
  uploadPaymentEvidence(List<File> files, int carInformationId) async {
    showProgressCircular();
    Map<String, String> body = {
      'UserId': getUser().result!.id.toString(),
      'CarID': '$carInformationId',
    };
    String bodyResult = await ApiServices.postMultiPartWithFile(
        ApiServices.PAYMENT_EVIDENCE, files,
        body: body);
    if (bodyResult.isEmpty) {
      showToast(msg: " Something Went Wrong");
      return false;
    }

    paymentEvidence = postPaymentEvidenceModelFromJson(bodyResult);
    // showToast(msg: paymentEvidence!.result);
    dismissDialog();
    return true;
  }
  Future<bool> getPaymentEvidence(user_auction.Result? result) async {
    showProgressCircular();
    print(
        "PaymentEvidence/Get-Evidence?userId=${getUser().result!.id}&carId=${result!.carInformationId}");
    String body = await ApiServices.simpleGet(
        'PaymentEvidence/Get-Evidence?userId=${getUser().result!.id}&carId=${result.carInformationId}');
    dismissDialog();
    if (body.isEmpty) {
      // showToast(msg: "No Payment Evidence Found");
      return false;
    }
    return true;
    // return Get.to(() => const PaymentCompleteScreen());
  }
  getBankAccount(int userId) async {
    String body = await ApiServices.simpleGet('BankAccount/31');
    if (body.isEmpty) {
      showToast(msg: 'Something went wrong');
    }
    bankAccount = bankAccountModelFromJson(body);
    if (bankAccount!.result.isEmpty) {
      showToast(msg: 'No Bank Detail Found');
      return false;
    }

    isBankDetailLoaded = true;

    notifyListeners();
  }
  static void increamentBidd(r.Result result, AuctionProvider data) {

    biddingController.text=(double.parse(biddingController.text)+double.parse(result.bidIncrement.toString())).toString();
    data.notifyListeners();
  }
  static void decreamentBidd(r.Result result, AuctionProvider data) {
    if(double.parse(biddingController.text)<=double.parse(result.bidding.biddingAmount.toString())) return;
    biddingController.text=(double.parse(biddingController.text)-double.parse(result.bidIncrement.toString())).toString();
    data.notifyListeners();


  }



}
