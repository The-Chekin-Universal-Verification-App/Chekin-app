import 'package:flutter/material.dart';
import 'package:chekinapp/export.dart';
import 'package:chekinapp/res/res.dart';
import 'dart:math';

class Mock {
  String get userName => 'Janet Jackson';
  String idVerification(bool status) =>
      'ID ${status == true ? 'Verified' : 'Not Verified'}';

  static List<Map<String, dynamic>> navItems = [
    {"icon": R.png.home2.svg, "label": "Home", 'setIndex': 0},
    {"icon": R.png.dashboard.svg, "label": "Contracts", 'setIndex': 1},
    {
      "icon": R.png.heart2.svg,
      "label": "messages",
      'setIndex': 2,
    },
    {"icon": R.png.settings.svg, "label": "Account", 'setIndex': 3},
  ];

  List<Map<String, dynamic>> getOnboards(BuildContext context) {
    return [
      {
        'page': IntroImage(
          onboardImg: R.png.onBoardingOne.imgPng,
        ),
        'title': context.loc.welcomeTo,
        'subtitle': context.loc.introOneSubTitle,
      },
      {
        'page': IntroImage(
          onboardImg: R.png.onBoardingTwo.imgPng,
        ),
        'title': context.loc.welcomeTo,
        'subtitle': context.loc.introTwoSubTitle,
      },
      {
        'page': IntroImage(
          onboardImg: R.png.onBoardingThree.imgPng,
        ),
        'title': context.loc.welcomeTo,
        'subtitle': context.loc.introTwoSubTitle,
      },
    ];
  }

  List<Map<String, dynamic>> getUserTypes(BuildContext context) {
    return [
      {
        'page': IntroImage(
          onboardImg: R.png.womanTakingPic.imgPng,
        ),
        'title': context.loc.user,
        'subtitle': context.loc.youAreABuyer,
      },
      {
        'page': IntroImage(
          onboardImg: R.png.sittingMan.imgPng,
        ),
        'title': context.loc.businessOwner,
        'subtitle': context.loc.beVerified,
      },
    ];
  }

  // List<ProductModel> topRated = [
  //   ProductModel(
  //     images: [R.png.bag.imgPng],
  //     name: R.S.productName,
  //     business: R.S.storeName,
  //   ),
  //   ProductModel(
  //     images: [
  //       R.png.silverLadyShoe.imgPng,
  //     ],
  //     name: R.S.productName3,
  //     business: R.S.storeName,
  //   ),
  //   ProductModel(
  //     images: [R.png.silverLadyShoe.imgPng],
  //     name: R.S.productName2,
  //     business: R.S.storeName,
  //   ),
  //   ProductModel(
  //     images: [R.png.silverLadyShoe.imgPng],
  //     name: R.S.productName3,
  //     business: R.S.storeName,
  //   ),
  // ];

  ///
  ///
  ///
  ///
  /// API endpoints starts here
  ///
  static const String api = '/api/v1';

  final String signUp = '$api/auth/signup/user';
  final String signUpBiz = '$api/auth/signup/business';
  final String logIn = '$api/auth/login';
  final String getUser = '$api/user';
  final String verifyMail = '$api/auth/verify-user';
  final String resendOTP = '$api/auth/request-verification';
  final String forgotPassword = '$api/auth/forgot-password';
  final String resetPassword = '$api/auth/reset-password';
  final String changePassword = '$api/user/change-password';
  final String getBusiness = '$api/business/';
  final String initPayment = '$api/payment/initialize-dev';
  final String getLex = '$api/business/lux-code';
  final String updateProfile = '$api/user/update-profile';
  final String updateBusiness = '$api/business/update-business';
  final String getProducts = '$api/product';
  final String getMyProducts = '$api/product/me';
  String productId(String productId) => '$api/product/$productId';
  final String getCategory = '$api/category';
  final String getWishList = '$api/user/wishlist';
  final String uploadProduct = '$api/common/upload-single-file';
  String addToWishList(String productId) => '$api/user/wishlist/$productId';
  String getBusinessByID(String bizId) => '$api/business/$bizId';
  String getBusinessReviews(String bizId) => '$api/user/reviews/$bizId';
  String reviewABusiness(String bizId) => '$api/user/reviews/$bizId';
}

///
class IntroImage extends StatelessWidget {
  const IntroImage({Key? key, this.onboardImg, this.height}) : super(key: key);
  final String? onboardImg;
  final double? height;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 265,
      child: Image.asset(
        onboardImg ?? R.png.onBoardingOne.imgPng,
        fit: BoxFit.cover,
        // isAntiAlias: true,
      ),
    );
  }
}
