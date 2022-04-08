// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

// import '../screens/app/controller/app_controller.dart';

// modalSetup(context,
//     {required double modalPercentageHeight,
//     required Widget createPage,
//     required bool showBarrierColor}) {
//   AppController appController = Get.find<AppController>();
//   return showBarModalBottomSheet(
//     duration: const Duration(milliseconds: 100),
//     shape: const RoundedRectangleBorder(
//       borderRadius: BorderRadius.only(
//           topLeft: Radius.circular(30), topRight: Radius.circular(30)),
//     ),
//     context: context,
//     barrierColor: showBarrierColor == true
//         ? Colors.black.withOpacity(.6)
//         : Colors.transparent,
//     builder: (context) => Obx(
//       () => AnimatedContainer(
//         duration: const Duration(milliseconds: 500),
//         height: appController.keyBoardActive.value
//             ? MediaQuery.of(context).size.height * modalPercentageHeight +
//                 MediaQuery.of(context).viewInsets.bottom
//             : MediaQuery.of(context).size.height * modalPercentageHeight,
//         child: createPage,
//       ),
//     ),
//   );
// }
