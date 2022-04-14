
import 'package:auction/ApiServices/api_services.dart';
import 'package:auction/views/home/dashboard_screen.dart';
import 'package:auction/views/user_credentials_screens/otp_screen.dart';
import 'package:auction/views/welcome_screens/user_auth_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
import '../../utils/const.dart';
import '../../utils/widgets.dart';

  Logger logger = Logger();

  AuthProvider authProvider = Provider.of<AuthProvider>(Get.context!, listen: false);

  final boxStorage = GetStorage();

  class AuthProvider extends ChangeNotifier {

  String name = 'Welcome';

  String? userId;

  String? email;

  String? password;

  String phone = '';

  String otpCode = '';

  String verificationId = '';

  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  Future<void> checkUserStatus() async {
    bool? user = boxStorage.read(StorageKey.IS_USE_LOGGED_IN);

    if (user == null || user == false) {
      Get.to(() => const UserAuthScreen());
    } else {
      await showToast(msg: "Logged in");
      Get.to(() => const DashBoardScreen());
    }
  }

  Future<UserCredential> signInWithGoogle() async {
    showProgressCircular();
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    await boxStorage.write(StorageKey.NAME, googleUser!.displayName);
    await boxStorage.write(StorageKey.EMAIL, googleUser.email);
    name = boxStorage.read(StorageKey.NAME);
    email = boxStorage.read(StorageKey.EMAIL);

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    if (credential.idToken!.isNotEmpty) {
      Get.back();
      await showToast(msg: "User created");
      Get.offAll(() => DashBoardScreen());
    }

    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  otpSend() async {
    showProgressCircular();
    await firebaseAuth.verifyPhoneNumber(
        timeout: const Duration(seconds: 60),
        phoneNumber: phone,
        verificationCompleted: (PhoneAuthCredential credential) async {
          logger.i('compeleted');
        },
        verificationFailed: (FirebaseAuthException exception) async {
          Get.back();
          if (exception.code == 'invalid-phone-number') {
            await showToast(msg: 'invalid phone number');

            return;
          }
        },
        codeSent: (String verificationId, int? resendToken) async {
          this.verificationId = verificationId;

          Get.back();
          await showToast(msg: "Code Sent");

          Get.to(() => const OtpScreen());
        },
        codeAutoRetrievalTimeout: (String verificationId) async {});
  }

  verifyPhone() async {
    showProgressCircular();
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId, smsCode: otpCode);
    await firebaseAuth.signInWithCredential(credential);
    if (credential.verificationId!.isEmpty) {
      await showToast(msg: "Something Went Wrong");
      Get.back();
    } else {
      await showToast(msg: 'Phone Successfully Verified');
      Get.back();
      await registerUser();
    }
  }

  registerUser() async {
    showProgressCircular();
    Map<String, String> body = {
      'Name': name,
      'Password': password!,
      'PhoneNumber': phone,
      'Email': email!
    };

    String bodyResponse =
        await ApiServices.postMultiPart(ApiServices.REGISTER, body);

    dismissDialog();
    saveUser(bodyResponse);
  }

  loginUser() async {

    showProgressCircular();

    Map<String, String> body = {"username": email!, "password": password!};

    var bodyResponse = await ApiServices.simplePostWithBody(ApiServices.SIGN_IN, body);

    dismissDialog();

    saveUser(bodyResponse);

  }

  void saveUser(String bodyResponse) async {
    if (bodyResponse.isEmpty) return;
    await boxStorage.write(StorageKey.FULL_USER_BODY, bodyResponse);

    await boxStorage.write(StorageKey.IS_USE_LOGGED_IN, true);

    Get.offAll(const DashBoardScreen());
  }

}