import 'package:chekin/routes/app_pages.dart';
import 'package:chekin/screen/auth/controller/auth_controller.dart';
import 'package:chekin/shared/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:chekin/shared/action_button.dart';
import 'package:chekin/shared/custom_text.dart';
import 'package:chekin/utils/colors.dart';
import 'package:chekin/utils/sizes.dart';
import 'package:chekin/constants/value.dart';

class BusinessThree extends StatelessWidget {
  const BusinessThree({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    AuthController authController = Get.find();
    return Scaffold(
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
                          text: 'Sign up !',
                          color: kBlackColor,
                          size: 25,
                          fontFamily: 'Lufga-SemiBold',
                          fontWeight: FontWeight.w600,
                        ),
                        SizedBox(height: heightSize(6)),
                        const CText(
                          text: 'Create account by filling the form below .',
                          color: kBlackColor,
                          size: 15,
                        ),
                        const Spacer(),
                        Row(
                          children: [
                            SizedBox(width: widthSize(4)),
                            Expanded(
                              child: Container(
                                height: 5,
                                decoration: BoxDecoration(
                                  color: const Color(0xFF516DB5),
                                  borderRadius: BorderRadius.circular(
                                    Values().buttonRadius,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: widthSize(4)),
                            Expanded(
                              child: Container(
                                height: 5,
                                decoration: BoxDecoration(
                                  color: const Color(0xFF516DB5),
                                  borderRadius: BorderRadius.circular(
                                    Values().buttonRadius,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: widthSize(4)),
                            Expanded(
                              child: Container(
                                height: 5,
                                decoration: BoxDecoration(
                                  color: kWhiteColor,
                                  borderRadius: BorderRadius.circular(
                                    Values().buttonRadius,
                                  ),
                                ),
                              ),
                            ),
                          ],
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
                            AuthTextField(
                              color: klightPrimaryColor,
                              hint: "Instagram Handle",
                              controller: authController.instagramController,
                              error: authController.error.value,
                              inputType: TextInputType.text,
                              validFunction: (v) => v!,
                              onSavedFunction: (s) => {
                                if (s.isNotEmpty)
                                  {
                                    authController.error.value = '',
                                    authController.instagram.value = s,
                                    //print(email);
                                  }
                                else
                                  {
                                    authController.error.value = "Invalid Name",
                                    authController.instagram.value = '',
                                  }
                              },
                            ),
                            SizedBox(height: heightSize(15)),
                            AuthTextField(
                              color: klightPrimaryColor,
                              hint: "Twitter Handle",
                              controller: authController.twitterController,
                              error: authController.error.value,
                              inputType: TextInputType.text,
                              validFunction: (v) => v!,
                              onSavedFunction: (s) => {
                                if (s.isNotEmpty)
                                  {
                                    authController.error.value = '',
                                    authController.twitter.value = s,
                                    //print(email);
                                  }
                                else
                                  {
                                    authController.error.value = "Invalid Name",
                                    authController.twitter.value = '',
                                  }
                              },
                            ),
                            SizedBox(height: heightSize(15)),
                            AuthTextField(
                              color: klightPrimaryColor,
                              hint: "Facebook Handle",
                              controller: authController.facebookController,
                              error: authController.error.value,
                              inputType: TextInputType.text,
                              validFunction: (v) => v!,
                              onSavedFunction: (s) => {
                                if (s.isNotEmpty)
                                  {
                                    authController.error.value = '',
                                    authController.facebook.value = s,
                                    //print(email);
                                  }
                                else
                                  {
                                    authController.error.value = "Invalid Name",
                                    authController.facebook.value = '',
                                  }
                              },
                            ),
                            SizedBox(height: heightSize(15)),
                            AuthTextField(
                              color: klightPrimaryColor,
                              hint: "Tiktok Handle",
                              controller: authController.tiktokController,
                              error: authController.error.value,
                              inputType: TextInputType.text,
                              validFunction: (v) => v!,
                              onSavedFunction: (s) => {
                                if (s.isNotEmpty)
                                  {
                                    authController.error.value = '',
                                    authController.tiktok.value = s,
                                    //print(email);
                                  }
                                else
                                  {
                                    authController.error.value = "Invalid Name",
                                    authController.tiktok.value = '',
                                  }
                              },
                            ),
                            SizedBox(height: heightSize(15)),
                            AuthTextField(
                              color: klightPrimaryColor,
                              hint: "LinkedIn Handle",
                              controller: authController.linkedinController,
                              error: authController.error.value,
                              inputType: TextInputType.text,
                              validFunction: (v) => v!,
                              onSavedFunction: (s) => {
                                if (s.isNotEmpty)
                                  {
                                    authController.error.value = '',
                                    authController.linkedin.value = s,
                                    //print(email);
                                  }
                                else
                                  {
                                    authController.error.value = "Invalid LGA",
                                    authController.linkedin.value = '',
                                  }
                              },
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
                      text: 'Continue',
                      callback: () {
                        Get.toNamed(Routes.BUSINESS_IMAGE);
                      },
                    ),
                  ),
                  SizedBox(height: heightSize(12)),
                  const CText(
                    text:
                        'Fill in details, asterics are \nCompulsory while filling',
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
    );
  }
}
