
import 'package:auction/controllers_providers/Auth/auth_provider.dart';
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

class AppColors {
  static Color orangeColor = const Color(0xFFFF5e00);
  static Color blueColor = const Color(0xFF0000fe);
  static Color lightOrangeColor = const Color(0xFFFFDFCC);
  static Color greyColor = const Color(0xFF666666).withOpacity(.7);
  static Color whiteColor = Colors.white;
  static Color blackColor = Colors.black;
}

class AppTextStyles {
  static final TextStyle normalGreyTextStyle =
      TextStyle(color: AppColors.greyColor, fontSize: 13);
  static final TextStyle normalBlackTextStyle =
      TextStyle(color: AppColors.blackColor, fontSize: 13);
  static final normalWhiteTextStyle =
      TextStyle(color: AppColors.whiteColor, fontSize: 13);

  static final TextStyle headingStyle = TextStyle(
      color: AppColors.blackColor,
      fontSize: 22,
      fontWeight: FontWeight.bold);
  static final TextStyle appBarStyle = TextStyle(
      color: AppColors.blackColor,
      fontSize: 16,
      fontWeight: FontWeight.bold);

  static final TextStyle subTitleStyleBlack = TextStyle(
      color: AppColors.blackColor,
      fontWeight: FontWeight.w500,
      fontSize: 16);
}

class StaticAssets {
  static final notificationIcon =SvgPicture.asset('assets/SvgAssets/notification.svg');
  static final walletSvg =SvgPicture.asset('assets/SvgAssets/Wallet.svg',color: Colors.black,);
  static final leftArrow =
      Icon(Icons.arrow_back, color: AppColors.blackColor);

  static final rightArrow =Icon(Icons.arrow_forward, color: AppColors.whiteColor);
}

class CustomAppBar {
  static appBar({
    String title = "Auction",
    List <Widget>? action,
  }) {
    return AppBar(
      elevation: 0,
      backgroundColor: AppColors.whiteColor,
      centerTitle: true,
      leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: StaticAssets.leftArrow),
      title: Text(title, style: AppTextStyles.appBarStyle),
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



