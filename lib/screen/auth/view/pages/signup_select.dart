import 'package:chekin/constants/value.dart';
import 'package:chekin/routes/app_pages.dart';
import 'package:chekin/shared/action_button.dart';
import 'package:chekin/shared/custom_text.dart';
import 'package:chekin/utils/colors.dart';
import 'package:chekin/utils/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';

class SignupSelect extends StatelessWidget {
  const SignupSelect({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
                    padding: const EdgeInsets.all(18),
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
                          text: 'Who are you ?',
                          color: kBlackColor,
                          size: 25,
                          fontFamily: 'Lufga-SemiBold',
                          fontWeight: FontWeight.w600,
                        ),
                        SizedBox(height: heightSize(6)),
                        const CText(
                          text: 'Select who you want to be',
                          color: kBlackColor,
                          size: 15,
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(height: heightSize(62)),
                          Container(
                            height: heightSize(100),
                            width: widthSize(100),
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(Values().buttonRadius),
                              border: Border.all(color: kBlackColor, width: 2),
                            ),
                            child: const Center(
                              child: Icon(
                                Feather.user,
                                color: kBlackColor,
                                size: 44,
                              ),
                            ),
                          ),
                          SizedBox(height: heightSize(14)),
                          Container(
                            height: heightSize(40),
                            width: constraints.maxWidth,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(Values().buttonRadius),
                              border: Border.all(
                                  color: kBlackColor.withOpacity(0.5)),
                            ),
                            child: const Center(
                              child: CText(
                                text: "User",
                                fontFamily: 'Lufga-Medium',
                              ),
                            ),
                          ),
                          SizedBox(height: heightSize(26)),
                          Container(
                            height: heightSize(100),
                            width: widthSize(100),
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(Values().buttonRadius),
                              border: Border.all(color: kBlackColor, width: 2),
                            ),
                            child: const Center(
                              child: Icon(
                                Feather.users,
                                color: kBlackColor,
                                size: 44,
                              ),
                            ),
                          ),
                          SizedBox(height: heightSize(14)),
                          Container(
                            height: heightSize(40),
                            width: constraints.maxWidth,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(Values().buttonRadius),
                              border: Border.all(
                                  color: kBlackColor.withOpacity(0.5)),
                            ),
                            child: const Center(
                              child: CText(
                                text: "Business Owner",
                                fontFamily: 'Lufga-Medium',
                              ),
                            ),
                          ),
                          const Spacer(),
                          ActionButton(
                            text: "Continue",
                            callback: () {
                              Get.toNamed(Routes.BUSINESS_ONE);
                            },
                          ),
                          SizedBox(height: heightSize(12)),
                          const CText(
                            text:
                                'By clicking Continue, you agree to \neither be a User or a Business Owner',
                            textAlign: TextAlign.center,
                            size: 15,
                            height: 1.1,
                          ),
                          SizedBox(height: heightSize(14)),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            }),
          ),
        ),
      ),
    );
  
  }
}
