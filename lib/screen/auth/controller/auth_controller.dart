import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:chekin/constants/steps.dart';
import 'package:chekin/routes/app_pages.dart';
import 'package:chekin/services/api_calls.dart';
import 'package:chekin/services/storage.dart';
import 'package:chekin/shared/custom_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_paystack/flutter_paystack.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
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

  TextEditingController verificationPINController = TextEditingController();

  TextEditingController signinEmailController = TextEditingController();
  TextEditingController signinPasswordController = TextEditingController();

  RxString error = RxString("");
  RxString firstName = RxString("");
  RxString password = RxString("");
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

  RxString signinEmail = RxString("");
  RxString signinPassword = RxString("");

  RxBool load = RxBool(false);
  RxString apiError = RxString("");

  RxBool isSelectedBusiness = RxBool(false);
  RxBool isSelctedUser = RxBool(false);

  RxBool isMontlyPayment = RxBool(false);
  RxBool isYearlyPayment = RxBool(false);
  RxBool isLifetimePayment = RxBool(false);
  RxString paymentOption = RxString("");

  String paystackPublicKey = dotenv.env['PAYSTACK_KEY']!;
  final plugin = PaystackPlugin();

  RxString luxCode = RxString("");

  selectBusiness() {
    isSelectedBusiness.value = true;
    isSelctedUser.value = false;
  }

  selectUser() {
    isSelctedUser.value = true;
    isSelectedBusiness.value = false;
  }

  selectMontlyPayment() {
    paymentOption.value = 'monthly';
    isMontlyPayment.value = true;
    isYearlyPayment.value = false;
    isLifetimePayment.value = false;
  }

  selectYearlyPayment() {
    paymentOption.value = 'yearly';
    isYearlyPayment.value = true;
    isMontlyPayment.value = false;
    isLifetimePayment.value = false;
  }

  selectLifetimePayment() {
    paymentOption.value = 'lifetime';
    isLifetimePayment.value = true;
    isYearlyPayment.value = false;
    isMontlyPayment.value = false;
  }

  String _getReference() {
    String platform;
    if (Platform.isIOS) {
      platform = 'iOS';
    } else {
      platform = 'Android';
    }

    return 'ChargedFromChekin${platform}_${DateTime.now().millisecondsSinceEpoch}';
  }

  signupBusiness() async {
    try {
      load.value = true;
      var data = {
        "email": emailOne.value.trim(),
        "password": password.value.trim(),
        "firstName": firstName.value.trim(),
        "middleName": middleName.value.trim(),
        "lastName": lastName.value.trim(),
        "nationality": nationality.value.trim(),
        "phoneNumber": lga.value.trim(),
        "state": stateOfOrigin.value.trim(),
        "lga": lgaOfBusiness.value.trim(),
        "businessName": businessName.value.trim(),
        "businessDescription": businessDescription.value.trim(),
        "lgaOfBusiness": lgaOfBusiness.value.trim(),
        "stateOfBusiness": stateOfOrigin.value.trim(),
        "cityOfBusiness": cityOfBusiness.value.trim(),
        "nearestLandmark": nearestLandmark.value.trim(),
        "dateEstablished": establishmentDate.value.trim(),
        "phoneNumber1": phoneOne.value.trim(),
        "phoneNumber2": phoneTwo.value.trim(),
        "email1": emailOne.value.trim(),
        "email2": emailTwo.value.trim(),
        "instagram": instagram.value.trim(),
        "twitter": twitter.value.trim(),
        "facebook": facebook.value.trim(),
        "tiktok": tiktok.value.trim(),
        "linkedIn": linkedin.value.trim(),
      };
      log(data.toString());
      var req = await APICalls().signupBusiness(data);
      log(req.toString());
      if (req.isNotEmpty) {
        if (req['status'] == "error") {
          apiError.value = req['message'];
          cToast(title: "Notice!", message: apiError.value);
          load.value = false;
        } else {
          load.value = false;
          Get.toNamed(Routes.EMAIL_VERIFY);
          //log(req['data'].toString());

          // log(moods.toString());
        }
      } else {
        load.value = false;
        cToast(title: "Notice!", message: "Unable to load data at this time");
      }
    } catch (e) {
      log(e.toString());
      load.value = false;
    }
  }

  signupUser() async {
    try {
      load.value = true;
      var data = {
        "email": emailOne.value,
        "password": password.value,
        "firstName": firstName.value,
        "middleName": middleName.value,
        "lastName": lastName.value,
        "nationality": nationality.value,
        "phoneNumber": phoneOne.value,
      };
      log(data.toString());
      var req = await APICalls().signupUser(data);
      log(req.toString());
      if (req.isNotEmpty) {
        if (req['status'] == "error") {
          apiError.value = req['message'];
          cToast(title: "Notice!", message: apiError.value);
          load.value = false;
        } else {
          await Storage.setStep(Steps.PAYMENT_INFO);
          load.value = false;
          Get.toNamed(Routes.PAYMENT_INFO);
          //log(req['data'].toString());

          // log(moods.toString());
        }
      } else {
        cToast(title: "Notice!", message: "Unable to load moods at this time");
        load.value = false;
      }
    } catch (e) {
      log(e.toString());
      load.value = false;
    }
  }

  login() async {
    try {
      load.value = true;
      var data = {
        "email": signinEmail.value.trim(),
        "password": signinPassword.value.trim(),
      };
      log(data.toString());
      var req = await APICalls().login(data);
      log(req.toString());
      if (req.isNotEmpty) {
        if (req['status'] == "error") {
          apiError.value = req['message'];
          cToast(title: "Notice!", message: apiError.value);
          load.value = false;
        } else {
          log(req['data']['token']);
          await Storage.saveData('token', req['data']['token']);
          await Storage.setStep(Steps.DONE);
          load.value = false;
          Get.toNamed(Routes.MAIN_APP);
        }
      } else {
        load.value = false;
        cToast(title: "Notice!", message: "Unable to load moods at this time");
      }
    } catch (e) {
      log(e.toString());
      load.value = false;
    }
  }

  verifyEmail() async {
    try {
      load.value = true;
      var data = {
        "email": emailOne.value.trim(),
        "code": verificationPINController.text.trim(),
      };
      log(data.toString());
      var req = await APICalls().verifyUserEmail(data);
      log(req.toString());
      if (req.isNotEmpty) {
        if (req['status'] == "error") {
          apiError.value = req['message'];
          cToast(title: "Notice!", message: apiError.value);
          load.value = false;
        } else {
          log(req['data']['token']);
          await Storage.setStep(Steps.PAYMENT_INFO);
          await Storage.saveData('token', req['data']['token']);
          load.value = false;
          Get.toNamed(Routes.PAYMENT_INFO);
        }
      } else {
        cToast(title: "Notice!", message: "Unable to load moods at this time");
        load.value = false;
      }
    } catch (e) {
      log(e.toString());
      load.value = false;
    }
  }

  initializePayment(context) async {
    try {
      load.value = true;
      var data = {
        "paymentOption": paymentOption.value,
      };
      log(data.toString());
      var req = await APICalls().initializePayment(data);
      log(req.toString());
      if (req.isNotEmpty) {
        if (req['status'] == "error") {
          apiError.value = req['message'];
          cToast(title: "Notice!", message: apiError.value);
          load.value = false;
        } else {
          String reference = _getReference();
          String amount = "${req['data']['amount']}00";
          Charge charge = Charge()
            ..amount = int.parse(amount)
            ..reference = reference
            // or ..accessCode = _getAccessCodeFrmInitialization()
            ..email = 'customer@email.com';
          CheckoutResponse response = await plugin.checkout(
            context,
            method:
                CheckoutMethod.card, // Defaults to CheckoutMethod.selectable
            charge: charge,
          );
          if (response.status == true) {
            log('funding from api');
            cToast(title: "Success", message: " Updating account...");
            load.value = false;
            await Storage.setStep(Steps.GET_LUX_CODE);
            Get.toNamed(Routes.PAYMENT_INFO_TWO);
            load.value = false;
          }
          // //Get.toNamed(Routes.PAYMENT_INFO_TWO);

          load.value = false;
        }
      } else {
        cToast(title: "Notice!", message: "Unable to load data at this time");
        load.value = false;
      }
    } catch (e) {
      log(e.toString());
      load.value = false;
    }
  }

  getLUXCode() async {
    try {
      load.value = true;

      var req = await APICalls().getLUXCode();
      log(req.toString());
      if (req.isNotEmpty) {
        if (req['status'] == "error") {
          apiError.value = req['message'];
          cToast(title: "Notice!", message: apiError.value);
          load.value = false;
        } else {
          luxCode.value = req['data'].toString().split('-').last;
          log(luxCode.value);
          load.value = false;
          Get.toNamed(Routes.VERIFICATION_TWO);
        }
      } else {
        cToast(title: "Notice!", message: "Unable to load data at this time");
        load.value = false;
      }
    } catch (e) {
      log(e.toString());
      load.value = false;
    }
  }

  navigate() {
    Timer(const Duration(seconds: 4), () {
      Get.toNamed(Routes.AUTH_ONBOARDING);
    });
  }

  navigate2() async {
    String step = await Storage.readData("step") ?? "";
    log("step is  $step");

    switch (step) {
      case Steps.ONBOADING:
        Timer(const Duration(seconds: 4), () {
          Get.toNamed(Routes.AUTH_ONBOARDING);
        });
        break;
      case Steps.SIGNUP_SELECT:
        Timer(const Duration(seconds: 4), () {
          Get.toNamed(Routes.SIGNUP_SELECT);
        });
        break;
      case Steps.SIGN_IN:
        Timer(const Duration(seconds: 4), () {
          Get.toNamed(Routes.SIGN_IN);
        });
        break;
      case Steps.PAYMENT_INFO:
        Timer(const Duration(seconds: 4), () {
          Get.toNamed(Routes.PAYMENT_INFO);
        });
        break;

      case Steps.GET_LUX_CODE:
        Timer(const Duration(seconds: 4), () {
          Get.toNamed(Routes.PAYMENT_INFO_TWO);
        });
        break;

      case Steps.DONE:
        Timer(const Duration(seconds: 4), () {
          Get.toNamed(Routes.MAIN_APP);
        });
        break;

      default:
        Timer(const Duration(seconds: 4), () {
          Get.toNamed(Routes.AUTH_ONBOARDING);
        });
        break;
    }
  }

  @override
  void onReady() {
    navigate2();
    plugin.initialize(publicKey: paystackPublicKey);
    super.onReady();
  }
}
