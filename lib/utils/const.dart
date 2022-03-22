
import 'package:auction/controllers_providers/auth_provider.dart';
import 'package:auction/models/user/UserModelPojo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';



double width = Get.width;
double height = Get.height;

class StorageKey {
  static const EMAIL = 'email';
  static const NAME = 'name';
  static const FULL_USER_BODY = 'full_user_body';
  static const IS_USE_LOGGED_IN = 'IS_USE_LOGGED_IN';
}

class StaticColors {
  static Color orangeColor = const Color(0xFFFF5e00);
  static Color blueColor = const Color(0xFF0000fe);
  static Color lightOrangeColor = const Color(0xFFFFDFCC);
  static Color greyColor = const Color(0xFF666666).withOpacity(.7);
  static Color whiteColor = Colors.white;
  static Color blackColor = Colors.black;
}

class StaticTextStyles {
  static final TextStyle normalGreyTextStyle =
      TextStyle(color: StaticColors.greyColor, fontSize: 13);
  static final TextStyle normalBlackTextStyle =
      TextStyle(color: StaticColors.blackColor, fontSize: 13);
  static final normalWhiteTextStyle =
      TextStyle(color: StaticColors.whiteColor, fontSize: 13);

  static final TextStyle headingStyle = TextStyle(
      color: StaticColors.blackColor,
      fontSize: 22,
      fontWeight: FontWeight.bold);
  static final TextStyle appBarStyle = TextStyle(
      color: StaticColors.blackColor,
      fontSize: 16,
      fontWeight: FontWeight.bold);

  static final TextStyle subTitleStyleBlack = TextStyle(
      color: StaticColors.blackColor,
      fontWeight: FontWeight.w500,
      fontSize: 16);
}

class StaticAssets {
  static final notificationIcon =
      SvgPicture.asset('assets/SvgAssets/notification.svg');
  static final leftArrow =
      Icon(Icons.arrow_back, color: StaticColors.blackColor);

  static final rightArrow =
      Icon(Icons.arrow_forward, color: StaticColors.whiteColor);
}

class CustomAppBar {
  static appBar({
    String title = "Auction",
    List <Widget>? action,
  }) {
    return AppBar(
      elevation: 0,
      backgroundColor: StaticColors.whiteColor,
      centerTitle: true,
      leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: StaticAssets.leftArrow),
      title: Text(title, style: StaticTextStyles.appBarStyle),
      actions:action,
    );
  }
}

class StaticKPadding {
  static kPadding({required child}) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
      child: child,
    );
  }
}

class WhiteSpacer {
  static verticalSpace(double height) {
    return SizedBox(height: height);
  }

  static horizontalSpace(double width) {
    return SizedBox(width: width);
  }
}


UserModelPojo getUser(){
  String data =boxStorage.read(StorageKey.FULL_USER_BODY);

  UserModelPojo user =   userModelPojoFromJson(data);
  return user;


}



