import 'package:auction/controllers_providers/Auth/auth_provider.dart';
import 'package:auction/utils/const.dart';
import 'package:auction/utils/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:provider/provider.dart';
import 'login_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool isObscure = true;
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
        builder: (BuildContext context, data, Widget? child) {
      return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: CustomAppBar.appBar(title: "Sign Up"),
        backgroundColor: AppColors.whiteColor,
        body: StaticKPadding.kPadding(
            child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              /// NAME
              customTextFormField(
                  hintText: "Name",
                  isOutLinedBorder: true,
                  onChange: (v) {
                    data.name = v;
                  },
                  validator: (v) {
                    if (v!.isEmpty) {
                      return "field can't be empty";
                    }
                    return null;
                  }),

              /// EMAIL
              customTextFormField(
                  inputType: TextInputType.emailAddress,
                  hintText: "Email",
                  isOutLinedBorder: true,
                  onChange: (v) {
                    data.email = v;
                  },
                  validator: (v) {
                    if (v!.isEmpty) {
                      return "field can't be empty";
                    } else if (v.isEmail == false) {
                      return "Please enter correct email";
                    }
                    return null;
                  }),

              /// PASSWORD
              customTextFormField(
                  validator: (v) {
                    if (v!.isEmpty) {
                      return "field can't be empty";
                    } else if (v.length < 8) {
                      return "password should be at least 8 characters";
                    }
                    return null;
                  },
                  suffixIcon: InkWell(
                      onTap: () {
                        setState(() {
                          isObscure = !isObscure;
                        });
                      },
                      child: Icon(
                        Icons.remove_red_eye,
                        color: isObscure
                            ? AppColors.greyColor
                            : AppColors.orangeColor,
                      )),
                  obscureText: isObscure ? true : false,
                  hintText: "Password",
                  isOutLinedBorder: true,
                  onChange: (v) {
                    data.password = v;
                  }),

              /// PHONE_NUMBER
              ///
              IntlPhoneField(
                  onChanged: (phone) {
                    data.phone = phone.completeNumber;
                  },
                  keyboardType: TextInputType.number,
                  initialCountryCode: 'PK',
                  dropdownIconPosition: IconPosition.trailing,
                  flagsButtonPadding: const EdgeInsets.only(left: 10),
                  decoration: InputDecoration(
                    errorStyle: TextStyle(color: AppColors.orangeColor),
                    errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide:
                            BorderSide(color: AppColors.orangeColor,width: 1.5)),
                    focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide:
                            BorderSide(color: AppColors.orangeColor,width: 1.5)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide:
                            BorderSide(color: AppColors.orangeColor,width: 1.5)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(
                            color: AppColors.orangeColor,width: 1.5)),
                  )),

              extendedButton(
                  onTap: () async {
                    if (formKey.currentState!.validate()) {
                      if (data.phone.length == 13) {
                        await data.otpSend();
                      } else {
                        showToast(msg: 'Please Enter Valid Mobile Number');
                        return;
                      }
                    }
                    return;
                  },
                  buttonColor: AppColors.blueColor,
                  textColor: AppColors.whiteColor,
                  buttonText: "Sign Up"),
              Text(
                "Or with",
                style: TextStyle(
                    color: AppColors.greyColor,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 5),

              /// google signIn
              InkWell(
                onTap: () async {
                  await data.signInWithGoogle();
                },
                child: Container(
                    child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset('assets/PngAssets/google_icon.png',
                                  width: 25, height: 25),
                              const SizedBox(width: 10),
                              const Text("Sign Up with Google",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20))
                            ])),
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: AppColors.greyColor.withOpacity(.2)),
                      borderRadius: BorderRadius.circular(15),
                    )),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account?",
                    style: AppTextStyles.normalGreyTextStyle,
                  ),
                  const SizedBox(width: 5),
                  InkWell(

                      /// Login
                      onTap: () {
                        Get.to(() => const LoginScreen());
                      },
                      child: Text(
                        "Login",
                        style: TextStyle(
                          color: AppColors.orangeColor,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                        ),
                      )),
                ],
              )
            ],
          ),
        )),
      );
    });
  }
}
