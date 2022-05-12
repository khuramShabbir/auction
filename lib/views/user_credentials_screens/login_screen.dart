import 'package:auction/controllers_providers/Auth/auth_provider.dart';
import 'package:auction/utils/const.dart';
import 'package:auction/utils/widgets.dart';
import 'package:auction/views/home/dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool obscure = true;
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (BuildContext context, data, Widget? child) {
        return Scaffold(
          backgroundColor: AppColors.whiteColor,
          appBar: CustomAppBar.appBar(title: "Login"),
          body: StaticKPadding.kPadding(
              child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                customTextFormField(
                  validator: (v) {
                    if (v!.isEmpty) {
                      return "field can't be empty";
                    } else if (v.isEmail == false) {
                      return "please enter correct Email";
                    }
                    return null;
                  },
                  onChange: (v) {
                    data.email = v;
                  },
                  hintText: "Email",
                  isOutLinedBorder: true,
                ),
                customTextFormField(
                    validator: (v) {
                      if (v!.isEmpty) {
                        return "field can't be empty";
                      } else if (v.length < 8) {
                        return "password should be at least 8 Characters";
                      }
                      return null;
                    },
                    onChange: (v) {
                      data.password = v;
                    },
                    isOutLinedBorder: true,
                    hintText: "Password",
                    obscureText: obscure ? true : false,
                    suffixIcon: InkWell(
                      onTap: () {
                        setState(() {
                          obscure = !obscure;
                        });
                      },
                      child: Icon(
                        Icons.remove_red_eye,
                        color: obscure
                            ? AppColors.greyColor
                            : AppColors.orangeColor,
                      ),
                    )),
                extendedButton(
                    onTap: () async {
                      if (formKey.currentState!.validate()) {
                         data.loginUser();
                      }
                    },
                    buttonColor: AppColors.orangeColor,
                    textColor: AppColors.whiteColor,
                    buttonText: "Login")
              ],
            ),
          )),
        );
      },
    );
  }
}
