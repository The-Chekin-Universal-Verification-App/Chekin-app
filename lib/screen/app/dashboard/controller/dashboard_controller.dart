import 'dart:developer';

import 'package:chekin/models/all_business.dart';
import 'package:chekin/services/api_calls.dart';
import 'package:chekin/shared/custom_toast.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController {
  RxList<Business> businesses = RxList<Business>();
  RxBool load = RxBool(false);
  RxBool loadingBusiness = RxBool(false);
  RxString apiError = RxString("");

  getAllBusinesss() async {
    try {
      loadingBusiness.value = true;
      var req = await APICalls().getAllBusinesses();
      log(req.toString());
      if (req.isNotEmpty) {
        if (req['status'] == "error") {
          apiError.value = req['message'];
          cToast(title: "Notice!", message: apiError.value);
          loadingBusiness.value = false;
        } else {
          //log(req['data']['data'].toString());
          businesses.value = (req['data']['data'] as List)
              .map((e) => Business.fromJson(e))
              .toList();

          log(businesses.length.toString());
          loadingBusiness.value = false;
        }
      } else {
        cToast(title: "Notice!", message: "Unable to load moods at this time");
        loadingBusiness.value = false;
      }
    } catch (e) {
      log(e.toString());
      loadingBusiness.value = false;
    }
  }

  @override
  void onReady() {
    getAllBusinesss();
    super.onReady();
  }
}
