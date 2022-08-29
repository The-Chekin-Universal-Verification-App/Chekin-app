import 'package:chekin/screen/app/dashboard/controller/dashboard_controller.dart';
import 'package:chekin/screen/app/dashboard/controller/top_rated_controller.dart';
import 'package:get/get.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(DashboardController());
    Get.put(TopRatedController());
  }
}
