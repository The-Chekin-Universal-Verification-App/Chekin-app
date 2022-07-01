import 'package:chekin/routes/app_pages.dart';
import 'package:chekin/screen/auth/controller/auth_controller.dart';
import 'package:chekin/services/extensions.dart';
import 'package:chekin/shared/custom_textfield.dart';
import 'package:chekin/shared/custom_toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:chekin/shared/action_button.dart';
import 'package:chekin/shared/custom_text.dart';
import 'package:chekin/utils/colors.dart';
import 'package:chekin/utils/sizes.dart';

class UserOne extends StatelessWidget {
  const UserOne({Key? key}) : super(key: key);

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
                              hint: "Phone Number",
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
                                    authController.error.value =
                                        "Invalid Phone Number",
                                    authController.phoneOne.value = '',
                                  }
                              },
                            ),
                            SizedBox(height: heightSize(15)),
                            AuthTextField(
                              color: klightPrimaryColor,
                              hint: "Email Address",
                              controller: authController.emailOneController,
                              error: authController.error.value,
                              inputType: TextInputType.text,
                              validFunction: (v) => v!,
                              onSavedFunction: (s) => {
                                if (s.isValidEmail())
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
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0),
                    child: ActionButton(
                      text: 'Sign Up',
                      callback: () {
                        if (authController.firstName.value.isEmpty) {
                          cToast(
                              title: "Notice",
                              message: "First name field cannot be empty.");
                        } else if (authController.middleName.value.isEmpty) {
                          cToast(
                              title: "Notice",
                              message: "Middle name field cannot be empty.");
                        } else if (authController.lastName.value.isEmpty) {
                          cToast(
                              title: "Notice",
                              message: "Last name field cannot be empty.");
                        } else if (authController.nationality.value.isEmpty) {
                          cToast(
                              title: "Notice",
                              message: "Nationality field cannot be empty.");
                        } else if (authController.phoneOne.value.isEmpty) {
                          cToast(
                              title: "Notice",
                              message: "Phone number field cannot be empty.");
                        } else if (authController.emailOne.value.isEmpty) {
                          cToast(
                              title: "Notice",
                              message: "Email address field cannot be empty.");
                        } else {
                          authController.signupUser();
                        }
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
