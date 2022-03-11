import 'package:auction/utils/const.dart';
import 'package:auction/utils/widgets.dart';
import 'package:auction/views/home/create_campaign_Screens/car_specs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileEditingScreen extends StatefulWidget {
  const ProfileEditingScreen({Key? key}) : super(key: key);

  @override
  State<ProfileEditingScreen> createState() => _ProfileEditingScreenState();
}

class _ProfileEditingScreenState extends State<ProfileEditingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: CustomAppBar.appBar(title: "Setting"),

    body:
    StaticKPadding.kPadding(child: Center(
    child: Column(
    mainAxisAlignment: MainAxisAlignment.start,
      children: [
        WhiteSpacer.verticalSpace(30),
        CircleAvatar(radius: 40, backgroundImage: NetworkImage(imageUrl)),
        WhiteSpacer.verticalSpace(20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Khaled", style: StaticTextStyles.subTitleStyleBlack),
            WhiteSpacer.horizontalSpace(5),
            SvgPicture.asset('assets/SvgAssets/edit.svg',
                color: StaticColors.greyColor.withOpacity(.5)),
          ],
        ),
        WhiteSpacer.verticalSpace(15),
        profileEditingModule('Connected Account'),
        profileEditingModule('Privacy and Security'),
        profileEditingModule('Login Setting'),
        profileEditingModule('Service Center'),
        WhiteSpacer.verticalSpace(50),
        Expanded(
            child: Center(
              child: Column(
                children: [
                  SvgPicture.asset('assets/SvgAssets/trash.svg'),
                  WhiteSpacer.verticalSpace(15),
                  Text("Delete Account",
                      style: StaticTextStyles.subTitleStyleBlack)
                ],
              ),
            ))
      ],
    ),
    ))
      ,);
  }
}
