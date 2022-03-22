import 'package:auction/controllers_providers/auction_provider.dart';
import 'package:auction/controllers_providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class UserWallet extends StatefulWidget {
  const UserWallet({Key? key}) : super(key: key);

  @override
  State<UserWallet> createState() => _UserWalletState();
}

class _UserWalletState extends State<UserWallet> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // auctionProvider.getWallet(null,isOnlyWalletRequired: true);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(Icons.arrow_back,color: Colors.black,),
          ),
          elevation: 0,
          title: Text("Wallet",style: const TextStyle(color: Colors.black),),
          centerTitle: true,
        ),
        body: Consumer<AuthProvider>(
          builder: (build,data,child) {
            return Container();
          }
        ));
  }
}
