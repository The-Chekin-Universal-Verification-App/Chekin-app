import 'dart:developer';

import 'package:chekin/models/user_profile.dart';
import 'package:chekin/services/api_calls.dart';
import 'package:chekin/shared/custom_toast.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  Rx<UserData> userData = UserData().obs;
  RxBool load = RxBool(false);
  RxString apiError = RxString("");

  getProfile() async {
    try {
      var req = await APICalls().getUserProfile();
      log(req.toString());
      if (req.isNotEmpty) {
        if (req['status'] == "error") {
          apiError.value = req['message'];
          cToast(title: "Notice!", message: apiError.value);
        } else {
          userData.value = UserData.fromJson(req['data']);
        }
      } else {
        cToast(title: "Notice!", message: "Unable to load moods at this time");
      }
    } catch (e) {
      log(e.toString());
    }
  }

  @override
  void onReady() {
    getProfile();
    super.onReady();
  }
}
