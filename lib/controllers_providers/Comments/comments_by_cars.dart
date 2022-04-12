import 'package:auction/api_services.dart';
import 'package:auction/controllers_providers/auth_provider.dart';
import 'package:auction/models/comments/comments.dart';
import 'package:auction/utils/const.dart';
import 'package:auction/utils/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

var commentProvider=Provider.of<CommentProvider>(Get.context!,listen: false);




class CommentProvider extends ChangeNotifier {
  CommentsByCars? commentsByCars;
  String? commentText;
  bool  isLoaded=false;

  void getComments(carID) async {
    // commentsByCars=null;
    String body =
        await ApiServices.simpleGet("Comments/get-comments-by-car?carId=$carID");
    if (body.isEmpty) return;
    commentsByCars=null;
    isLoaded=false;
    notifyListeners();
await Future.delayed(Duration.zero);

    commentsByCars = commentsByCarsFromJson(body);
     isLoaded=true;
     logger.i(isLoaded);
     notifyListeners();
  }

  void postComment(carID)async{
    Map<String,String> body={
      "comment": commentText!,
      "userId": getUser().result!.id.toString(),
      "carId": carID,
      "commentDate": DateTime.now().toString()
    };

  String result=await  ApiServices.simplePostWithBody("Comments/add-comments", body);
  if(result.isEmpty){showToast(msg: "Something went wrong");return ;}






  }
}
