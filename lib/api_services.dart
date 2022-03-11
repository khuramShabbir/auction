import 'dart:convert';
import 'package:auction/controllers_providers/auth_provider.dart';
import 'package:auction/utils/widgets.dart';
import 'package:http/http.dart' as http;

class ApiServices {




  static String BASE_URL = 'https://auction.api.deeps.info/api/';
  static String REGISTER = "accounts/register";
  static String SIGN_IN = "accounts/signIn";
  static String GET_AUCTION = "auction/get-Auctions";
  static final _HEADERS = {'Content-Type': 'application/json'};
  static String GET_WALLET = 'Wallet/Get-Wallet?userId=';
  // static String BIDDING = '';
  static String ALL_USERS = 'users';

  static Future<String> postMultiPart(String feedUrl, Map<String, String> body,
      {String errorText = "Something went wrong"}) async {
    var request = http.MultipartRequest("POST", Uri.parse(BASE_URL + feedUrl));
    request.fields.addAll(body);
    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200 || response.statusCode == 201) {
      String resBody = await response.stream.bytesToString();

      showToast(msg: "User Created");

      return resBody;
    } else {
      String resBody = await response.stream.bytesToString();

      var data = await jsonDecode(resBody);
      String msg =
          data["responseException"]["exceptionMessage"][0]["description"];
      dismissDialog();

      await showCustomDialog(msg);

      return "";
    }
  }

  static Future<String> simplePostWithBody(
      String feedUrl, Map<String, String> body) async {
    var request = http.Request('POST', Uri.parse(BASE_URL + feedUrl));
    request.body = json.encode(body);

    request.headers.addAll(_HEADERS);

    var response = await request.send();

    String resBody = await response.stream.bytesToString();

    if (response.statusCode == 200 || response.statusCode == 201) {
      return resBody;
    } else {
      var decoded = jsonDecode(resBody);

      logger.i(decoded["responseException"]["exceptionMessage"]);
      await showToast(msg: decoded["responseException"]["exceptionMessage"]);

      return "";
    }
  }

  static Future<String> simpleGet(String feedUrl) async {
    http.Response response = await http.get(Uri.parse(BASE_URL + feedUrl));

    if (response.statusCode == 200 || response.statusCode == 201) {
      return response.body;
    } else {
      logger.e(response.body);

      showToast(msg: "Some Thing Went Wrong");
      return '';
    }
  }

  static Future<String> simplePost(String feedUrl) async {
    showProgressCircular();
    http.Response response = await http.post(Uri.parse(BASE_URL + feedUrl));
    dismissDialog();
    if (response.statusCode == 200) {
      return response.body;
    }
    logger.e(response.statusCode);
    logger.e(response.body);
    return "";
  }









}
