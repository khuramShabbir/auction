import 'package:auction/controllers_providers/Auth/auth_provider.dart';
import 'package:auction/controllers_providers/Dashboard/dashboard_provider.dart';
import 'package:auction/controllers_providers/Wallet/wallet_provider.dart';
import 'package:auction/utils/const.dart';
import 'package:auction/utils/widgets.dart';
import 'package:auction/views/home/all_auctions_screen.dart';
import 'package:auction/views/home/bottom_nav_bar_screens/all_cars_screen.dart';
import 'package:auction/views/home/CouponScreens/coupen_screen.dart';
import 'package:auction/views/wallet/wallet.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';




class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> carList = [
    'assets/PngAssets/blackCar.png',
    'assets/PngAssets/whiteCar.png',
    'assets/PngAssets/menIC.png'
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if(getUser()==null){

      return;
    }
    walletProvider.getWallet();

  }
  Widget screenWidget=AllAuctionScreen();

  @override
  Widget build(BuildContext context) {
    return Consumer<DashBoardProvider>(
        builder: (BuildContext context, data, child) {
          context.height;
      return Scaffold(
        appBar:getAppBar("Zawid.online",isLeadingRequired: false),
        body: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: Get.width,
                  height: 55,
                  color: AppColors.lightblueColor,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      getTopBarItem("Auction",(){
                        screenWidget= const AllAuctionScreen();
                        setState(() {});
                      }),
                      getTopBarItem("Buy/Sale Now",(){

                        screenWidget= AllCarsScreen(true,isAppBarRequired:false);
                        setState(() {});

                      }),
                      getTopBarItem("Promotions",(){
                        screenWidget= const CouponScreen();
                        setState(() {});

                      }),
                      // getUser()==null? getTopBarItem("Login",(){}): Container(),
                    ],
                  ),
                ),
                Expanded(child: screenWidget)
                /*Text(boxStorage.read(StorageKey.NAME) ?? 'Welcome',
                  style: TextStyle(
                      color: Colors.grey.withOpacity(.5),
                      fontWeight: FontWeight.bold,
                      fontSize: 17)),
              Text(getUser()==null? "":"${getUser()!.result!.name}", style: AppTextStyles.headingStyle),
              Expanded(child: getITems(context))*/

              ],
            )),
      );
    });
  }

  Widget getITems(BuildContext context){

    var list=[
      if(kIsWeb && context.height > 600 && context.width > 600) const SizedBox(width: 10,),
      Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15.0),
            child: InkWell(
              onTap: () {
                Get.to(() => const AllAuctionScreen());
              },
              child: Container(
                height:kIsWeb?  height * .35 :   height * .2,
                width: width,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(carList[0]), fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 0, 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "auction that interest you",
                        style: TextStyle(
                            color: AppColors.whiteColor,
                            fontWeight: FontWeight.bold),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: Row(
                          children: [
                            Text("Get Bid",
                                style: TextStyle(
                                    color: AppColors.whiteColor,
                                    fontWeight: FontWeight.bold)),
                            const SizedBox(
                              width: 15,
                            ),
                            StaticAssets.rightArrow
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )),
      if(kIsWeb && context.height > 600 && context.width > 600) const SizedBox(width: 10,),
      Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15.0),
            child: InkWell(
              onTap: () {
                // bottomSheetComingSoon();

                Get.to(() =>    AllCarsScreen(true));

              },
              child: Container(
                width: width,
                height:kIsWeb?  height * .35 :   height * .2,



                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(carList[1]), fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 0, 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Car that interest you",
                        style: TextStyle(
                            color: AppColors.whiteColor,
                            fontWeight: FontWeight.bold),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: Row(
                          children: [
                            Text("Search Car",
                                style: TextStyle(
                                    color: AppColors.whiteColor,
                                    fontWeight: FontWeight.bold)),
                            const SizedBox(
                              width: 15,
                            ),
                            StaticAssets.rightArrow
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )),
      if(kIsWeb && context.height > 600 && context.width > 600) const SizedBox(width: 10,),
      Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15.0),
            child: InkWell(
              onTap: () {
                Get.to(()=>const CouponScreen());




                // bottomSheetComingSoon();
                // Get.to(() => const SearchForCarsScreen());
              },
              child: Container(
                width: width,
                height:kIsWeb?  height * .35 :   height * .2,

                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(carList[2]), fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 0, 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Discounts that interest you",
                        style: TextStyle(
                            color: AppColors.whiteColor,
                            fontWeight: FontWeight.bold),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: Row(
                          children: [
                            Text("Get Discount Coupons",
                                style: TextStyle(
                                    color: AppColors.whiteColor,
                                    fontWeight: FontWeight.bold)),
                            const SizedBox(
                              width: 15,
                            ),
                            StaticAssets.rightArrow
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )),
      if(kIsWeb && context.height > 600 && context.width > 600) const SizedBox(width: 10,),
    ];

    if( kIsWeb && context.height > 600 && context.width > 600 ) {
      return Row(children: list);
    }

    return Column(children: list);
  }

  bottomSheetComingSoon() {
    Get.bottomSheet(Material(
      child: Container(
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(topRight: Radius.circular(10),
                topLeft: const Radius.circular(10)

            )),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "Alert",
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 25,
              ),
              const Text("This services will be available so soon, keep in touch"),
              const SizedBox(
                height: 25,
              ),
              customizedButton(
                  onTap: () {
                    Get.back();
                  },
                  textColor: Colors.white,
                  buttonColor: AppColors.orangeColor,
                  buttonText: "Ok"),
              const SizedBox(
                height: 25,
              ),
            ],
          ),
        ),
      ),
      color: Colors.transparent,
    ));
  }

  getTopBarItem(String title, Null Function() onTap) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: InkWell(
        onTap: onTap,

        child: Text(
          title,
          style: TextStyle(
              fontSize: Get.height * 0.025,
              fontWeight: FontWeight.bold,
            color: Colors.white
            // color: AppColors.orangeColor
          ),
        ),
      ),
    );

  }
}

 getAppBar(String title, {bool isLeadingRequired=true,bool isCenterTitle=false}){
  return AppBar(

      elevation: 0, backgroundColor: AppColors.darkblueColor,
      centerTitle: isCenterTitle,
      leading:!isLeadingRequired ? null : IconButton(onPressed: (){Get.back();},icon: Icon(Icons.arrow_back,color: AppColors.whiteColor,),),
      actions: [
        Spacer(),
        Center(child: Text(title=="Zawid.online"?"Z":"",style:  TextStyle(color: AppColors.ligthOrangeColor,fontWeight: FontWeight.w900,fontSize: 20),)),

        Center(child: Text(title=="Zawid.online"?title.replaceFirst("Z", ""):title,style: const TextStyle(color: Colors.white,fontWeight: FontWeight.w900,fontSize: 20),)),
        Spacer(),

        Center(child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            child: Row(children: [
              Expanded(child: Container()),
              Icon(Icons.search,color: AppColors.darkblueColor,),
              SizedBox(width: 10,)
            ],),
            decoration: BoxDecoration(
              color: AppColors.whiteColor,
            borderRadius: BorderRadius.circular(5)
            ),
            width: Get.width *0.7),
        )),
        Spacer(),

        kIsWeb ? InkWell(
          onTap: (){
            dashBoardProvider.index=5;
            dashBoardProvider.notifyListeners();


          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: SvgPicture.asset("assets/PngAssets/united-states.png"),
          ),
        ): Container(),
        
        
        
        
        InkWell(
          onTap: (){
            dashBoardProvider.index=3;
            dashBoardProvider.notifyListeners();
          },
          child: Consumer<WalletProvider>(
              builder: (builder,data,child) {
                return Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Row(children: [
                      SvgPicture.asset('assets/SvgAssets/Wallet.svg',color: Colors.white,),
                      const SizedBox(width: 10,),
                      Text(data.walletModel==null?"0 SAR":"${double.parse(data.walletModel!.result.amount.toString()).toInt()} SAR",style: const TextStyle(color: Colors.white),)
                    ],));
              }
          ),
        ),

       
        kIsWeb ? InkWell(
          onTap: (){
            dashBoardProvider.index=5;
            dashBoardProvider.notifyListeners();


          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Icon(Icons.add_shopping_cart_outlined,color: Colors.white,),
          ),
        ): Container(),

        kIsWeb ? InkWell(
            onTap: (){
              dashBoardProvider.index=1;
              dashBoardProvider.notifyListeners();
            },
            child: Padding(padding: const EdgeInsets.symmetric(horizontal: 8.0), child: Icon(Icons.search,color: Colors.white,),)): Container(),

        kIsWeb?  InkWell(
          onTap: (){
              dashBoardProvider.index=4;
              dashBoardProvider.notifyListeners();

          },
          child: Consumer<WalletProvider>(
              builder: (builder,data,child) {
                return Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: Icon(Icons.person, color: Colors.white,));
              }
          ),
        ):Container(),

        kIsWeb ? Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: InkWell(
              onTap:(){
                dashBoardProvider.index=0;
                dashBoardProvider.notifyListeners();
          },child: Icon(Icons.home,color: Colors.white,)),
        ) : Container(),

        SizedBox(width: 10,)


      ]);
}
