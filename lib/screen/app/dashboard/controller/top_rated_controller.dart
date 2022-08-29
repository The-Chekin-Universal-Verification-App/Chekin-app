import 'dart:developer';

import 'package:chekin/models/review.dart';
import 'package:chekin/screen/app/user/controller/user_controller.dart';
import 'package:chekin/services/api_calls.dart';
import 'package:chekin/shared/custom_toast.dart';
import 'package:get/get.dart';

class TopRatedController extends GetxController {
  final UserController _userController = Get.find<UserController>();
  RxList<Review> reviews = RxList<Review>();
  RxBool loadingReviews = RxBool(false);
  RxString apiError = RxString("");

  getBusinessReviews() async {
    log('Fetching reviews');
    try {
      loadingReviews.value = true;
      var req = await APICalls()
          .getBusinessReviews(_userController.userData.value.id ?? '');
      log(req.toString());
      if (req.isNotEmpty) {
        if (req['status'] == "error") {
          apiError.value = req['message'];
          cToast(title: "Notice!", message: apiError.value);
          loadingReviews.value = false;
        } else {
          //log(req['data']['data'].toString());
          reviews.value = (req['data']['data'] as List)
              .map((e) => Review.fromJson(e))
              .toList();

          log(reviews.length.toString());
          loadingReviews.value = false;
        }
      } else {
        cToast(
            title: "Notice!", message: "Unable to load reviews at this time");
        loadingReviews.value = false;
      }
    } catch (e) {
      log(e.toString());
      loadingReviews.value = false;
    }
  }

  @override
  void onReady() {
    super.onReady();
  }
}
