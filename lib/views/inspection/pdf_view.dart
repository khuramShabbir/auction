import 'package:auction/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PdfViewer extends StatefulWidget {
  String? title;

  PdfViewer(this.title);

  @override
  State<PdfViewer> createState() => _PdfViewerState();
}

class _PdfViewerState extends State<PdfViewer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(height: height,
      width: width,
      child: SfPdfViewer.network(widget.title??'https://cdn.syncfusion.com/content/PDFViewer/flutter-succinctly.pdf')
        ,),
      appBar: AppBar(centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: InkWell(

              onTap: () {
                Get.back();
              },
              child: Icon(
                Icons.arrow_back,
                color: Colors.black,
              ))),
    );
  }
}
