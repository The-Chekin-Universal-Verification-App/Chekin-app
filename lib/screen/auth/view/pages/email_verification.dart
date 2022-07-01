import 'dart:async';
import 'dart:developer';

import 'package:chekin/constants/value.dart';
import 'package:chekin/screen/auth/controller/auth_controller.dart';
import 'package:chekin/services/api_calls.dart';
import 'package:chekin/shared/custom_toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:chekin/shared/action_button.dart';
import 'package:chekin/shared/custom_text.dart';
import 'package:chekin/utils/colors.dart';
import 'package:chekin/utils/sizes.dart';
import 'package:pinput/pinput.dart';

class EmailVerify extends StatefulWidget {
  const EmailVerify({Key? key}) : super(key: key);

  @override
  State<EmailVerify> createState() => _EmailVerifyState();
}

class _EmailVerifyState extends State<EmailVerify> {
  AuthController authController = Get.find();
  final FocusNode _pinPutFocusNode = FocusNode();
  TextEditingController controller = TextEditingController();
  Timer? _timer;
  int _start = 20;
  bool counter = false;

  void startTimer() {
    counter = true;
    _start = 20;
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
            counter = false;
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  @override
  void initState() {
    startTimer();
    super.initState();
  }

  @override
  void dispose() {
    _timer!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 60,
      height: 60,
      textStyle: const TextStyle(
        fontSize: 18,
        color: kBlackColor,
        fontFamily: 'Poppins-Medium',
      ),
      decoration: BoxDecoration(
        color: kGreyColor.withOpacity(0.5),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: kGreyColor),
      ),
    );
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
                          text:
                              'Please enter the code sent to your email to verify your account',
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
                          SizedBox(height: heightSize(60)),

                          Container(
                            // margin: const EdgeInsets.all(5.0),
                            padding: const EdgeInsets.only(left: 5.0, right: 5),
                            child: Pinput(
                              controller: controller,
                              //obscureText: "●",
                              separator: const SizedBox(
                                width: 18,
                              ),
                              length: 6,
                              defaultPinTheme: defaultPinTheme,
                              onCompleted: (pin) {
                                if (pin.length == 4) {
                                  authController
                                      .verificationPINController.text = pin;
                                  log(authController
                                      .verificationPINController.text);
                                  setState(() {});
                                } else {
                                  // setState(() {});
                                }
                              },
                              onChanged: (pin) {
                                log(pin);
                                if (pin.length == 6) {
                                  authController
                                      .verificationPINController.text = pin;
                                  log(authController
                                      .verificationPINController.text);
                                  setState(() {});
                                } else {
                                  // setState(() {});
                                }
                              },
                              focusNode: _pinPutFocusNode,
                              //controller: appController.fundPINController,
                            ),
                          ),
                          SizedBox(height: heightSize(20)),
                          counter == true
                              ? CText(
                                  text: 'Resend Code: $_start Secs',
                                  color: kPrimaryColor,
                                  size: 15,
                                  onClick: () async {
                                    if (counter == false) {
                                      startTimer();
                                      var data = {
                                        "email": authController.emailOne.value
                                            .trim(),
                                      };
                                      var req =
                                          await APICalls().resendOTP(data);
                                      log(req.toString());
                                    }
                                  },
                                )
                              : CText(
                                  text: 'Resend Code',
                                  color: kPrimaryColor,
                                  size: 15,
                                  onClick: () async {
                                    if (counter == false) {
                                      startTimer();
                                      var data = {
                                        "email": authController.emailOne.value
                                            .trim(),
                                      };
                                      var req =
                                          await APICalls().resendOTP(data);
                                      log(req.toString());
                                    }
                                  },
                                ),

                          const Spacer(),

                          //SizedBox(height: heightSize(41)),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0),
                    child: Obx(
                      () => ActionButton(
                        text: 'Verify Email',
                        callback: () {
                          if (authController
                              .verificationPINController.text.isEmpty) {
                            cToast(
                                title: "Notice",
                                message: "Enter your verification code");
                          } else {
                            authController.verifyEmail();
                          }
                        },
                        load: authController.load.value,
                      ),
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
