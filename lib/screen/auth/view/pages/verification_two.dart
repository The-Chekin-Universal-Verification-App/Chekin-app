import 'package:chekin/constants/assets_path.dart';
import 'package:chekin/constants/steps.dart';
import 'package:chekin/constants/value.dart';
import 'package:chekin/routes/app_pages.dart';
import 'package:chekin/screen/auth/controller/auth_controller.dart';
import 'package:chekin/services/storage.dart';
import 'package:chekin/shared/custom_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:chekin/shared/action_button.dart';
import 'package:chekin/shared/custom_text.dart';
import 'package:chekin/utils/colors.dart';
import 'package:chekin/utils/sizes.dart';

class VerificationTwo extends StatelessWidget {
  const VerificationTwo({Key? key}) : super(key: key);

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
                          text: 'Verification',
                          color: kBlackColor,
                          size: 25,
                          fontFamily: 'Lufga-SemiBold',
                          fontWeight: FontWeight.w600,
                        ),
                        SizedBox(height: heightSize(6)),
                        const CText(
                          text: 'Get, Copy and Save your unique LUX code',
                          color: kBlackColor,
                          size: 15,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(height: heightSize(84)),
                          const CText(
                            text: 'Congratulations, \nYour LUX Code is ready!',
                            color: kBlackColor,
                            textAlign: TextAlign.center,
                            size: 14,
                            height: 1.3,
                          ),
                          SizedBox(height: heightSize(30)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              item(text: authController.luxCode.value[0]),
                              SizedBox(width: widthSize(8)),
                              item(text: authController.luxCode.value[1]),
                              SizedBox(width: widthSize(8)),
                              item(text: authController.luxCode.value[2]),
                              SizedBox(width: widthSize(8)),
                              item(text: authController.luxCode.value[3]),
                              SizedBox(width: widthSize(8)),
                              item(text: authController.luxCode.value[4]),
                              SizedBox(width: widthSize(8)),
                              item(text: authController.luxCode.value[5]),
                            ],
                          ),
                          SizedBox(height: heightSize(55)),
                          Image.asset(scooter),
                          const Spacer(),

                          //SizedBox(height: heightSize(41)),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0),
                    child: ActionButton(
                      text: 'Copy to Clipboard',
                      callback: () async {
                        ClipboardData data =
                            ClipboardData(text: authController.luxCode.value);
                        await Clipboard.setData(data);
                        cToast(
                            title: "Notice",
                            message: "Your LUX code has been successfully");
                      },
                    ),
                  ),
                  SizedBox(height: heightSize(10)),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0),
                    child: ActionButton(
                      text: 'Sign In',
                      callback: () async {
                        await Storage.setStep(Steps.SIGN_IN);
                        Get.toNamed(Routes.SIGN_IN);
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
    );
  }

  Widget item({required String text}) {
    return Container(
      height: heightSize(44),
      width: widthSize(44),
      decoration: BoxDecoration(
        color: const Color(0xFFD2D7DA),
        borderRadius: BorderRadius.circular(Values().buttonRadius),
        border: Border.all(color: kPrimaryColor),
      ),
      child: Center(
        child: CText(
          text: text,
          size: 22,
          fontFamily: 'Lufga-SemiBold',
          fontWeight: FontWeight.w600,
          color: kBlackColor,
        ),
      ),
    );
  }
}
