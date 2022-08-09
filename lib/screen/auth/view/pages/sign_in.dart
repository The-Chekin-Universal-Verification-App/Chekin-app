import 'package:chekin/routes/app_pages.dart';
import 'package:chekin/screen/auth/controller/auth_controller.dart';
import 'package:chekin/services/extensions.dart';
import 'package:chekin/shared/custom_textfield.dart';
import 'package:chekin/shared/custom_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:chekin/shared/action_button.dart';
import 'package:chekin/shared/custom_text.dart';
import 'package:chekin/utils/colors.dart';
import 'package:chekin/utils/sizes.dart';

class SignIn extends StatelessWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    AuthController authController = Get.find();
    return WillPopScope(
      onWillPop: () async => false,
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
                                Get.toNamed(Routes.AUTH_ONBOARDING);
                              },
                              child: const Icon(Icons.arrow_back_ios)),
                          SizedBox(height: heightSize(31)),
                          const CText(
                            text: 'Welcome Back!',
                            color: kBlackColor,
                            size: 25,
                            fontFamily: 'Lufga-SemiBold',
                            fontWeight: FontWeight.w600,
                          ),
                          SizedBox(height: heightSize(6)),
                          const CText(
                            text: 'Chekin and check out your products',
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
                              CAuthTextField(
                                prefixIcon: Icons.person_outline_sharp,
                                color: klightPrimaryColor,
                                hint: "Email",
                                controller:
                                    authController.signinEmailController,
                                error: authController.error.value,
                                inputType: TextInputType.text,
                                validFunction: (v) => v!,
                                onSavedFunction: (s) => {
                                  if (s.isValidEmail())
                                    {
                                      authController.error.value = '',
                                      authController.signinEmail.value = s,
                                      //print(email);
                                    }
                                  else
                                    {
                                      authController.error.value =
                                          "Invalid Email",
                                      authController.signinEmail.value = '',
                                    }
                                },
                              ),
                              SizedBox(height: heightSize(15)),
                              CAuthTextField(
                                color: klightPrimaryColor,
                                prefixIcon: Feather.lock,
                                hint: "Password",
                                controller:
                                    authController.signinPasswordController,
                                error: authController.error.value,
                                inputType: TextInputType.text,
                                validFunction: (v) => v!,
                                onSavedFunction: (s) => {
                                  if (s.isNotEmpty)
                                    {
                                      authController.error.value = '',
                                      authController.signinPassword.value = s,
                                      //print(email);
                                    }
                                  else
                                    {
                                      authController.error.value =
                                          "Invalid Password",
                                      authController.signinPassword.value = '',
                                    }
                                },
                              ),
                              SizedBox(height: heightSize(16)),
                              const Align(
                                alignment: Alignment.centerRight,
                                child: CText(
                                  text: 'Face Login',
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'Lufga-Medium',
                                  color: kBlackColor,
                                ),
                              ),
                              SizedBox(height: heightSize(16)),
                              Obx(
                                () => ActionButton(
                                  text: 'Sign in',
                                  callback: () {
                                    if (authController
                                        .signinEmail.value.isEmpty) {
                                      cToast(
                                          title: "Notice",
                                          message:
                                              "Email address field cannot be empty.");
                                    } else if (authController
                                        .signinPassword.value.isEmpty) {
                                      cToast(
                                          title: "Notice",
                                          message:
                                              "Password field cannot be empty.");
                                    } else {
                                      authController.login();
                                    }
                                  },
                                  load: authController.load.value,
                                ),
                              ),
                              SizedBox(height: heightSize(8)),
                              const CText(
                                text: 'Forget Password?',
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Lufga-Medium',
                                color: kBlackColor,
                              ),

                              //SizedBox(height: heightSize(41)),
                            ],
                          ),
                        ),
                      ),
                    ),
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
