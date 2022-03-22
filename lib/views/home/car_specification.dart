import 'dart:async';
import 'dart:io';
import 'package:auction/models/auction/GetAllAuctions.dart';
import 'package:auction/utils/const.dart';
import 'package:auction/utils/widgets.dart';
import 'package:auction/views/home/bottom_nav_bar_screens/search_for_cars_screen.dart';
import 'package:auction/views/home/create_campaign_Screens/car_specs.dart';
import 'package:auction/views/inspection/pdf_view.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:get/get.dart';
import 'package:panorama/panorama.dart';
import 'package:path_provider/path_provider.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class CarSpecification extends StatefulWidget {
  final Result? result;

  const CarSpecification({Key? key, this.result}) : super(key: key);

  @override
  _CarSpecificationState createState() => _CarSpecificationState(this.result);
}

class _CarSpecificationState extends State<CarSpecification> {
  Result? result;
  String remotePDFpath = "";

  _CarSpecificationState(this.result);

  @override
  void initState() {
    super.initState();
  }
int index=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.appBar(),
      body: StaticKPadding.kPadding(
          child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: height * .4,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                            image: result!.carImages.isEmpty
                                ? const NetworkImage(
                                    "https://image.shutterstock.com/image-"
                                    "vector/no-image-available-sign-internet-26"
                                    "0nw-261719003.jpg")
                                : NetworkImage(result!.carImages[index].imagePath),
                            fit: BoxFit.fill)),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: 75,
                          child: ListView.builder(
                            itemCount: result!.carImages.length,
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (BuildContext context, int index) {
                              return Row(
                                children: [
                                  InkWell(
                                    onTap: (){
                                      this.index=index;
                                      setState(() {
                                      });
                                    },
                                    child: Container(
                                      width: 85,
                                      height: 85,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          image: DecorationImage(
                                              image: NetworkImage(
                                                  result!.carImages[index].imagePath),
                                              fit: BoxFit.fill)),
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                ],
                              );
                            },
                          ),
                        ),
                      ),

                   result!.image360==null?Container():
                      InkWell(
                        onTap: (){
                          Get.dialog(Material(color: Colors.transparent,

                          child: Stack(
                            children: [
                              Panorama(
                                child: Image.network(result!.image360!),
                              minZoom: 0.3,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(15),
                                child: InkWell(
                                    onTap: (){
                                      Get.back();

                                    },
                                    child: Icon(Icons.arrow_back,color: Colors.black,)),
                              )
                            ],
                          ),));
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Container(
                            width: 85,
                            height: 85,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                    image: NetworkImage(
                                        result!.image360!),
                                    fit: BoxFit.fill)),
                          ),
                        ),
                      ),

                    ],
                  ),


                  const SizedBox(height: 10),
                  Text("Specifications", style: StaticTextStyles.headingStyle),
                  const SizedBox(height: 10),
                  const SizedBox(height: 10),
                  result!.inspectionPdf != null
                      ? Container()
                      : InkWell(
                          onTap: () {
                            Get.to(PdfViewer(result!.inspectionPdf));

                            // showPDF();
                          },
                          child: const Text(
                            "View Report",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w500),
                          )),

                ],
              ),
            ),
          ),
          extendedButton(
              onTap: () {
                bottomSheet();
              },
              buttonColor: StaticColors.blueColor,
              textColor: StaticColors.whiteColor,
              buttonText: "Status")
        ],
      )),
    );
  }

  // PDFDocument? doc;
  // void getPDF()async {
  //    doc = await PDFDocument.fromURL('http://www.africau.edu/images/default/sample.pdf');
  //    setState(() {});
  // }

  /*Future<File> createFileOfPdfUrl() async {
    Completer<File> completer = Completer();
    print("Start download file from internet!");
    try {
      // "https://berlin2017.droidcon.cod.newthinking.net/sites/global.droidcon.cod.newthinking.net/files/media/documents/Flutter%20-%2060FPS%20UI%20of%20the%20future%20%20-%20DroidconDE%2017.pdf";
      // final url = "https://pdfkit.org/docs/guide.pdf";
      final url =result!.inspectionPdf??
          "http://www.africau.edu/images/default/sample.pdf";
      final filename = url.substring(url.lastIndexOf("/") + 1);
      var request = await HttpClient().getUrl(Uri.parse(url));
      var response = await request.close();
      var bytes = await consolidateHttpClientResponseBytes(response);
      var dir = await getApplicationDocumentsDirectory();
      print("Download files");
      print("${dir.path}/$filename");
      File file = File("${dir.path}/$filename");

      await file.writeAsBytes(bytes, flush: true);
      completer.complete(file);


    } catch (e) {
      throw Exception('Error parsing asset file!');
    }

    return completer.future;
  }
*/
  bottomSheet() {
    return Get.bottomSheet(
        Container(
          decoration: BoxDecoration(
              color: StaticColors.whiteColor,
              borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(15), topLeft: Radius.circular(15))),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 10),
              Container(
                width: 75,
                height: 5,
                decoration: BoxDecoration(
                    color: StaticColors.greyColor,
                    borderRadius: BorderRadius.circular(100)),
              ),
              const SizedBox(height: 20),
              StaticKPadding.kPadding(
                  child: Container(
                      width: width,
                      height: height * .3,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                              image:
                                  NetworkImage(result!.carImages[0].imagePath),
                              fit: BoxFit.fill)),
                      child: StaticKPadding.kPadding(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "${result!.carName}",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: StaticColors.whiteColor),
                          ),
                          const SizedBox(height: 5),
                          Row(
                            children: [
                              Text(
                                "Power",
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
                                result!.maxPower,
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
                                    color: result!.isWinning
                                        ? Colors.greenAccent.withOpacity(0.3)
                                        : Colors.red.withOpacity(0.3)),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Container(
                                        width: 10,
                                        height: 10,
                                        decoration: BoxDecoration(
                                            color: result!.isWinning
                                                ? Colors.greenAccent
                                                    .withOpacity(0.5)
                                                : Colors.red.withOpacity(0.5),
                                            borderRadius:
                                                BorderRadius.circular(100)),
                                      ),
                                    ),
                                    Text(
                                      result!.isWinning ? "Winning" : "Loosing",
                                      style: TextStyle(
                                          color: result!.isWinning
                                              ? Colors.greenAccent
                                              : Colors.red),
                                    ),
                                    const SizedBox(width: 10)
                                  ],
                                ),
                              ),
                              Text(
                                "${result!.bidding.biddingAmount} / SAR",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          )
                        ],
                      )))),
              // const Icon(Icons.cancel, size: 100, color: Colors.red),
              const SizedBox(height: 15),
              Text("Good Luck", style: StaticTextStyles.headingStyle),
              // Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 50.0),
              //   child: Text("Sorry the car was rejected from the owner, and the down payment will be refunded to your wallet",
              //       style: StaticTextStyles.normalGreyTextStyle),
              // ),
              const SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: extendedButton(
                    onTap: () {
                      Get.back();
                      // Get.to(() => const SearchForCarsScreen());
                    },
                    buttonColor: StaticColors.blueColor,
                    textColor: StaticColors.whiteColor,
                    buttonText: "OK"),
              ),
              const SizedBox(height: 20)
            ],
          ),
        ),
        exitBottomSheetDuration: const Duration(milliseconds: 500),
        enterBottomSheetDuration: const Duration(milliseconds: 500),
        enableDrag: true,
        isScrollControlled: true);
  }
}
