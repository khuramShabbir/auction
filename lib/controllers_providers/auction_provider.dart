import 'package:auction/api_services.dart';
import 'package:auction/controllers_providers/auth_provider.dart';
import 'package:auction/models/BankAccountModel/bank_account_model.dart';
import 'package:auction/models/GetPaymentEvidenceModel/get_payment_evidence_model.dart';
import 'package:auction/models/GetPaymentEvidenceModel/post_evidence-model.dart';
import 'package:auction/models/auction/GetAllAuctions.dart';
import 'package:auction/models/auction/auction_by_user.dart';
import 'package:auction/models/wallet/WalletModel.dart';
import 'package:auction/utils/const.dart';
import 'package:auction/utils/widgets.dart';
import 'package:auction/views/home/create_campaign_Screens/bank_receipt_screen.dart';
import 'package:auction/views/home/create_campaign_Screens/payment_complete_screen.dart';
import 'package:auction/views/payment_method_screens/web_view_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:auction/models/auction/GetAllAuctions.dart' as r;

AuctionProvider auctionProvider =
    Provider.of<AuctionProvider>(Get.context!, listen: false);

class AuctionProvider extends ChangeNotifier {
  GetAllAuctions? allAuctions;
  WalletModel? walletModel;
  BankAccountModel? bankAccount;
  AuctionByUserModel? auctionByUser;
  GetPaymentEvidenceModel? getPaymentEvidenceModel;
  PostPaymentEvidenceModel? postPaymentEvidence;
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


  getAuction() async {
    String body = await ApiServices.simpleGet(ApiServices.GET_AUCTION);
    if (body.isEmpty) return;
    allAuctions = getAllAuctionsFromJson(body);
    isAuctionLoaded = true;
    notifyListeners();
  }

  getWallet(r.Result result) async {
    String body = await ApiServices.simplePost(
        "${ApiServices.GET_WALLET}${getUser().result!.id.toString()}");
    if (body.isEmpty) {
      showToast(msg: "Some thing went wrong! please try again later");
      return;
    }

    walletModel = walletModelFromJson(body);
    walletAmount = walletModel!.result.amount;

    if (result.minimumBidAmount == 0) {
      showToast(msg: "Can't be bid at this car");
      return;
    } else if (walletAmount! >= result.minimumBidAmount) {
      CustomWidget.biddingAmountBottomSheet(result.carInformationId);
      return;
    }

    var amount = await CustomWidget.customDialogBox(
        subTitle: "You have low balance to complete this process");
    if (amount != null) {
      Get.to(() => PaymentWebView(
          initUrl:
              "https://auction.cp.deeps.info/Home/Payment?userId=${getUser().result!.id}&amount=$amount"));
    }

    // CustomWidget.addWalletBottomSheet();
  }

  getAuctionByUser() async {
    String body =
        await ApiServices.simpleGet("Auction/get-Auctions-by-user?userId=30");

    if (body.isEmpty) return;
    auctionByUser = auctionByUserModelFromJson(body);
    isAuctionByUserLoaded = true;
    notifyListeners();
  }

  uploadPaymentEvidence() async {
    showProgressCircular();
    Map<String, String> body = {
      'UserId': getUser().result!.id.toString(),
      'CarID': '2',
    };
    String bodyResult = await ApiServices.postMultiPartWithFile(
        ApiServices.PAYMENT_EVIDENCE, [xFile!.path],
        body: body);
    if (bodyResult.isEmpty) {
      showToast(msg: " Something Went Wrong");
    }
    postPaymentEvidence = postPaymentEvidenceModelFromJson(bodyResult);
    showToast(msg: postPaymentEvidence!.result);
    dismissDialog();
  }

  getPaymentEvidence() async {
    showProgressCircular();

    String body = await ApiServices.simpleGet(
        'PaymentEvidence/Get-Evidence?userId=${getUser().result!.id}&carId=2');
    dismissDialog();

    if (body.isEmpty) {
      showToast(msg: "No Payment Detail Found");
      return Get.to(() => const BankReceiptScreen());
    }
    return Get.to(() => const PaymentCompleteScreen());


  }

  getBankAccount() async {
    String body = await ApiServices.simpleGet('BankAccount/31');
    if (body.isEmpty) {
      showToast(msg: 'Something went wrong');
      return;
    }
    bankAccount = bankAccountModelFromJson(body);
    if (bankAccount!.result.isEmpty) {
      showToast(msg: 'No Bank Detail Found');
      return;
    }
    isBankDetailLoaded = true;

    notifyListeners();
  }
}
