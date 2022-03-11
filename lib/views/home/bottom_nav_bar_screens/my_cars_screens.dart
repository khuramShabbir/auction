import 'package:auction/utils/const.dart';
import 'package:auction/utils/widgets.dart';
import 'package:auction/views/home/check_out_screen.dart';
import 'package:auction/views/home/create_campaign_Screens/car_specs.dart';
import 'package:auction/views/home/create_campaign_Screens/step2_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class MyCarsScreen extends StatefulWidget {
  const MyCarsScreen({Key? key}) : super(key: key);

  @override
  _MyCarsState createState() => _MyCarsState();
}

class _MyCarsState extends State<MyCarsScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: StaticColors.whiteColor,
        appBar: CustomAppBar.appBar(),
        body:StaticKPadding.kPadding(
            child:
       Column(children: [
         ListView.builder(
           shrinkWrap: true,
           itemCount: 1,
           itemBuilder: (BuildContext context, int index) {
             return  Padding(
               padding: const EdgeInsets.symmetric(vertical: 10.0),
               child: InkWell(
                 onTap: (){Get.to(()=>const CreateCampaignScreen());},
                 child: Container(
                     width: width,
                     height: height * .27,
                     decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(10),
                         image: DecorationImage(
                             image: NetworkImage(imageUrl), fit: BoxFit.fill)),
                     child: StaticKPadding.kPadding(
                         child: Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           mainAxisAlignment: MainAxisAlignment.end,
                           children: [
                             Text(
                               "BMW Q7",
                               style: TextStyle(
                                   fontSize: 15,
                                   fontWeight: FontWeight.bold,
                                   color: StaticColors.whiteColor),
                             ),
                             const SizedBox(height: 5),
                             Row(
                               children: [
                                 Text(
                                   "Weekdays",
                                   style: TextStyle(
                                       fontSize: 15,
                                       fontWeight: FontWeight.w200,
                                       color: StaticColors.whiteColor),
                                 ),
                                 Padding(
                                   padding:
                                   const EdgeInsets.symmetric(horizontal: 10),
                                   child: Container(
                                       height: 20,
                                       width: 1,
                                       color: StaticColors.whiteColor),
                                 ),
                                 Text(
                                   "7:00",
                                   style: TextStyle(
                                       fontSize: 15,
                                       fontWeight: FontWeight.w200,
                                       color: StaticColors.whiteColor),
                                 ),
                               ],
                             ),
                             const SizedBox(height: 5),
                             Text(
                               "Riyadh",
                               style: TextStyle(
                                   fontSize: 15,
                                   fontWeight: FontWeight.w200,
                                   color: StaticColors.whiteColor),
                             ),
                             const SizedBox(height: 5),
                             Row(
                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                               children: [
                                 Container(
                                   decoration: BoxDecoration(
                                       borderRadius: BorderRadius.circular(5),
                                       color: Colors.green.withOpacity(.3)),
                                   child: Row(
                                     children: [
                                       Padding(
                                         padding: const EdgeInsets.all(10.0),
                                         child: Container(
                                           width: 10,
                                           height: 10,
                                           decoration: BoxDecoration(
                                               color: Colors.green,
                                               borderRadius:
                                               BorderRadius.circular(100)),
                                         ),
                                       ),
                                       const Text(
                                         "Acceptable",
                                         style: TextStyle(color: Colors.green),
                                       ),
                                       const SizedBox(width: 10)
                                     ],
                                   ),
                                 ),
                                 const Text(
                                   "25000 / SAR",
                                   style: TextStyle(
                                       color: Colors.white,
                                       fontWeight: FontWeight.bold),
                                 )
                               ],
                             )
                           ],
                         ))),
               ),



             ) ;
           },),
         Expanded(child: SizedBox()),
         extendedButton(onTap: (){
           Get.to(()=>CheckOutScreen());

         },
             buttonColor: StaticColors.blueColor,
             textColor: StaticColors.whiteColor,
             buttonText: "CheckOut")


       ],)),



      ),
    );
  }
}
