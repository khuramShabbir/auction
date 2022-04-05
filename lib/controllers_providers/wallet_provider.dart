import 'package:auction/api_services.dart';
import 'package:auction/models/wallet/user_wallet_history.dart';
import 'package:auction/models/wallet/WalletModel.dart';
import 'package:auction/utils/const.dart';
import 'package:flutter/cupertino.dart';

class WalletProvider extends ChangeNotifier {
  WalletModel? walletModel;
  GetWalletHistory? getWalletHistoryResponse;
  getWallet() async {

    String body = await ApiServices.simplePost("${ApiServices.GET_WALLET}${getUser().result!.id.toString()}");
    
    if(!body.contains("successful")) return;
    walletModel=null;
    notifyListeners();
    walletModel = walletModelFromJson(body);
    notifyListeners();

  }

  void getWalletHistory()async {
    print("${ApiServices.GET_WALLET_HISTORY}${getUser().result!.id.toString()}");

    String body = await ApiServices.simpleGet("${ApiServices.GET_WALLET_HISTORY}${getUser().result!.id.toString()}");
    if(!body.contains("successful")) return;
    getWalletHistoryResponse=null;
    notifyListeners();
    getWalletHistoryResponse = getWalletHistoryFromJson(body);
    notifyListeners();




  }
}
