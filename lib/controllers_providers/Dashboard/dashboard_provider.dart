import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

DashBoardProvider dashBoardProvider=Provider.of<DashBoardProvider>(Get.context!,listen: false);

class DashBoardProvider extends ChangeNotifier{
  int notificationNumber=0;

  void increamentNotificationNumber() {
    notificationNumber++;
  }





}