import 'package:auction/controllers_providers/Comments/comments_by_coupon.dart';
import 'package:auction/models/GetCoupon/getCoupons.dart';
import 'package:auction/utils/const.dart';
import 'package:auction/utils/widgets.dart';
import 'package:auction/views/home/create_campaign_Screens/car_specs.dart';
import 'package:flutter/material.dart';
import 'package:get_time_ago/get_time_ago.dart';
import 'package:provider/provider.dart';

class CouponCommentScreen extends StatefulWidget {
  final Result? result;

  const CouponCommentScreen({Key? key, this.result}) : super(key: key);

  @override
  State<CouponCommentScreen> createState() => _CouponCommentScreenState(result);
}

class _CouponCommentScreenState extends State<CouponCommentScreen> {
  Result? result;

  _CouponCommentScreenState(this.result);

  final formKey = GlobalKey<FormState>();
  TextEditingController textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    commentByCouponProvider.getComments(result!.id.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CommentByCoupon>(
      builder: (BuildContext context, data, Widget? child) {
        return Scaffold(
          appBar: CustomAppBar.appBar(title: "Comments", action: [
            InkWell(
                onTap: () {},
                child: const Icon(Icons.add_shopping_cart_outlined)),
            WhiteSpacer.horizontalSpace(20),
          ]),
          body: StaticKPadding.kPadding(
              child: data.loaded
                  ? Form(
                      key: formKey,
                      child: Column(
                        children: [
                          WhiteSpacer.verticalSpace(20),
                          Expanded(
                            child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: data.loaded &&  data.getCouponComments!=null ?
                              data.getCouponComments!.result.length: 0,
                              physics: const ScrollPhysics(),
                              itemBuilder: (BuildContext context, int index) {
                                var value =
                                    data.getCouponComments!.result[index];

                                String timestamp = value.created.toString();
                                DateTime convertedTimestamp =
                                    DateTime.parse(timestamp);
                                var timeResult =
                                    GetTimeAgo.parse(convertedTimestamp);
                                return commentSection(
                                    name: value.username,
                                    imageUrl: imageUrl,
                                    comment: value.comment,
                                    time: timeResult);
                              },
                            ),
                          ),
                          customTextFormField(
                            controller: textEditingController,
                            isOutLinedBorder: true,
                            onChange: (v) {
                              data.comment = v;
                            },
                            validator: (v) {
                              if (v!.isEmpty) return "Please Write Something";
                              return null;
                            },
                            hintText: "Type here",
                            borderColor: AppColors.greyColor,
                          ),
                          WhiteSpacer.verticalSpace(10),
                          customizedButton(
                              buttonText: "Post Comment",
                              buttonWidth: .9,
                              radius: 15,
                              buttonColor: AppColors.blueColor,
                              onTap: () async {
                                if (formKey.currentState!.validate()) {
                                  await data.postComment(result!.id.toString());
                                  textEditingController.clear();
                                  commentByCouponProvider.getComments(result!.id.toString());
                                }
                              },
                              textColor: AppColors.whiteColor)
                        ],
                      ),
                    )

                      : Center(
                          child: CircularProgressIndicator(
                            color: AppColors.orangeColor,
                          ),
                        )),
        );
      },
    );
  }
}
