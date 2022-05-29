import 'package:chekin/constants/value.dart';
import 'package:chekin/routes/app_pages.dart';
import 'package:chekin/screen/auth/controller/auth_controller.dart';
import 'package:chekin/shared/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:chekin/shared/action_button.dart';
import 'package:chekin/shared/custom_text.dart';
import 'package:chekin/utils/colors.dart';
import 'package:chekin/utils/sizes.dart';

class BusinessOne extends StatelessWidget {
  const BusinessOne({Key? key}) : super(key: key);

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
                              hint: "First Name",
                              controller: authController.firstNameController,
                              error: authController.error.value,
                              inputType: TextInputType.text,
                              validFunction: (v) => v!,
                              onSavedFunction: (s) => {
                                if (s.isNotEmpty)
                                  {
                                    authController.error.value = '',
                                    authController.firstName.value = s,
                                    //print(email);
                                  }
                                else
                                  {
                                    authController.error.value = "Invalid Name",
                                    authController.firstName.value = '',
                                  }
                              },
                            ),
                            SizedBox(height: heightSize(15)),
                            AuthTextField(
                              color: klightPrimaryColor,
                              hint: "Middle Name",
                              controller: authController.middleNameController,
                              error: authController.error.value,
                              inputType: TextInputType.text,
                              validFunction: (v) => v!,
                              onSavedFunction: (s) => {
                                if (s.isNotEmpty)
                                  {
                                    authController.error.value = '',
                                    authController.middleName.value = s,
                                    //print(email);
                                  }
                                else
                                  {
                                    authController.error.value = "Invalid Name",
                                    authController.middleName.value = '',
                                  }
                              },
                            ),
                            SizedBox(height: heightSize(15)),
                            AuthTextField(
                              color: klightPrimaryColor,
                              hint: "Last Name",
                              controller: authController.lastNameController,
                              error: authController.error.value,
                              inputType: TextInputType.text,
                              validFunction: (v) => v!,
                              onSavedFunction: (s) => {
                                if (s.isNotEmpty)
                                  {
                                    authController.error.value = '',
                                    authController.lastName.value = s,
                                    //print(email);
                                  }
                                else
                                  {
                                    authController.error.value = "Invalid Name",
                                    authController.lastName.value = '',
                                  }
                              },
                            ),
                            SizedBox(height: heightSize(15)),
                            AuthTextField(
                              color: klightPrimaryColor,
                              hint: "Nationality",
                              controller: authController.nationalityController,
                              error: authController.error.value,
                              inputType: TextInputType.text,
                              validFunction: (v) => v!,
                              onSavedFunction: (s) => {
                                if (s.isNotEmpty)
                                  {
                                    authController.error.value = '',
                                    authController.nationality.value = s,
                                    //print(email);
                                  }
                                else
                                  {
                                    authController.error.value = "Invalid Name",
                                    authController.nationality.value = '',
                                  }
                              },
                            ),
                            SizedBox(height: heightSize(15)),
                            AuthTextField(
                              color: klightPrimaryColor,
                              hint: "L.G.A of Origin",
                              controller: authController.lgaController,
                              error: authController.error.value,
                              inputType: TextInputType.text,
                              validFunction: (v) => v!,
                              onSavedFunction: (s) => {
                                if (s.isNotEmpty)
                                  {
                                    authController.error.value = '',
                                    authController.lga.value = s,
                                    //print(email);
                                  }
                                else
                                  {
                                    authController.error.value = "Invalid LGA",
                                    authController.lga.value = '',
                                  }
                              },
                            ),
                            SizedBox(height: heightSize(15)),
                            AuthTextField(
                              color: klightPrimaryColor,
                              hint: "State of Origin",
                              controller:
                                  authController.stateOfOriginController,
                              error: authController.error.value,
                              inputType: TextInputType.text,
                              validFunction: (v) => v!,
                              onSavedFunction: (s) => {
                                if (s.isNotEmpty)
                                  {
                                    authController.error.value = '',
                                    authController.stateOfOrigin.value = s,
                                    //print(email);
                                  }
                                else
                                  {
                                    authController.error.value =
                                        "Invalid stateOfOrigin",
                                    authController.stateOfOrigin.value = '',
                                  }
                              },
                            ),
                            SizedBox(height: heightSize(15)),
                            AuthTextField(
                              color: klightPrimaryColor,
                              hint: "Business Name",
                              controller: authController.businessNameController,
                              error: authController.error.value,
                              inputType: TextInputType.text,
                              validFunction: (v) => v!,
                              onSavedFunction: (s) => {
                                if (s.isNotEmpty)
                                  {
                                    authController.error.value = '',
                                    authController.businessName.value = s,
                                    //print(email);
                                  }
                                else
                                  {
                                    authController.error.value =
                                        "Invalid Business Name",
                                    authController.businessName.value = '',
                                  }
                              },
                            ),
                            SizedBox(height: heightSize(15)),
                            AuthTextField(
                              color: klightPrimaryColor,
                              hint: "Business Description",
                              controller:
                                  authController.businessDescriptionController,
                              error: authController.error.value,
                              inputType: TextInputType.text,
                              validFunction: (v) => v!,
                              onSavedFunction: (s) => {
                                if (s.isNotEmpty)
                                  {
                                    authController.error.value = '',
                                    authController.businessDescription.value =
                                        s,
                                    //print(email);
                                  }
                                else
                                  {
                                    authController.error.value =
                                        "Invalid Business Description",
                                    authController.businessDescription.value =
                                        '',
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
                        Get.toNamed(Routes.BUSINESS_TWO);
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
