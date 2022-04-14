import 'package:auction/controllers_providers/Auth/auth_provider.dart';
import 'package:auction/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:provider/provider.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({Key? key}) : super(key: key);

  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (BuildContext context, value, Widget? child) {
        return SafeArea(
            child: Scaffold(
          backgroundColor: AppColors.whiteColor,
          appBar: AppBar(
              centerTitle: true,
              elevation: 0,
              backgroundColor: AppColors.whiteColor,
              leading: StaticAssets.leftArrow,
              title: Text("Verify OTP", style: AppTextStyles.appBarStyle)),
          body: SizedBox(
            width: width,
            height: height,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: height * .2,
                  ),
                  Text(
                    "Phone Verification",
                    style: AppTextStyles.headingStyle,
                  ),
                  const SizedBox(width: 5),
                  Text(
                    "Please enter the 6-digit code send to you at",
                    style: AppTextStyles.normalGreyTextStyle,
                  ),
                  const SizedBox(height: 5),
                  Text(
                    "+61 44 535 235",
                    style: AppTextStyles.normalBlackTextStyle,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "Resend Code",
                    style: AppTextStyles.normalGreyTextStyle,
                  ),
                  const SizedBox(height: 20),
                  Expanded(
                    child: OtpTextField(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      numberOfFields: 6,
                      showFieldAsBox: true,
                      fieldWidth: 40,
                      keyboardType: TextInputType.phone,
                      borderRadius: BorderRadius.circular(100),
                      borderColor: AppColors.orangeColor,
                      onCodeChanged: (String code) {},
                      onSubmit: (String verificationCode) async {
                        value.otpCode = verificationCode;
                        await value.verifyPhone();
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
      },
    );
  }
}
