import 'package:chekin/screen/app/global/controller/global_controller.dart';
import 'package:get/get.dart';

class GlobalBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(GlobalController());
  }
}
