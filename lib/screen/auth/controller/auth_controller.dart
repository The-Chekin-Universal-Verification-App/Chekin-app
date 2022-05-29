import 'dart:async';
import 'dart:developer';

import 'package:chekin/constants/steps.dart';
import 'package:chekin/routes/app_pages.dart';
import 'package:chekin/services/storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController middleNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController nationalityController = TextEditingController();
  TextEditingController lgaController = TextEditingController();
  TextEditingController stateOfOriginController = TextEditingController();
  TextEditingController businessNameController = TextEditingController();
  TextEditingController businessDescriptionController = TextEditingController();
  TextEditingController lgaOfBusinessController = TextEditingController();
  TextEditingController cityOfBusinessController = TextEditingController();
  TextEditingController nearestLandmarkController = TextEditingController();
  TextEditingController establishmentDateController = TextEditingController();
  TextEditingController phoneOneController = TextEditingController();
  TextEditingController phoneTwoController = TextEditingController();

  TextEditingController emailOneController = TextEditingController();
  TextEditingController emailTwoController = TextEditingController();
  TextEditingController instagramController = TextEditingController();
  TextEditingController twitterController = TextEditingController();
  TextEditingController facebookController = TextEditingController();
  TextEditingController tiktokController = TextEditingController();
  TextEditingController linkedinController = TextEditingController();

  RxString error = RxString("");
  RxString firstName = RxString("");
  RxString middleName = RxString("");
  RxString lastName = RxString("");
  RxString nationality = RxString("");
  RxString lga = RxString("");
  RxString stateOfOrigin = RxString("");
  RxString businessName = RxString("");
  RxString businessDescription = RxString("");
  RxString lgaOfBusiness = RxString("");
  RxString cityOfBusiness = RxString("");
  RxString nearestLandmark = RxString("");
  RxString establishmentDate = RxString("");
  RxString phoneOne = RxString("");
  RxString phoneTwo = RxString("");
  RxString emailOne = RxString("");
  RxString emailTwo = RxString("");
  RxString instagram = RxString("");
  RxString twitter = RxString("");
  RxString facebook = RxString("");
  RxString tiktok = RxString("");
  RxString linkedin = RxString("");
  
  navigate() {
    Timer(const Duration(seconds: 4), () {
      Get.toNamed(Routes.AUTH_ONBOARDING);
    });
  }
  // navigate2() async{
  //   String step = await Storage.readData("step") ?? "";
  //   log("step is  $step");
  //   Timer(const Duration(seconds: 4), () {
  //     Get.toNamed(Routes.AUTH_ONBOARDING);
  //   });
  //   switch (step) {
  //     case Steps.ONBOADING:
  //       Timer(const Duration(seconds: 1), () {
  //         Get.toNamed(Routes.AUTH_ONBOARDING);
  //       });
  //       break;
  //     case LEGALS:
  //       Timer(const Duration(seconds: 1), () {
  //         Get.toNamed(Routes.LEGALS);
  //       });
  //       break;
  //     case AUTHENTICATION:
  //       Timer(const Duration(seconds: 1), () {
  //         Get.toNamed(Routes.AUTHCHOICE);
  //       });
  //       break;
  //     case VERIFYPHONE:
  //       Timer(const Duration(seconds: 1), () {
  //         Get.toNamed(Routes.VERIFYPHONE);
  //       });
  //       break;
  //     case VERIFYEMAIL:
  //       Timer(const Duration(seconds: 1), () {
  //         Get.toNamed(Routes.VERIFYEMAIL);
  //       });
  //       break;
  //     case BASICINFO:
  //       Timer(const Duration(seconds: 1), () {
  //         Get.toNamed(Routes.BASICINFO);
  //       });
  //       break;
  //     case COMPANIONSHIP:
  //       Timer(const Duration(seconds: 1), () {
  //         Get.toNamed(Routes.COMPANIONSHIP);
  //       });
  //       break;
  //     case CREATEPIN:
  //       Timer(const Duration(seconds: 1), () {
  //         Get.toNamed(Routes.CREATE_PIN);
  //       });
  //       break;
  //     case REPEATPIN:
  //       Timer(const Duration(seconds: 1), () {
  //         Get.toNamed(Routes.CREATE_PIN);
  //       });
  //       break;
  //     case LOOKSANDINTERESTS:
  //       Timer(const Duration(seconds: 1), () {
  //         Get.toNamed(Routes.LOOKSANDINTERESTS);
  //       });
  //       break;
  //     case DONE:
  //       Timer(const Duration(seconds: 1), () {
  //         Get.toNamed(Routes.MAINVIEW);
  //       });
  //       break;
  //     default:
  //       Timer(const Duration(seconds: 1), () {
  //         Get.toNamed(Routes.AUTH_ONBOARDING);
  //       });
  //       break;
  //   }
  // }

  @override
  void onReady() {
    navigate();
    super.onReady();
  }
}
