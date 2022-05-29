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

class BusinessTwo extends StatelessWidget {
  const BusinessTwo({Key? key}) : super(key: key);

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
                                  color: kWhiteColor,
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
                              hint: "L.G.A of Business",
                              controller:
                                  authController.lgaOfBusinessController,
                              error: authController.error.value,
                              inputType: TextInputType.text,
                              validFunction: (v) => v!,
                              onSavedFunction: (s) => {
                                if (s.isNotEmpty)
                                  {
                                    authController.error.value = '',
                                    authController.lgaOfBusiness.value = s,
                                    //print(email);
                                  }
                                else
                                  {
                                    authController.error.value = "Invalid Name",
                                    authController.lgaOfBusiness.value = '',
                                  }
                              },
                            ),
                            SizedBox(height: heightSize(15)),
                            AuthTextField(
                              color: klightPrimaryColor,
                              hint: "City of Business",
                              controller:
                                  authController.cityOfBusinessController,
                              error: authController.error.value,
                              inputType: TextInputType.text,
                              validFunction: (v) => v!,
                              onSavedFunction: (s) => {
                                if (s.isNotEmpty)
                                  {
                                    authController.error.value = '',
                                    authController.cityOfBusiness.value = s,
                                    //print(email);
                                  }
                                else
                                  {
                                    authController.error.value = "Invalid Name",
                                    authController.cityOfBusiness.value = '',
                                  }
                              },
                            ),
                            SizedBox(height: heightSize(15)),
                            AuthTextField(
                              color: klightPrimaryColor,
                              hint: "Nearest Landmark in City of Business",
                              controller:
                                  authController.nearestLandmarkController,
                              error: authController.error.value,
                              inputType: TextInputType.text,
                              validFunction: (v) => v!,
                              onSavedFunction: (s) => {
                                if (s.isNotEmpty)
                                  {
                                    authController.error.value = '',
                                    authController.nearestLandmark.value = s,
                                    //print(email);
                                  }
                                else
                                  {
                                    authController.error.value = "Invalid Name",
                                    authController.nearestLandmark.value = '',
                                  }
                              },
                            ),
                            SizedBox(height: heightSize(15)),
                            AuthTextField(
                              color: klightPrimaryColor,
                              hint: "Date of Establishment",
                              controller:
                                  authController.establishmentDateController,
                              error: authController.error.value,
                              inputType: TextInputType.text,
                              validFunction: (v) => v!,
                              onSavedFunction: (s) => {
                                if (s.isNotEmpty)
                                  {
                                    authController.error.value = '',
                                    authController.establishmentDate.value = s,
                                    //print(email);
                                  }
                                else
                                  {
                                    authController.error.value = "Invalid Name",
                                    authController.establishmentDate.value = '',
                                  }
                              },
                            ),
                            SizedBox(height: heightSize(15)),
                            AuthTextField(
                              color: klightPrimaryColor,
                              hint: "1st Phone Number",
                              controller: authController.phoneOneController,
                              error: authController.error.value,
                              inputType: TextInputType.text,
                              validFunction: (v) => v!,
                              onSavedFunction: (s) => {
                                if (s.isNotEmpty)
                                  {
                                    authController.error.value = '',
                                    authController.phoneOne.value = s,
                                    //print(email);
                                  }
                                else
                                  {
                                    authController.error.value = "Invalid LGA",
                                    authController.phoneOne.value = '',
                                  }
                              },
                            ),
                            SizedBox(height: heightSize(15)),
                            AuthTextField(
                              color: klightPrimaryColor,
                              hint: "2nd Phone Number",
                              controller: authController.phoneTwoController,
                              error: authController.error.value,
                              inputType: TextInputType.text,
                              validFunction: (v) => v!,
                              onSavedFunction: (s) => {
                                if (s.isNotEmpty)
                                  {
                                    authController.error.value = '',
                                    authController.phoneTwo.value = s,
                                    //print(email);
                                  }
                                else
                                  {
                                    authController.error.value =
                                        "Invalid stateOfOrigin",
                                    authController.phoneTwo.value = '',
                                  }
                              },
                            ),
                            SizedBox(height: heightSize(15)),
                            AuthTextField(
                              color: klightPrimaryColor,
                              hint: "1st Email",
                              controller: authController.emailOneController,
                              error: authController.error.value,
                              inputType: TextInputType.text,
                              validFunction: (v) => v!,
                              onSavedFunction: (s) => {
                                if (s.isNotEmpty)
                                  {
                                    authController.error.value = '',
                                    authController.emailOne.value = s,
                                    //print(email);
                                  }
                                else
                                  {
                                    authController.error.value =
                                        "Invalid Business Name",
                                    authController.emailOne.value = '',
                                  }
                              },
                            ),
                            SizedBox(height: heightSize(15)),
                            AuthTextField(
                              color: klightPrimaryColor,
                              hint: "2nd Email",
                              controller: authController.emailTwoController,
                              error: authController.error.value,
                              inputType: TextInputType.text,
                              validFunction: (v) => v!,
                              onSavedFunction: (s) => {
                                if (s.isNotEmpty)
                                  {
                                    authController.error.value = '',
                                    authController.emailTwo.value = s,
                                    //print(email);
                                  }
                                else
                                  {
                                    authController.error.value =
                                        "Invalid Business Description",
                                    authController.emailTwo.value = '',
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
                        Get.toNamed(Routes.BUSINESS_THREE);
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
