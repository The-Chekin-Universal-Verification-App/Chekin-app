import 'package:chekin/routes/app_pages.dart';
import 'package:chekin/screen/auth/controller/auth_controller.dart';
import 'package:chekin/shared/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:chekin/shared/action_button.dart';
import 'package:chekin/shared/custom_text.dart';
import 'package:chekin/utils/colors.dart';
import 'package:chekin/utils/sizes.dart';
import 'package:chekin/constants/value.dart';

class BusinessImage extends StatelessWidget {
  const BusinessImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    AuthController authController = Get.find();
    return WillPopScope(
      onWillPop: (() async=> false),
      child: Scaffold(
        backgroundColor: kBackgroundColor,
        body: SafeArea(
          child: SizedBox(
            height: size.height,
            width: size.width,
            child: LayoutBuilder(
              builder: ((context, constraints) {
                return Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.fromLTRB(18, 18, 18, 8),
                      color: kPrimaryColor,
                      height: heightSize(149),
                      width: constraints.maxWidth,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GestureDetector(
                              onTap: () {
                                Get.back();
                              },
                              child: const Icon(Icons.arrow_back_ios)),
                          SizedBox(height: heightSize(31)),
                          const CText(
                            text: 'Business Image',
                            color: kBlackColor,
                            size: 25,
                            fontFamily: 'Lufga-SemiBold',
                            fontWeight: FontWeight.w600,
                          ),
                          SizedBox(height: heightSize(6)),
                          const CText(
                            text: 'Upload your business Image.',
                            color: kBlackColor,
                            size: 15,
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(height: heightSize(45)),
                              const CircleAvatar(
                                radius: 100,
                                backgroundColor: kGreyColor,
                                child: Icon(
                                  Feather.user,
                                  color: kBlackColor,
                                  size: 100,
                                ),
                              ),
                              //SizedBox(height: heightSize(41)),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18.0),
                      child: ActionButton(
                        text: 'Upload Business Image',
                        callback: () {
                          Get.toNamed(Routes.PROFILE_IMAGE);
                        },
                      ),
                    ),
                    SizedBox(height: heightSize(12)),
                    const CText(
                      text:
                          'By clicking Continue, you agree with our \nTerms and Conditions',
                      textAlign: TextAlign.center,
                      size: 15,
                      height: 1.1,
                    ),
                    SizedBox(height: heightSize(14)),
                  ],
                );
              }),
            ),
          ),
        ),
      ),
    );
  }
}
